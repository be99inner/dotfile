local null_ls = require "null-ls"

local formatting = null_ls.builtins.formatting
local lint = null_ls.builtins.diagnostics

-- auto formatting on save
local on_attach = function(client, bufnr)
  if client.supports_method "textDocument/formatting" then
    vim.api.nvim_clear_autocmds {
      group = augroup,
      buffer = bufnr,
    }
    vim.api.nvim_create_autocmd("BufWritePre", {
      group = augroup,
      buffer = bufnr,
      callback = function()
        vim.lsp.buf.format { bufnr = bufnr }
      end,
    })
  end
end

local sources = {
  formatting.prettier,
  formatting.stylua,
  formatting.gofumpt,
  formatting.goimports_reviser,
  lint.shellcheck,
}

null_ls.setup {
  debug = false,
  sources = sources,
  on_attach = on_attach,
}
