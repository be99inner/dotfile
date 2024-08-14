-- nvimtree
local options = {
  filesystem_watchers = {
    enable = true,
  },
  git = {
    enable = true,
    ignore = false,
    timeout = 2000,
  },
  renderer = {
    highlight_git = true,
    icons = {
      show = {
        git = true,
        modified = true,
      },
    },
  },
  filters = {
    dotfiles = false,
    git_ignored = false,
    git_clean = false,
    custom = {
      "^.git/$",
    },
  },
}

return options
