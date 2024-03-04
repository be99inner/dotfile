-- Plugins Tables
local plugins = {
  -- better notification
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
      -- add any options here
    },
    dependencies = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      "MunifTanjim/nui.nvim",
      -- OPTIONAL:
      --   `nvim-notify` is only needed, if you want to use the notification view.
      --   If not available, we use `mini` as the fallback
      "rcarriga/nvim-notify",
    },
    config = function()
      require "custom.configs.noice"
    end,
  },
  -- syntax highlighting
  {
    "nathom/filetype.nvim",
    lazy = false,
    config = function()
      require "custom.configs.filetype"
    end,
  },
  -- dotenv
  {
    "ellisonleao/dotenv.nvim",
    config = function()
      require("dotenv").setup {
        enable_on_load = true, -- will load your .env file upon loading a buffer
        verbose = false, -- show e
      }
    end,
  },

  -- treesiterr
  {
    "nvim-treesitter/nvim-treesitter",
    opts = require "custom.configs.overrides.nvim-treesitter",
  },
  -- file explorer
  {
    "nvim-tree/nvim-tree.lua",
    opts = require "custom.configs.overrides.nvimtree",
  },
  -- tmux integrations
  {
    "alexghergh/nvim-tmux-navigation",
    lazy = true,
    dependencies = {
      { "tmux-plugins/vim-tmux-focus-events" },
      { "tmux-plugins/vim-tmux" },
    },
    config = function()
      require "custom.configs.tmux"
    end,
  },
  -- git
  {
    "kdheepak/lazygit.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    cmd = {
      "LazyGit",
      "LazyGitCurrentFile",
      "LazyGitConfig",
    },
  },
  -- terminal
  {
    "NvChad/nvterm",
    opts = require "custom.configs.overrides.nvterm",
  },
  -- lastplace
  {
    "ethanholz/nvim-lastplace",
    lazy = false,
    config = function()
      require "custom.configs.lastplace"
    end,
  },
  -- wakatime plugins
  { "wakatime/vim-wakatime", lazy = false },
  -- editorconfig
  { "gpanders/editorconfig.nvim", lazy = false },

  -- lsp installer
  {
    "williamboman/mason.nvim",
    opts = require "custom.configs.overrides.mason",
  },
  -- formatter
  {
    "stevearc/conform.nvim",
    --  for users those who want auto-save conform + lazyloading!
    event = "BufWritePre",
    config = function()
      require "custom.configs.conform"
    end,
  },
  -- lspconfig
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      -- "jose-elias-alvarez/null-ls.nvim",
      -- config = function()
      --   require "custom.configs.null-ls"
      -- end,
    },
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },
}

return plugins