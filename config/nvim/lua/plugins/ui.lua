local plugins = {
  --- Legacy package for Helm Chart syntax highlighting
  {
    "towolf/vim-helm",
    event = "VeryLazy",
  },
  -- Folding
  {
    "kevinhwang91/nvim-ufo",
    event = "VeryLazy",
    dependencies = {
      "kevinhwang91/promise-async",
    },
    config = function()
      require "configs.ui.nvim_ufo"
    end,
  },
}

return plugins
