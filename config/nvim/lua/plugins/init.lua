-- this file is container plugins that
-- overlap with NvChad
local plugins = {
  -- formatter
  {
    "stevearc/conform.nvim",
    event = "BufWritePre",
    -- config = function()
    --   require "configs.conform"
    -- end,
    opts = require "configs.conform",
  },
  -- nvim-tree
  {
    "nvim-tree/nvim-tree.lua",
    opts = require "configs.nvimtree",
  },
  -- lsp-installer
  {
    "williamboman/mason.nvim",
    opts = require "configs.mason",
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
  -- nvterm
  -- {
  --   "NvChad/nvterm",
  --   opts = require "configs.nvterm",
  -- },
}

return plugins
