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
    "basedpyright",
    "vue-language-server",
    "html-lsp",
    "typescript-language-server",
    "eslint_d",

    -- sysadmin
    "shellcheck",
    "shfmt",
    "terraform-ls",
    "marksman",
  },
}

return options
