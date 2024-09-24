local plugins = {
  -- code completion
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      -- utils
      { "hrsh7th/cmp-buffer" },
      { "https://codeberg.org/FelipeLema/cmp-async-path.git" }, -- path sync instead of "hrsh7th/cmp-path",
      -- lua api
      { "hrsh7th/cmp-nvim-lua" },
      -- lsp dependencies
      { "hrsh7th/cmp-nvim-lsp" },
      { "neovim/nvim-lspconfig" },
      { "hrsh7th/cmp-nvim-lsp-signature-help" },
      -- snippets
      { "rafamadriz/friendly-snippets" },
      { "saadparwaiz1/cmp_luasnip" },
      {
        "L3MON4D3/LuaSnip",
        version = "v2.*",
        -- install jsregexp (optional!).
        build = "make install_jsregexp",
      },
      -- icons
      { "onsails/lspkind.nvim" },
    },

    config = function()
      require("configs.extras.coding.cmp")
    end,
  },
}

return plugins
