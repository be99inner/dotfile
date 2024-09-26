local mason_lspconfig = require("mason-lspconfig")
local nvim_lsp = require("lspconfig")
local capabilities = require("cmp_nvim_lsp").default_capabilities()
local map = vim.keymap.set

-- setup lsp signature helper document
local lsp_signature_opts = {}

-- on attach key binding
local on_attach = function(_, bufnr)
  local function opts(desc) return { buffer = bufnr, desc = "LSP " .. desc } end

  map("n", "gD", vim.lsp.buf.declaration, opts("Go to declaration"))
  map("n", "gd", vim.lsp.buf.definition, opts("Go to definition"))
  map("n", "gi", vim.lsp.buf.implementation, opts("Go to implementation"))
  map("n", "<leader>sh", vim.lsp.buf.signature_help, opts("Show signature help"))
  map("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, opts("Add workspace folder"))
  map("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, opts("Remove workspace folder"))

  map(
    "n",
    "<leader>wl",
    function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end,
    opts("List workspace folders")
  )

  map("n", "<leader>D", vim.lsp.buf.type_definition, opts("Go to type definition"))

  map("n", "<leader>ra", function() require("nvchad.lsp.renamer")() end, opts("NvRenamer"))

  map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts("Code action"))
  map("n", "gr", vim.lsp.buf.references, opts("Show references"))

  -- loading lsp signature
  require("lsp_signature").on_attach(lsp_signature_opts, bufnr)
end

mason_lspconfig.setup_handlers({
  function(server)
    nvim_lsp[server].setup({
      on_attach = on_attach,
      capabilities = capabilities,
    })
  end,
})
