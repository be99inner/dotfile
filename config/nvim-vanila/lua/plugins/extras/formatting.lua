local plugins = {
{
    "stevearc/conform.nvim",
    dependencies = { "williamboman/mason.nvim" },
    lazy = true,
    cmd = "ConformInfo",
    event = "BufWritePre",
    opts = require "configs.extras.formatting.conform",
    keys = {
      {
        "<leader>cF",
        function()
          require("conform").format({ formatters = { "injected" }, timeout_ms = 3000 })
        end,
        mode = { "n", "v" },
        desc = "Format Injected Langs",
      },
    },

    }
}

return plugins
