-- this file is container plugins that
-- overlap with NvChad
local plugins = {
  -- nvim-tree
  {
    "nvim-tree/nvim-tree.lua",
    opts = require "configs.nvimtree",
  },
  -- lsp-installer
  {
    "williamboman/mason.nvim",
    opts = require "configs.lsp.mason",
  },
  -- treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    opts = require "configs.nvim_treesitter",
  },
  -- gitsigns
  {
    "lewis6991/gitsigns.nvim",
    opts = require "configs.gitsigns",
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lsp.lspconfig"
    end,
  },
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      {
        -- snippet plugin
        "L3MON4D3/LuaSnip",
        dependencies = "rafamadriz/friendly-snippets",
        config = function()
          require "configs.luasnip"
        end,
      },
    },
  },
  -- nvterm
  -- {
  --   "NvChad/nvterm",
  --   opts = require "configs.nvterm",
  -- },
}

return plugins
