local plugins = {
  -- Lazy.git
  {
    "kdheepak/lazygit.nvim",
    cmd = {
      "LazyGit",
      "LazyGitConfig",
      "LazyGitCurrentFile",
      "LazyGitFilter",
      "LazyGitFilterCurrentFile",
    },
    requires = {
      { "nvim-lua/plenary.nvim" },
    },
    keys = {
      { "<leader>gl", "<cmd>LazyGit<cr>", desc = "LazyGit" },
    },
  },
}

return plugins
