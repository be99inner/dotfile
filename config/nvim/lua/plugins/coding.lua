return {
  -- Treesitter gives fast syntax highlighting and indentation for normal files.
  {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = ":TSUpdate",
    opts = {
      install_dir = vim.fn.stdpath("data") .. "/site",
      ensure_installed = require("config.languages").default_treesitter,
    },
    config = function(_, opts)
      local treesitter = require("nvim-treesitter")
      local parsers = require("nvim-treesitter.parsers")
      treesitter.setup({ install_dir = opts.install_dir })

      -- Track installs so opening multiple buffers does not duplicate work.
      local installing = {}

      -- Check if Neovim can already load the parser for this language.
      local function has_parser(lang)
        return pcall(vim.treesitter.language.inspect, lang)
      end

      -- Skip pseudo filetypes and unsupported parser names to avoid warnings.
      local function can_install_parser(lang)
        return parsers[lang] ~= nil
      end

      -- Install baseline parsers on startup when they are missing.
      local missing = vim.tbl_filter(function(lang)
        return can_install_parser(lang) and not has_parser(lang)
      end, opts.ensure_installed)
      if #missing > 0 then
        treesitter.install(missing)
      end

      -- Start treesitter and use its indent expression for a specific buffer.
      local function start_treesitter(bufnr, lang)
        if not vim.api.nvim_buf_is_valid(bufnr) then
          return
        end
        pcall(vim.treesitter.start, bufnr, lang)
        vim.bo[bufnr].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
      end

      vim.api.nvim_create_autocmd("FileType", {
        group = vim.api.nvim_create_augroup("auto_install_treesitter", { clear = true }),
        callback = function(args)
          local bufnr = args.buf
          -- Large files stay in cheap editing mode, no parser install/start.
          if vim.b[bufnr].bigfile or vim.bo[bufnr].buftype ~= "" then
            return
          end

          local ft = vim.bo[bufnr].filetype
          local lang = vim.treesitter.language.get_lang(ft) or ft
          if not lang or not can_install_parser(lang) then
            return
          end

          if has_parser(lang) then
            start_treesitter(bufnr, lang)
            return
          end

          if installing[lang] then
            return
          end

          installing[lang] = true
          treesitter.install({ lang }):await(function(err)
            installing[lang] = nil
            if err then
              vim.notify(("Treesitter parser install failed for %s: %s"):format(lang, err), vim.log.levels.WARN)
              return
            end
            vim.schedule(function()
              start_treesitter(bufnr, lang)
            end)
          end)
        end,
      })
    end,
  },

  -- Completion engine with LSP, path, snippet, buffer, and signature help.
  {
    "saghen/blink.cmp",
    version = "*",
    event = "InsertEnter",
    opts = {
      enabled = function()
        return not vim.b.bigfile
      end,
      keymap = {
        preset = "enter",
        ["<C-k>"] = { "select_prev", "fallback" },
        ["<C-j>"] = { "select_next", "fallback" },
        ["<C-s>"] = { "show_signature", "hide_signature", "fallback" },
      },
      appearance = {
        nerd_font_variant = "mono",
      },
      sources = {
        default = { "lsp", "path", "snippets", "buffer" },
      },
      completion = {
        menu = {
          border = "single",
          draw = {
            columns = { { "kind_icon" }, { "label", "label_description", gap = 1 } },
          },
        },
        documentation = { auto_show = true, window = { border = "single" } },
        ghost_text = { enabled = true },
      },
      signature = {
        enabled = true,
        trigger = {
          enabled = true,
          show_on_trigger_character = true,
          show_on_insert_on_trigger_character = true,
          show_on_accept_on_trigger_character = true,
        },
        window = {
          border = "single",
          show_documentation = true,
        },
      },
    },
  },

  -- Formatter integration. Format-on-save is skipped for large files.
  {
    "stevearc/conform.nvim",
    event = "FileType",
    dependencies = { "williamboman/mason.nvim" },
    keys = {
      {
        "<leader>cf",
        function()
          require("conform").format({ async = true, lsp_fallback = true })
        end,
        desc = "Format buffer",
      },
    },
    opts = {
      formatters_by_ft = require("config.languages").formatters_by_ft,
      format_on_save = function(bufnr)
        if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat or vim.b[bufnr].bigfile then
          return
        end
        return { timeout_ms = 1000, lsp_fallback = true }
      end,
    },
    config = function(_, opts)
      local conform = require("conform")
      local languages = require("config.languages")
      local registry = require("mason-registry")
      local installing = {}

      conform.setup(opts)

      -- Install formatter packages for the detected filetype when Mason supports them.
      local function ensure_formatters_for_buffer(bufnr)
        if not vim.api.nvim_buf_is_valid(bufnr) or vim.b[bufnr].bigfile or vim.bo[bufnr].buftype ~= "" then
          return
        end

        local ft = vim.bo[bufnr].filetype
        if ft == "" then
          return
        end

        for _, formatter in ipairs(languages.formatter_names(ft)) do
          local package_name = languages.formatter_packages[formatter]
          if package_name and registry.has_package(package_name) then
            local package = registry.get_package(package_name)
            if not package:is_installed() and not package:is_installing() and not installing[package_name] then
              installing[package_name] = true
              package:install():once("closed", function()
                installing[package_name] = nil
              end)
            end
          end
        end
      end

      vim.api.nvim_create_autocmd("FileType", {
        group = vim.api.nvim_create_augroup("auto_install_formatters", { clear = true }),
        callback = function(args)
          ensure_formatters_for_buffer(args.buf)
        end,
      })

      registry.refresh(vim.schedule_wrap(function()
        for _, bufnr in ipairs(vim.api.nvim_list_bufs()) do
          ensure_formatters_for_buffer(bufnr)
        end
      end))
    end,
  },
}
