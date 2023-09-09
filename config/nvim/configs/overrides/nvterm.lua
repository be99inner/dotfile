local opts = {
  terminals = {
    type_opts = {
      float = {
        relative = "editor",
        row = 0.1,
        col = 0.1,
        width = 0.8,
        height = 0.8,
      },
      horizontal = { location = "rightbelow", split_ratio = 0.4 },
      vertical = { location = "rightbelow", split_ratio = 0.5 },
    },
  },
}

return opts
