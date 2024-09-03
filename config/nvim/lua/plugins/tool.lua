local plugins = {
  -- tmux
  {
    "alexghergh/nvim-tmux-navigation",
    dependencies = {
      { "tmux-plugins/vim-tmux-focus-events" },
      { "tmux-plugins/vim-tmux" },
    },
    config = function()
      require "configs.tool.tmux"
    end,
  },
}

return plugins
