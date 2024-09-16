local plugins = {
  -- Tmux
  {
    "alexghergh/nvim-tmux-navigation",
    event = "VeryLazy",
    cmd = { "NvimTmuxNavigateLeft", "NvimTmuxNavigateRight", "NvimTmuxNavigateUp", "NvimTmuxNavigateDown" },
    -- config = function()
    --   require("nvim-tmux-navigation").setup({
    --     disable_when_zoomed = true, -- defaults to false
    --   })
    -- end,
    opts = {
      disabled_when_zoomed = true,
    },
    keys = {
      { "<C-h>", "<cmd>NvimTmuxNavigateLeft<cr>", { desc = "Tmux Navigate Left", silent = false } },
      { "<C-j>", "<cmd>NvimTmuxNavigateDown<cr>", { desc = "Tmux Navigate Down", silent = false } },
      { "<C-k>", "<cmd>NvimTmuxNavigateUp<cr>", { desc = "Tmux Navigate Up", silent = false } },
      { "<C-l>", "<cmd>NvimTmuxNavigateRight<cr>", { desc = "Tmux Navigate Right", silent = false } },
    },
  },
}

return plugins
