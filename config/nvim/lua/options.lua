require "nvchad.options"

-- add yours here!

local opt = vim.opt
-- o.cursorlineopt ='both' -- to enable cursorline!

opt.relativenumber = true
-- o.guifont = "JetBrainsMono Nerd Font"
opt.scrolloff = 4
opt.sidescrolloff = 4
opt.eol = true

-- folding
opt.foldenable = true
opt.foldmethod = "expr"
opt.foldcolumn = "1" -- easy to visual which line is folded
opt.foldexpr = "nvim_treesitter#foldexpr()"
opt.foldlevel = 20
opt.foldlevelstart = 12
