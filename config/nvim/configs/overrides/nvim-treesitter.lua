-- nvim-treesitter
local opts = {
  ensure_installed = {
    -- default
    "vim",
    "lua",

    -- git
    "git_config",
    "git_rebase",
    "gitattributes",
    "gitignore",
    "gitcommit",
    "gitattributes",

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
    "typescript",
    "json",

    -- devops
    "bash",
    "hcl",
    "terraform",
    "yaml",
    "groovy",

    -- docs
    "markdown",
    "markdown_inline",

    --etc
    "regex",
  },
}

return opts
