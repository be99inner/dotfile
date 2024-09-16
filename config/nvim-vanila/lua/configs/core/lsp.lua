local mason_lspconfig = require("mason-lspconfig")
local nvim_lsp = require("lspconfig")
local capabilities = require("cmp_nvim_lsp").default_capabilities()

mason_lspconfig.setup_handlers({
  function(server)
    nvim_lsp[server].setup({
      capabilities = capabilities,
    })
  end,
})
