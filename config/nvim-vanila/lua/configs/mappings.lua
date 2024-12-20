-- remapping key for window jumping
local map = vim.keymap.set

-- fast to move text around
map("v", "<", "<gv", { desc = "Shift Text Left" })
map("v", ">", ">gv", { desc = "Shift Text Right" })
map({ "v", "x" }, "<A-j>", ":move '>+1<CR>gv-gv", { desc = "Move Text Up" })
map({ "v", "x" }, "<A-k>", ":move '<-2<CR>gv-gv", { desc = "Move Text Up" })

-- fast to save
map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

-- easier to enter command mode
map("n", ";", ":", { desc = "CMD enter command mode" })

-- fast to move around window
map("n", "<C-h>", "<C-w>h", { desc = "switch window left" })
map("n", "<C-l>", "<C-w>l", { desc = "switch window right" })
map("n", "<C-j>", "<C-w>j", { desc = "switch window down" })
map("n", "<C-k>", "<C-w>k", { desc = "switch window up" })

-- fast action to save and copy
map("n", "<C-s>", "<cmd>w<cr>", { desc = "General Save file" })
map("n", "<C-c>", "<cmd>%y+<cr>", { desc = "General Copy whole file" })

-- open lazy.nvim
map("n", "<leader>L", "<cmd>Lazy<cr>", { desc = "Open lazy.nvim (package manager)", silent = true })

-- -- easy to exit hlsearch
map("n", "<esc>", "<cmd>nohl<cr>", { desc = "Exit highlight search", silent = true })

-- -- Git keymapping
-- map("n", "<leader>gs", "<cmd>Telescope git_status<cr>", { desc = "Git status", silent = true })
-- map("n", "<leader>gl", "<cmd>LazyGit<cr>", { desc = "Open Git client (LazyGit)", silent = true })
