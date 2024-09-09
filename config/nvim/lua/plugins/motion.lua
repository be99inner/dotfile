local plugins = {
  -- lastplace
  {
    "ethanholz/nvim-lastplace",
    lazy = false,
    config = function()
      require "configs.motion.lastplace"
    end,
  },
  -- surround
  {
    "kylechui/nvim-surround",
    -- version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
      require "configs.motion.nvim_surround"
    end,
  },
  -- comment
  {
    "JoosepAlviste/nvim-ts-context-commentstring",
    event = "VeryLazy",
    config = function()
      require "configs.motion.nvim_ts_context_commentstring"
    end,
  },
  -- search and replace
  {
    "nvim-pack/nvim-spectre",
    event = "VeryLazy",
    -- cmd = "Spectre",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    config = function()
      require "configs.motion.spectre"
    end,
  },
}

return plugins
