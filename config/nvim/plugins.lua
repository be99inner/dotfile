-- Plugins Tables
local plugins = {
  -- syntax highlighting
  {
    "nathom/filetype.nvim",
    config = function()
      require "custom.configs.filetype"
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        -- default
        "vim",
        "lua",

        -- web dev
        "json",

        -- devops
        "hcl",
        "terraform",
        "yaml",
      },
    },
  },
  -- auto toggle relative number
  {
    "nkakouros-original/numbers.nvim",
    lazy = false,
    config = function()
      require "custom.configs.numbers"
    end,
  },
  -- tmux integrations
  {
    "alexghergh/nvim-tmux-navigation",
    lazy = false,
    dependencies = {
      { "tmux-plugins/vim-tmux-focus-events" },
      { "tmux-plugins/vim-tmux" },
    },
    config = function()
      require "custom.configs.tmux"
    end,
  },
  -- lastplace
  {
    "ethanholz/nvim-lastplace",
    lazy = false,
    config = function()
      require "custom.configs.lastplace"
    end,
  },

  -- wakatime plugins
  { "wakatime/vim-wakatime", lazy = false },
  -- editorconfig
  { "gpanders/editorconfig.nvim" },

  -- lsp installer
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "lua-language-server",
        "html-lsp",
        "prettier",
        "stylua",
        "gopls",
        "gofumpt",
        "goimports_revisor",
        "shellcheck",
        "terraform-ls",
        "pyright",
      },
    },
  },
  -- lspconfig
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "jose-elias-alvarez/null-ls.nvim",
      config = function()
        require "custom.configs.null-ls"
      end,
    },

    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },
}

return plugins
