-- nvim-treesitter
local opts = {
  ensure_installed = {
    -- default
    "vim",
    "lua",

    -- docker
    "dockerfile",

    -- web dev
    "json",
    "python",
    "go",
    "gomod",
    "gosum",
    "graphql",
    "vue",
    "html",
    "css",
    "javascript",
    "json",

    -- devops
    "hcl",
    "terraform",
    "yaml",
    "groovy",

    -- docs
    "markdown",
    "markdown_inline",
  },
}

return opts
