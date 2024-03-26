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
}

return options
