local plugins = {
  -- code completion
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      -- cmp deps
      { "hrsh7th/cmp-nvim-lsp" },
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-nvim-lua",
      "hrsh7th/cmp-path",
      -- lsp dependencies
      { "neovim/nvim-lspconfig" },
      { "hrsh7th/cmp-nvim-lsp-signature-help" },
      -- snippets
      "rafamadriz/friendly-snippets",
      "saadparwaiz1/cmp_luasnip",
      {
        "L3MON4D3/LuaSnip",
        version = "v2.*",
        -- install jsregexp (optional!).
        build = "make install_jsregexp",
      },
      -- icons
      "onsails/lspkind.nvim",
    },

    config = function()
      require("configs.extras.coding.cmp")
    end,
  },
}

return plugins
