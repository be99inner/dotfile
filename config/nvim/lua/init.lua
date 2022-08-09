-- Docs
-- https://github.com/nanotee/nvim-lua-guide

-- Set encoding
vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"

-- UI
vim.opt.termguicolors = true

-- Set cursor line
vim.opt.cursorline = true

-- Default indent
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.shiftround = true
vim.opt.expandtab = true
vim.opt.smartindent = true

-- Set virtualenv for python3
vim.g.python3_host_prog = '~/.virtualenvs/neovim3/bin/python'

-- Map Leader key
vim.g.mapleader = " "

-- Map key to easier to move between windows
vim.api.nvim_set_keymap('n', "<C-h>", "<C-w>h", {})
vim.api.nvim_set_keymap('n', "<C-j>", "<C-w>j", {})
vim.api.nvim_set_keymap('n', "<C-k>", "<C-w>k", {})
vim.api.nvim_set_keymap('n', "<C-l>", "<C-w>l", {})

-- Line Number
vim.opt.number = true
vim.opt.relativenumber = true

-- Wild ignore
vim.opt.wildignore:append { "*/tmp/*","*.so","*.swp","*.zip","*.pyc","*./.terraform/*",".git" }

-- Backup configuration
vim.opt.backup = false
vim.opt.writebackup = false

-- Easy to move of code tabs
-- vnoremap < <gv
-- vnoremap > >gv

-- Make search case insensitive
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Keymap to nohl
vim.api.nvim_set_keymap('n', "<Leader>s", ":nohl<cr>", {silent = true})

-- Set scrolling always show 5 line of header/tail screen
vim.opt.scrolloff = 5

-- Update time
vim.opt.updatetime = 100

-- Clipboard
vim.opt.clipboard = "unnamedplus"
