local plugins = {
  -- Lsp Installer
  {
    "mason-org/mason.nvim",
    dependencies = {
      { "mason-org/mason-lspconfig.nvim" },            -- Bridge between Mason and lspconfig
      { "neovim/nvim-lspconfig" },                     -- Quickstart configurations for LSP
      { "WhoIsSethDaniel/mason-tool-installer.nvim" }, -- installer
    },
    config = function()
      require "configs.core.mason"

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
