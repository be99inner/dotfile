local options = {
  ensure_installed = {
    -- nvim
    "stylua",
    "luacheck",
    "lua-language-server",

    -- webdev
    "prettier",
    "gopls",
    "gofumpt",
    "goimports-reviser",
    "pyright",
    "vue-language-server",
    "html-lsp",
    "typescript-language-server",

    -- sysadmin
    "shellcheck",
    "shfmt",
    "terraform-ls",
    "marksman",
  },
}

return options
