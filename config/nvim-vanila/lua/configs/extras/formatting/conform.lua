local opts = {
  lsp_fallback = true,
  formatters_by_ft = {
    lua = { "stylua" },
    go = { "goimports-reviser", "gofmt" },
    rust = { "rustfmt", lsp_format = "fallback" },
    terraform = { "tflint", lsp_fallback = "fallback" },
    python = { "isort", "black", "pylint" },
    javascript = { "prettierd", "prettier", stop_after_first = true },

    -- Use the "_" filetype to run formatters on filetypes that don't
    -- have other formatters configured.
    ["_"] = { "trim_whitespace" },
  },
  format_on_save = {
    -- I recommend these options. See :help conform.format for details.
    lsp_format = "fallback",
    timeout_ms = 1200,
  },
  default_format_opts = {
    lsp_format = "fallback",
  },
  log_level = vim.log.levels.ERROR,
}

return opts
