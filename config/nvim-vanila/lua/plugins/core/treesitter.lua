local plugins = {
  {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPre", "BufNewFile" },
    build = ":TSUpdate",
    dependencies = {
      { "windwp/nvim-ts-autotag" },
    },
    config = function()
      -- loading bundle configuration for treesitter
      require("configs.core.treesitter")
    end,
  },
}

return plugins
