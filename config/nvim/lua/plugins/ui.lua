local plugins = {
  {
    "nathom/filetype.nvim",
    lazy = false,
    config = function()
      require "configs.filetype"
    end,
  },
}

return plugins
