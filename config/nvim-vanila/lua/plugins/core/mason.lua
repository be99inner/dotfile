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

      require("mason-lspconfig").setup({
        automatic_installation = true,
        ensure_installed = {
          "cssls",
          "eslint",
          "html",
          "jsonls",
          "ts_ls",
          "pyright",
          "tailwindcss",
        },
      })

      require("mason-tool-installer").setup({
        ensure_installed = {
          "prettier",
          "stylua", -- lua formatter
          "isort", -- python formatter
          "black", -- python formatter
          "pylint",
          "eslint_d",
        },
      })
    end,
  },
}

return plugins
