local plugins = {
  -- the colorscheme should be available when starting Neovim
  {
    "RRethy/base16-nvim",
    version = "*",
    lazy = false,
    priority = 1000,
    config = function()
      -- setup color
      vim.cmd.colorscheme("base16-ayu-dark")
    end,
  },

  -- Icons
  {
    "echasnovski/mini.icons",
    opts = {},
    lazy = true,
    specs = {
      { "nvim-tree/nvim-web-devicons", enabled = false, optional = true },
    },
    init = function()
      package.preload["nvim-web-devicons"] = function()
        require("mini.icons").mock_nvim_web_devicons()
        return package.loaded["nvim-web-devicons"]
      end
    end,
  },

  -- which-key (show mapping keys)
  {
    "folke/which-key.nvim",
    dependencies = {
      "echasnovski/mini.icons",
      { "nvim-tree/nvim-web-devicons", enabled = false },
    },
    event = "VeryLazy",
    opts = require("configs.extras.ui.which-key"),
    keys = {
      {
        "<leader>?",
        function() require("which-key").show({ global = false }) end,
        desc = "Buffer Local Keymaps (which-key)",
      },
    },
  },

  -- Statusbar
  {
    "nvim-lualine/lualine.nvim",
    event = "UIEnter",
    dependencies = {
      -- lsp-progress
      {
        "linrongbin16/lsp-progress.nvim",
        config = function() require("lsp-progress").setup({}) end,
      },
    },
    config = function() require("configs.extras.ui.lualine") end,
  },

  -- Tab
  {
    "akinsho/bufferline.nvim",
    version = "*",
    event = "VeryLazy",
    opts = require("configs.extras.ui.bufferline"),
    dependencies = "nvim-tree/nvim-web-devicons",
    keys = {
      { "<leader>bp", "<Cmd>BufferLineTogglePin<CR>", desc = "Toggle Pin" },
      { "<leader>bP", "<Cmd>BufferLineGroupClose ungrouped<CR>", desc = "Delete Non-Pinned Buffers" },
      { "<leader>bo", "<Cmd>BufferLineCloseOthers<CR>", desc = "Delete Other Buffers" },
      { "<leader>br", "<Cmd>BufferLineCloseRight<CR>", desc = "Delete Buffers to the Right" },
      { "<leader>bl", "<Cmd>BufferLineCloseLeft<CR>", desc = "Delete Buffers to the Left" },
      { "<S-h>", "<cmd>BufferLineCyclePrev<cr>", desc = "Prev Buffer" },
      { "<S-l>", "<cmd>BufferLineCycleNext<cr>", desc = "Next Buffer" },
      { "[b", "<cmd>BufferLineCyclePrev<cr>", desc = "Prev Buffer" },
      { "]b", "<cmd>BufferLineCycleNext<cr>", desc = "Next Buffer" },
      { "[B", "<cmd>BufferLineMovePrev<cr>", desc = "Move buffer prev" },
      { "]B", "<cmd>BufferLineMoveNext<cr>", desc = "Move buffer next" },
    },
  },

  -- Indentline
  {
    -- Add indentation guides even on blank lines
    "lukas-reineke/indent-blankline.nvim",
    -- Enable `lukas-reineke/indent-blankline.nvim`
    -- See `:help ibl`
    main = "ibl",
    opts = require("configs.extras.ui.indent-blankline"),
  },

  -- Colorizer
  {
    "norcalli/nvim-colorizer.lua",
    config = function() require("colorizer").setup({ "*" }) end,
  },

  -- Git Status integrates with UI
  {
    "lewis6991/gitsigns.nvim",
    cmd = { "Gitsigns" },
    event = { "VeryLazy" },
    opts = require("configs.extras.ui.gitsigns"),
  },

  -- Enrich Highlight search
  {
    "kevinhwang91/nvim-hlslens",
    event = "VeryLazy",
    opts = {},
  },

  -- Startup dashboard
  {
    "goolord/alpha-nvim",
    dependencies = { "echasnovski/mini.icons" },
    config = function() require("configs.extras.ui.alpha") end,
  },

  -- Notify
  {
    "echasnovski/mini.notify",
    version = false,
    opts = require("configs.extras.ui.mini-notify"),
  },
}

return plugins
