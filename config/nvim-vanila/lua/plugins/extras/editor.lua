local plugins = {
  -- Neotree (file explorer)
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    cmd = "Neotree",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
      -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
    },
    opts = require("configs.extras.editor.neotree"),
    keys = {
      { "<leader>e", "<cmd>Neotree toggle<cr>", desc = "Toogle Neotree (file explorer)", mode = "n" },
    },
  },

  -- autopair
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    opts = {
      disable_filetype = { "TelescopePrompt", "vim" },
    },
  },

  -- telescope
  {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    branch = "0.1.x",
    dependencies = {
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
      "nvim-lua/plenary.nvim",
    },
    config = function() require("configs.extras.editor.telescope") end,
    keys = {
      -- files
      { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find file" },
      { "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Find in Files (Grep)" },
      { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Find buffer" },
      { "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Help tags" },
      -- -- git
      { "<leader>gs", "<cmd>Telescope git_status<cr>", desc = "Git status" },
    },
  },

  -- Search and Replace
  {
    "MagicDuck/grug-far.nvim",
    cmd = "GrugFar",
    config = function() require("grug-far").setup({}) end,
    keys = {
      { "<leader>sr", "<cmd>GrugFar<cr>", desc = "Search and Replace" },
    },
  },

  -- Enrich motion on searching
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    vscode = true,
    opts = {},
    keys = {
      { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
      { "S", mode = { "n", "o", "x" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
      { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
      { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
      { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
    },
  },

  -- Comment
  {
    "JoosepAlviste/nvim-ts-context-commentstring",
    config = function() require("configs.extras.editor.ts-context-commentstring") end,
  },

  -- Editor configuration
  {
    "folke/neoconf.nvim",
    cmd = "Neoconf",
    opts = {},
    keys = {
      { "<leader>nc", mode = { "n", "x", "o" }, "<cmd>Neoconf<cr>", desc = "Open Neoconf" },
    },
  },

  -- surround
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    opts = {},
  },

  -- File manager in buffer
  {
    "stevearc/oil.nvim",
    ---@module 'oil'
    ---@type oil.SetupOpts
    opts = {},
    dependencies = { { "echasnovski/mini.icons", opts = {} } },
    -- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if prefer nvim-web-devicons
  },
}

return plugins
