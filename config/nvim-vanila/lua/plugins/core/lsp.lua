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
    config = function() require("configs.core.lsp") end,
  },
}

return plugins
