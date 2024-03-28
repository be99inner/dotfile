require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

-- easier to enter command mode
map("n", ";", ":", { desc = "CMD enter command mode" })

-- lazygit
map("n", "<leader>gl", ":LazyGit<CR>", { desc = "Open LazyGit" })

-- fast escape from insert mode
map("i", "jk", "<ESC>")

-- fast to move text around
map("v", "<", "<gv", { desc = "Shift Text Left" })
map("v", ">", ">gv", { desc = "Shift Text Right" })
map({ "v", "x" }, "<A-j>", ":move '>+1<CR>gv-gv", { desc = "Move Text Up" })
map({ "v", "x" }, "<A-k>", ":move '<-2<CR>gv-gv", { desc = "Move Text Up" })

-- fast to save
map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

-- tmux integration
map("n", "<C-h>", require("nvim-tmux-navigation").NvimTmuxNavigateLeft)
map("n", "<C-l>", require("nvim-tmux-navigation").NvimTmuxNavigateRight)
map("n", "<C-j>", require("nvim-tmux-navigation").NvimTmuxNavigateDown)
map("n", "<C-k>", require("nvim-tmux-navigation").NvimTmuxNavigateUp)
