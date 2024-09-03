--type conform.options
local options = {
  lsp_fallback = true,

  formatters_by_ft = {
    -- nvim
    lua = { "stylua" },

    -- webdev
    javascript = { "prettier", "eslint_d" },
    javascriptreact = { "prettier", "eslint_d" },
    typescript = { "prettier", "eslint_d" },
    typescriptreact = { "prettier", "eslint_d" },
    css = { "prettier" },
    html = { "prettier" },
    yaml = { "prettier" },
    json = { "prettier" },
    go = { "gofumpt", "goimports_reviser" },

    -- sysadmin
    sh = { "shfmt" },
    terraform = { "terraform_fmt" },
  },

  -- adding same formatter for multiple filetypes can look too much work for some
  -- instead of the above code you could just use a loop! the config is just a table after all!

  -- format_on_save = {
  --   -- These options will be passed to conform.format()
  --   timeout_ms = 2000,
  --   lsp_fallback = true,
  -- },
  -- If this is set, Conform will run the formatter asynchronously after save.
  -- It will pass the table to conform.format().
  -- This can also be a function that returns the table.
  format_after_save = {
    lsp_fallback = true,
  },
}

return options
