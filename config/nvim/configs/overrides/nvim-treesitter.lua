-- nvim-treesitter
local opts = {
  ensure_installed = {
    -- default
    "vim",
    "lua",

    -- web dev
    "json",
    "python",

    -- devops
    "hcl",
    "terraform",
    "yaml",

    -- docs
    "markdown",
  },
}

return opts
