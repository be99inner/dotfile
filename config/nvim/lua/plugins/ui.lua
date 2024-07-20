local plugins = {
  {
    "nathom/filetype.nvim",
    lazy = false,
    config = function()
      require "configs.filetype"
    end,
  },
  --- Legacy package for Helm Chart syntax highlighting
  {
    "towolf/vim-helm",
    event = "VeryLazy",
  },
}

return plugins
