-- mason
local opts = {
  ensure_installed = {
    -- lua
    "stylua",
    "luacheck",
    "lua-language-server",

    -- formatter
    "prettier",

    -- golang
    "gopls",
    "gofumpt",
    "goimports-reviser",

    -- shell
    "shellcheck",
    "shfmt",

    -- terraform
    "terraform-ls",

    -- python
    "pyright",

    -- markdown
    "marksman",

    -- js
    "vue-language-server",
    "html-lsp",
  },
}

return opts
