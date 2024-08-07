local plugins = {
  -- lastplace
  {
    "ethanholz/nvim-lastplace",
    lazy = false,
    config = function()
      require "configs.lastplace"
    end,
  },
  -- surround
  {
    "kylechui/nvim-surround",
    -- version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
      require "configs.nvim_surround"
    end,
  },
  -- comment
  {
    "JoosepAlviste/nvim-ts-context-commentstring",
    event = "VeryLazy",
    config = function()
      require "configs.nvim_ts_context_commentstring"
    end,
  },
}

return plugins
