local opts = {
  ensure_installed = {
    -- lua
    "stylua",
    "eslint_d",

    -- javascript
    "prettier",

    -- python
    "isort",
    "black",
    "pylint",

    -- terraform
    "tflint",
    "tfsec",
  },
}

return opts
