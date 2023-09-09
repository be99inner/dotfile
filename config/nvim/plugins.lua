-- Plugins Tables
local plugins = {
  -- syntax highlighting
  {
    "nathom/filetype.nvim",
    config = function()
      require "custom.configs.filetype"
    end,
  },
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
  -- lspconfig
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "jose-elias-alvarez/null-ls.nvim",
      config = function()
        require "custom.configs.null-ls"
      end,
    },
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },
}

return plugins
