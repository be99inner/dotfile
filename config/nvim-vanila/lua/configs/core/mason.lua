require("mason").setup({})

require("mason-lspconfig").setup {
  ensure_installed = {
    -- vim,lua
    "lua_ls",
    -- webdev
    "cssls",
    "eslint",
    "html",
    "jsonls",
    "ts_ls",
    "tailwindcss",
    -- python
    "pyright",
    -- golang,
    "gopls",
    -- terraform
    "terraformls",
  },

  automatic_enable = true,
}
