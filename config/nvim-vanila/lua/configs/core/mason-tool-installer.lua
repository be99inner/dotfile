local opts = {
  ensure_installed = {
    "prettier",
    "stylua", -- lua formatter
    "isort",  -- python formatter
    "black",  -- python formatter
    "pylint",
    "eslint_d",
  },
}

return opts
