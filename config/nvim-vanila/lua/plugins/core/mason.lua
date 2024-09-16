local plugins = {
  -- Mason Lsp Installer
  {
    "williamboman/mason.nvim",
    dependencies = {
      "williamboman/mason-lspconfig.nvim", -- Bridge between Mason and lspconfig
      "neovim/nvim-lspconfig", -- Quickstart configurations for LSP
      "WhoIsSethDaniel/mason-tool-installer.nvim", -- installer
    },
    config = function()
      require("mason").setup()

      local mason_lspconfig_opts = require("configs.core.mason-lspconfig")
      require("mason-lspconfig").setup(mason_lspconfig_opts)

      local mason_tool_installer_opts = require("configs.core.mason-tool-installer")
      require("mason-tool-installer").setup(mason_tool_installer_opts)
    end,
  },
}

return plugins
