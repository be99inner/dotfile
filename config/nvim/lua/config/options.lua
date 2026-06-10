local opt = vim.opt

-- Leader keys used by all custom mappings.
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Disable unused providers for faster startup.
vim.g.loaded_node_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_python3_provider = 0
vim.g.loaded_ruby_provider = 0

-- Editing behavior and completion defaults.
opt.autowrite = true
opt.clipboard = "unnamedplus"
opt.completeopt = "menu,menuone,noselect"
opt.confirm = true
opt.expandtab = true
opt.ignorecase = true
opt.inccommand = "split"
opt.list = true
opt.mouse = "a"
opt.pumheight = 10
opt.shiftround = true
opt.shiftwidth = 2
opt.smartcase = true
opt.smartindent = true
opt.tabstop = 2
opt.timeoutlen = 300
opt.undofile = true
opt.updatetime = 200
opt.virtualedit = "block"
opt.wildmode = "longest:full,full"
opt.wrap = false

-- UI defaults for normal-size files. Large files override the expensive pieces.
opt.cursorline = true
opt.laststatus = 3
opt.number = true
opt.relativenumber = true
opt.scrolloff = 4
opt.showmode = false
opt.sidescrolloff = 8
opt.signcolumn = "yes"
opt.termguicolors = true
opt.winminwidth = 5

-- Keep highlighting responsive by limiting very long syntax lines.
opt.redrawtime = 1000
opt.synmaxcol = 300

-- Search and external grep integration.
opt.grepformat = "%f:%l:%c:%m"
opt.grepprg = "rg --vimgrep"

-- Split, session, and fold behavior.
opt.foldenable = false
opt.foldlevel = 99
opt.sessionoptions = { "buffers", "curdir", "tabpages", "winsize", "help", "globals", "skiprtp", "folds" }
opt.splitbelow = true
opt.splitkeep = "screen"
opt.splitright = true

-- Reduce command noise from common startup/completion messages.
opt.shortmess:append({ W = true, I = true, c = true, C = true })

-- Characters used by folds, diffs, and empty buffer lines.
opt.fillchars = {
  foldopen = "",
  foldclose = "",
  fold = " ",
  foldsep = " ",
  diff = "╱",
  eob = " ",
}
