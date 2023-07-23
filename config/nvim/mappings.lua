local M = {}

M.general = {
  n = {
    ["<C-h>"] = { ":lua require'nvim-tmux-navigation'.NvimTmuxNavigateLeft()<cr>", opts = { silent = true } },
    ["<C-l>"] = { ":lua require'nvim-tmux-navigation'.NvimTmuxNavigateRight()<cr>", opts = { silent = true} },
    ["<C-k>"] = { ":lua require'nvim-tmux-navigation'.NvimTmuxNavigateUp()<cr>", opts = { silent = true} },
    ["<C-j>"] = { ":lua require'nvim-tmux-navigation'.NvimTmuxNavigateDown()<cr>", opts = { silent = true} },
  }
}

return M
