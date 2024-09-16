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
    -- config = function()
    --   require("nvim-autopairs").setup({
    --     disable_filetype = { "TelescopePrompt", "vim" },
    --   })
    -- end,
    opts = {
      disable_filetype = { "TelescopePrompt", "vim" },
    },
  },

  -- telescope
  {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    branch = "0.1.x",
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
      { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find file" },
      { "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Grep word" },
      { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Find buffer" },
      { "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Help tags" },
    },
  },
}

return plugins
