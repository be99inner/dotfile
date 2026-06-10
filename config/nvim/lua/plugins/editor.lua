-- Return attached LSP client names for the current buffer.
local function lsp_clients()
  local bufnr = vim.api.nvim_get_current_buf()
  local clients = vim.lsp.get_clients({ bufnr = bufnr })
  if #clients == 0 then
    return ""
  end

  local names = {}
  for _, client in ipairs(clients) do
    table.insert(names, client.name)
  end
  table.sort(names)

  return "LSP " .. table.concat(names, ",")
end

return {
  -- Shared icon dependency used by the UI plugins below.
  { "nvim-tree/nvim-web-devicons", lazy = true },

  -- Shows available keymaps after pressing a prefix such as <leader>.
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      preset = "classic",
      spec = {
        { "<leader><tab>", group = "tabs" },
        { "<leader>b", group = "buffer" },
        { "<leader>c", group = "code" },
        { "<leader>f", group = "file/find" },
        { "<leader>g", group = "git" },
        { "<leader>gh", group = "hunks" },
        { "<leader>q", group = "quit/session" },
        { "<leader>s", group = "search" },
        { "<leader>t", group = "terminal" },
        { "<leader>w", group = "windows" },
        { "<leader>x", group = "diagnostics/quickfix" },
        { "[", group = "prev" },
        { "]", group = "next" },
        { "g", group = "goto" },
      },
    },
  },

  -- Fuzzy finder for files, grep, buffers, help, and git pickers.
  {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
      { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find files" },
      { "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Live grep" },
      { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Buffers" },
      { "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Help tags" },
      { "<leader>gb", "<cmd>Telescope git_branches<cr>", desc = "Git branches" },
      { "<leader>gC", "<cmd>Telescope git_commits<cr>", desc = "Git commits" },
      { "<leader>gs", "<cmd>Telescope git_status<cr>", desc = "Git changed files" },
      { "<leader>gS", "<cmd>Telescope git_stash<cr>", desc = "Git stash" },
    },
    opts = function()
      local actions = require("telescope.actions")
      return {
        defaults = {
          mappings = {
            i = {
              ["<C-j>"] = actions.move_selection_next,
              ["<C-k>"] = actions.move_selection_previous,
            },
          },
        },
      }
    end,
  },

  -- File explorer that follows the current file and watches filesystem changes.
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    cmd = "Neotree",
    keys = {
      { "<leader>e", "<cmd>Neotree toggle<cr>", desc = "Explorer" },
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-tree/nvim-web-devicons",
    },
    opts = {
      filesystem = {
        follow_current_file = { enabled = true },
        use_libuv_file_watcher = true,
      },
      window = {
        width = 32,
      },
    },
  },

  -- Buffer tabline with pinning, ordering, and close helpers.
  {
    "akinsho/bufferline.nvim",
    event = "VeryLazy",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    keys = {
      { "<S-h>", "<cmd>BufferLineCyclePrev<cr>", desc = "Previous buffer" },
      { "<S-l>", "<cmd>BufferLineCycleNext<cr>", desc = "Next buffer" },
      { "[b", "<cmd>BufferLineCyclePrev<cr>", desc = "Previous buffer" },
      { "]b", "<cmd>BufferLineCycleNext<cr>", desc = "Next buffer" },
      { "<leader>bp", "<cmd>BufferLineTogglePin<cr>", desc = "Pin buffer" },
      { "<leader>bP", "<cmd>BufferLineGroupClose ungrouped<cr>", desc = "Close unpinned buffers" },
      { "<leader>bh", "<cmd>BufferLineCloseLeft<cr>", desc = "Close buffers left" },
      { "<leader>bl", "<cmd>BufferLineCloseRight<cr>", desc = "Close buffers right" },
      { "<leader>br", "<cmd>BufferLineMoveNext<cr>", desc = "Move buffer right" },
      { "<leader>bR", "<cmd>BufferLineMovePrev<cr>", desc = "Move buffer left" },
    },
    opts = {
      options = {
        mode = "buffers",
        numbers = "ordinal",
        diagnostics = "nvim_lsp",
        always_show_bufferline = false,
        show_buffer_close_icons = false,
        show_close_icon = false,
        separator_style = "thin",
        offsets = {
          {
            filetype = "neo-tree",
            text = "Explorer",
            text_align = "center",
            separator = true,
          },
        },
      },
    },
  },

  -- Statusline with project branch, diff, diagnostics, attached LSP, and relative filename.
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      options = {
        theme = "auto",
        globalstatus = true,
        component_separators = "",
        section_separators = "",
      },
      sections = {
        lualine_b = { "branch", "diff", "diagnostics" },
        lualine_c = { { "filename", path = 1 } },
        lualine_x = {
          {
            lsp_clients,
            cond = function()
              return #vim.lsp.get_clients({ bufnr = vim.api.nvim_get_current_buf() }) > 0
            end,
            icon = "",
          },
          "encoding",
          "fileformat",
          "filetype",
        },
      },
    },
    config = function(_, opts)
      require("lualine").setup(opts)

      -- Redraw the statusline as soon as LSP clients attach or detach.
      vim.api.nvim_create_autocmd({ "LspAttach", "LspDetach" }, {
        group = vim.api.nvim_create_augroup("lualine_lsp_status", { clear = true }),
        callback = function()
          require("lualine").refresh({ place = { "statusline" } })
        end,
      })
    end,
  },

  -- Diagnostics and quickfix viewer.
  {
    "folke/trouble.nvim",
    cmd = "Trouble",
    keys = {
      { "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", desc = "Diagnostics" },
      { "<leader>xq", "<cmd>Trouble qflist toggle<cr>", desc = "Quickfix" },
    },
    opts = {},
  },

  -- Centralized session management without project-local Session.vim files.
  {
    "folke/persistence.nvim",
    event = "BufReadPre",
    opts = {
      need = 1,
    },
  },
}
