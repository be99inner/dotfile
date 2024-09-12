local plugins = {
  -- code completion
  {
    "hrsh7th/nvim-cmp",
    -- cmd = { "LspInfo", "LspLog", "LspStart", "LspStop", "LspRestart" },
    event = "InsertEnter",
    dependencies = {
      -- cmp deps
      { "hrsh7th/cmp-nvim-lsp", lazy = false },
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-nvim-lua",
      "hrsh7th/cmp-path",
      -- lsp dependencies
      { "neovim/nvim-lspconfig" },

      -- snippets
      "rafamadriz/friendly-snippets",
      "saadparwaiz1/cmp_luasnip",
      {
        "L3MON4D3/LuaSnip",
        -- follow latest release.
        version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
        -- install jsregexp (optional!).
        build = "make install_jsregexp",
      },

      -- -- icons
      -- "onsails/lspkind.nvim",
    },

    config = function()
      require("configs.extras.coding.cmp")
    end,

    keys = {
      -- { "<leader>cl", "<cmd>LspInfo<cr>", desc = "Lsp Info" },
      -- { "gd", vim.lsp.buf.definition, desc = "Goto Definition", has = "definition" },
      -- { "gr", vim.lsp.buf.references, desc = "References", nowait = true },
      -- { "gI", vim.lsp.buf.implementation, desc = "Goto Implementation" },
      -- { "gy", vim.lsp.buf.type_definition, desc = "Goto T[y]pe Definition" },
      -- { "gD", vim.lsp.buf.declaration, desc = "Goto Declaration" },
      -- { "K", vim.lsp.buf.hover, desc = "Hover" },
      -- { "gK", vim.lsp.buf.signature_help, desc = "Signature Help", has = "signatureHelp" },
      -- { "<c-k>", vim.lsp.buf.signature_help, mode = "i", desc = "Signature Help", has = "signatureHelp" },
      -- { "<leader>ca", vim.lsp.buf.code_action, desc = "Code Action", mode = { "n", "v" }, has = "codeAction" },
      -- { "<leader>cc", vim.lsp.codelens.run, desc = "Run Codelens", mode = { "n", "v" }, has = "codeLens" },
      -- { "<leader>cC", vim.lsp.codelens.refresh, desc = "Refresh & Display Codelens", mode = { "n" }, has = "codeLens" },
    },
  },
}

return plugins
