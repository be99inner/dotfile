-- Syntax Highlight
require("themer").setup({
  colorscheme = "onedark",
  dim_inactive = true,
  term_colors = true,
  transparent = false,
  styles = {
    ["function"]    = { style = 'italic' },
    functionbuiltin = { style = 'italic' },
    variable        = { style = 'italic' },
    variableBuiltIn = { style = 'italic' },
    parameter       = { style = 'italic' },
  },
  plugins = {
    treesitter = true,
    cmp = true,
    indentline = true,
    lsp = true,
    gitsigns = true,
    telescope = true,
    lualine = true,
  },
})

-- Sytax color
require("nvim-treesitter.configs").setup {
  -- A list of parser names, or "all"
  ensure_installed = { "typescript", "javascript", "lua", "vim", "hcl", "go", "bash", "yaml" },
  -- ensure_installed = "all",

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  auto_install = true,

  -- List of parsers to ignore installing (for "all")
  ignore_install = {},

  highlight = {
    -- `false` will disable the whole extension
    enable = true,

    -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
    -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
    -- the name of the parser)
    -- list of language that will be disabled
    disable = {},

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = true,
  },
  indent = {
    enable = true,
  }
}

-- Line number
vim.wo.number = true
vim.wo.relativenumber = true

-- Status line
require("lualine").setup()

-- Indent line
vim.opt.list = true
-- vim.opt.listchars:append "space:⋅"
vim.opt.listchars:append "eol:↴"

require("indent_blankline").setup {
  -- for example, context is off by default, use this to turn it on
  show_current_context = true,
  show_current_context_start = true,
  space_char_blankline = " ",
}
