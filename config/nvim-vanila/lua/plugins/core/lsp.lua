local plugins = {
  -- lspconfig
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      { "hrsh7th/cmp-nvim-lsp" },
      { "folke/neodev.nvim", opts = {} },

      -- lsp signature document
      { "ray-x/lsp_signature.nvim" },
    },
    config = function()
      -- loading configuration bundle from lsp
      require("configs.core.lsp")
    end,
  },

  -- Lsp Installer
  {
    "williamboman/mason.nvim",
    dependencies = {
      { "williamboman/mason-lspconfig.nvim" }, -- Bridge between Mason and lspconfig
      { "neovim/nvim-lspconfig" }, -- Quickstart configurations for LSP
      { "WhoIsSethDaniel/mason-tool-installer.nvim" }, -- installer
    },
    config = function()
      -- mason lsp installer
      require("mason").setup({
        automatic_installation = true,
        ensure_installed = {
          -- vim,lua
          "lua_ls",

          -- webdev
          "cssls",
          "eslint",
          "html",
          "jsonls",
          "ts_ls",
          "tailwindcss",

          -- python
          "pyright",

          -- golang,
          "gopls",

          -- terraform
          "terraformls",
        },
      })

      -- mason tool installer
      require("mason-tool-installer").setup({
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
      })
    end,
  },
}

return plugins
