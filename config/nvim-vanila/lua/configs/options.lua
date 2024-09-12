local opt = vim.opt
local o = vim.o
local g = vim.g

------------------------------------- global ---------------------------------

------------------------------------- option ---------------------------------
opt.termguicolors = true -- terminal gui colors

o.updatetime = 250
o.laststatus = 3

o.clipboard = "unnamedplus" -- clipboard
o.cursorline = true -- cursorline
o.cursorlineopt = "number"

-- Indenting
o.expandtab = true
o.shiftwidth = 2
o.smartindent = true
o.tabstop = 2
o.softtabstop = 2

opt.fillchars = { eob = " " }
o.ignorecase = true
o.smartcase = true
o.mouse = "a"
