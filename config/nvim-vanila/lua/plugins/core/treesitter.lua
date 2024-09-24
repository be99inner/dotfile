return {
  {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPre", "BufNewFile" },
    build = ":TSUpdate",
    dependencies = {
      { "windwp/nvim-ts-autotag" },
    },
    config = function() require("configs.core.treesitter") end,
  },
}
