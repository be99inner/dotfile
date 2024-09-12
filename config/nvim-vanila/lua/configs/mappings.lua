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
map("n", "<C-s>", "<cmd>w<CR>", { desc = "General Save file" })
map("n", "<C-c>", "<cmd>%y+<CR>", { desc = "General Copy whole file" })
