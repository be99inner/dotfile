local opts = {
  automatic_installation = true,
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
  },
}

return opts
