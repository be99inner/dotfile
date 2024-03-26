local M = {}
local n_opts = { silent = true }
local v_opts = { silent = true }
-- local t_opts = { silent = true }

M.general = {
  n = {
    ["<C-h>"] = { ":lua require'nvim-tmux-navigation'.NvimTmuxNavigateLeft()<cr>", opts = n_opts },
    ["<C-l>"] = { ":lua require'nvim-tmux-navigation'.NvimTmuxNavigateRight()<cr>", opts = n_opts },
    ["<C-k>"] = { ":lua require'nvim-tmux-navigation'.NvimTmuxNavigateUp()<cr>", opts = n_opts },
    ["<C-j>"] = { ":lua require'nvim-tmux-navigation'.NvimTmuxNavigateDown()<cr>", opts = n_opts },
  },
}

M.git = {
  n = {
    ["<leader>gl"] = { ":LazyGit<cr>", "LazyGit", opts = n_opts },
    ["<A-j>"] = { "<Esc>:m .+1<CR>==gi<Esc>", "Move Text Up", opts = v_opts },
    ["<A-k>"] = { "<Esc>:m .-2<CR>==gi<Esc>", "Move Text Down", opts = v_opts },
  },
}

M.text_moving = {
  v = {
    ["<"] = { "<gv", "Shfit Text Left", opts = v_opts },
    [">"] = { ">gv", "Shift Text Right", opts = v_opts },
    ["<A-j>"] = { ":move '>+1<CR>gv-gv", "Move Text Up", opts = v_opts },
    ["<A-k>"] = { ":move '<-2<CR>gv-gv", "Move Text Down", opts = v_opts },
  },
  x = {
    ["<A-j>"] = { ":move '>+1<CR>gv-gv", "Move Text Up", opts = v_opts },
    ["<A-k>"] = { ":move '<-2<CR>gv-gv", "Move Text Down", opts = v_opts },
  },
}

M.terminal = {
  -- Notes: Unable to remapping this moving
  -- -- better moving on terminal mode
  -- t = {
  --   ["<C-h"] = { "<C-\\><C-N><C-w>h", opts = t_opts },
  --   ["<C-j"] = { "<C-\\><C-N><C-w>j", opts = t_opts },
  --   ["<C-k"] = { "<C-\\><C-N><C-w>k", opts = t_opts },
  --   ["<C-l"] = { "<C-\\><C-N><C-w>l", opts = t_opts },
  -- },
}

return M
