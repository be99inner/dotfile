return {
  -- Improves Lua language server support for Neovim config files.
  {
    "folke/lazydev.nvim",
    ft = "lua",
    opts = {
      library = {
        { path = "luvit-meta/library", words = { "vim%.uv" } },
      },
    },
  },
  { "Bilal2453/luvit-meta", lazy = true },

  -- LSP setup with automatic Mason install based on the current buffer filetype.
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    dependencies = {
      { "williamboman/mason.nvim", config = true },
      "williamboman/mason-lspconfig.nvim",
      "saghen/blink.cmp",
    },
    config = function()
      local languages = require("config.languages")

      -- Respect per-project Go versions from asdf when opening Go projects.
      local function use_golang_version_from_path(path)
        local tool_versions = vim.fs.find(".tool-versions", {
          upward = true,
          path = path or vim.uv.cwd(),
        })[1]

        if not tool_versions then
          return
        end

        for _, line in ipairs(vim.fn.readfile(tool_versions)) do
          local version = line:match("^%s*golang%s+([^%s]+)")
          if version then
            vim.env.ASDF_GOLANG_VERSION = vim.env.ASDF_GOLANG_VERSION or version
            return
          end
        end
      end

      use_golang_version_from_path(vim.uv.cwd())

      -- Capabilities are shared by every server and include blink.cmp completion.
      local capabilities = require("blink.cmp").get_lsp_capabilities()
      capabilities.workspace = capabilities.workspace or {}
      -- Disable file-watch dynamic registration to avoid extra filesystem load.
      capabilities.workspace.didChangeWatchedFiles = {
        dynamicRegistration = false,
      }

      -- Attach buffer-local LSP mappings only after a server starts.
      local function on_attach(_, bufnr)
        local opts = { buffer = bufnr, silent = true }

        -- Some servers do not support declaration, so gD falls back to definition.
        local function supports_method(method)
          for _, client in ipairs(vim.lsp.get_clients({ bufnr = bufnr })) do
            if client:supports_method(method, bufnr) then
              return true
            end
          end
          return false
        end

        local function declaration_or_definition()
          if supports_method("textDocument/declaration") then
            vim.lsp.buf.declaration()
          else
            vim.lsp.buf.definition()
          end
        end

        vim.keymap.set("n", "gD", declaration_or_definition, vim.tbl_extend("force", opts, { desc = "Declaration" }))
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, vim.tbl_extend("force", opts, { desc = "Definition" }))
        vim.keymap.set("n", "K", vim.lsp.buf.hover, vim.tbl_extend("force", opts, { desc = "Hover" }))
        vim.keymap.set("n", "gi", vim.lsp.buf.implementation, vim.tbl_extend("force", opts, { desc = "Implementation" }))
        vim.keymap.set("n", "gr", vim.lsp.buf.references, vim.tbl_extend("force", opts, { desc = "References" }))
        vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, vim.tbl_extend("force", opts, { desc = "Rename" }))
        vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, vim.tbl_extend("force", opts, { desc = "Code action" }))
      end

      vim.lsp.config("*", {
        capabilities = capabilities,
        on_attach = on_attach,
      })

      require("mason-lspconfig").setup({ automatic_enable = false })

      local mason_lspconfig = require("mason-lspconfig")
      local registry = require("mason-registry")
      local installing = {}

      -- Pick a supported Mason LSP server for a filetype.
      local function pick_server(ft)
        local preferred = languages.lsp_by_ft[ft]
        local available = mason_lspconfig.get_available_servers({ filetype = ft })

        if preferred and vim.tbl_contains(available, preferred) then
          return preferred
        end

        for _, server in ipairs(available) do
          if not languages.lsp_fallback_exclude[server] then
            return server
          end
        end
      end

      -- Install and enable the needed LSP for this buffer, except large files.
      local function ensure_lsp_for_buffer(bufnr)
        if not vim.api.nvim_buf_is_valid(bufnr) or vim.b[bufnr].bigfile or vim.bo[bufnr].buftype ~= "" then
          return
        end

        local ft = vim.bo[bufnr].filetype
        if ft == "" then
          return
        end

        local server = pick_server(ft)
        if not server then
          return
        end

        local package_name = mason_lspconfig.get_mappings().lspconfig_to_package[server]
        if not package_name or not registry.has_package(package_name) then
          return
        end

        local package = registry.get_package(package_name)
        if package:is_installed() then
          pcall(vim.lsp.enable, server)
          return
        end

        if installing[package_name] or package:is_installing() then
          return
        end

        if package_name == "gopls" then
          local filename = vim.api.nvim_buf_get_name(bufnr)
          use_golang_version_from_path(filename ~= "" and vim.fs.dirname(filename) or vim.uv.cwd())
        end

        installing[package_name] = true
        package:install():once("closed", function()
          installing[package_name] = nil
          vim.schedule(function()
            if package:is_installed() then
              pcall(vim.lsp.enable, server)
            end
          end)
        end)
      end

      vim.api.nvim_create_autocmd("FileType", {
        group = vim.api.nvim_create_augroup("auto_install_lsp", { clear = true }),
        callback = function(args)
          ensure_lsp_for_buffer(args.buf)
        end,
      })

      registry.refresh(vim.schedule_wrap(function()
        for _, bufnr in ipairs(vim.api.nvim_list_bufs()) do
          ensure_lsp_for_buffer(bufnr)
        end
      end))
    end,
  },
}
