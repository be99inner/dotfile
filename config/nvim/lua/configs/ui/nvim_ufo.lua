local opt = vim.opt

-- folding
opt.foldenable = true
opt.foldmethod = "expr"
opt.foldcolumn = "0" -- easy to visual which line is folded
-- opt.foldexpr = "nvim_treesitter#foldexpr()"
opt.foldlevel = 99
opt.foldlevelstart = 99

-- Setup ufo
require("ufo").setup()
