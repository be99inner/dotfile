local plugins = {
  -- Tmux integration
  {
    "alexghergh/nvim-tmux-navigation",
    event = "VeryLazy",
    cmd = {
      "NvimTmuxNavigateLeft",
      "NvimTmuxNavigateRight",
      "NvimTmuxNavigateUp",
      "NvimTmuxNavigateDown",
      "NvimTmuxNavigateLastActive",
      "NvimTmuxNavigateNext",
    },
    opts = {
      disabled_when_zoomed = true,
    },
    keys = {
      { "<C-h>",     "<cmd>NvimTmuxNavigateLeft<cr>",       { desc = "Tmux Navigate Left", silent = true } },
      { "<C-j>",     "<cmd>NvimTmuxNavigateDown<cr>",       { desc = "Tmux Navigate Down", silent = true } },
      { "<C-k>",     "<cmd>NvimTmuxNavigateUp<cr>",         { desc = "Tmux Navigate Up", silent = true } },
      { "<C-l>",     "<cmd>NvimTmuxNavigateRight<cr>",      { desc = "Tmux Navigate Right", silent = true } },
      { "<C-\\>",    "<cmd>NvimTmuxNavigateLastActive<cr>", { desc = "Tmux Navigate To Last Active", silent = true } },
      { "<C-Space>", "<cmd>NvimTmuxNavigateNext<cr>",       { desc = "Tmux Navigate Next", silent = true } },
    },
  },
}

return plugins
