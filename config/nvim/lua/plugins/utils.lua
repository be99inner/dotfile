local plugins = {
  -- change and custom filetype for file
  {
    "nathom/filetype.nvim",
    event = "VeryLazy",
    config = function()
      require "configs.utils.filetype"
    end,
  },
}

return plugins
