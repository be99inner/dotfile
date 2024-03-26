local plugins = {
  -- wakatime plugins
  { "wakatime/vim-wakatime", lazy = false },
  -- editorconfig
  { "gpanders/editorconfig.nvim", lazy = false },
  -- tmux
  {
    "alexghergh/nvim-tmux-navigation",
    dependencies = {
      { "tmux-plugins/vim-tmux-focus-events" },
      { "tmux-plugins/vim-tmux" },
    },
    config = function()
      require "configs.tmux"
    end,
  },
}

return plugins
