local plugins = {
  -- formatter
  {
    "stevearc/conform.nvim",
    event = "BufWritePre",
    opts = require "configs.formatting.conform",
  },
}

return plugins
