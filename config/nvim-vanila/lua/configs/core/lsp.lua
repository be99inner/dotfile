local mason_lspconfig = require("mason-lspconfig")
local nvim_lsp = require("lspconfig")
-- local protocol = require("vim.lsp.protocol")

-- local on_attach = function(client, bufnr)
--   -- format on save
--   if client.server_capabilities.documentFormattingProvider then
--     vim.api.nvim_create_autocmd("BufWritePre", {
--       group = vim.api.nvim_create_augroup("Format", { clear = true }),
--       buffer = bufnr,
--       callback = function()
--         vim.lsp.buf.format()
--       end,
--     })
--   end
-- end

local capabilities = require("cmp_nvim_lsp").default_capabilities()

local on_init = function(client, bufnr)
  if client.name == "lua_ls" then
    return {
      -- settings = {
      --   Lua = {
      --     runtime = { version = "LuaJIT" },
      --     telemetry = { enable = false },
      --     diagnostics = {
      --       globals = { "vim", "require", "pcall", "pairs" },
      --     },
      --     workspace = {
      --       library = vim.api.nvim_get_runtime_file("", true),
      --       checkThirdParty = false,
      --     },
      --     completion = {
      --       workspaceWord = true,
      --       callSnippet = "Replace",
      --     },
      --     hint = {
      --       enable = true,
      --     },
      --     format = {
      --       enable = false,
      --     },
      --   },
      -- },
    }
  end
end

mason_lspconfig.setup_handlers({
  function(server)
    nvim_lsp[server].setup({
      on_init = on_init,
      -- on_attach = on_attach,
      capabilities = capabilities,
    })
  end,
})
