local opts = {
  -- Content management
  content = {
    -- Function which formats the notification message
    -- By default prepends message with notification time
    -- format = nil,
    --
    format = function(notif)
      return string.format("%s: %s", notif.level, notif.msg)
    end,

    -- Function which orders notification array from most to least important
    -- By default orders first by level and then by update timestamp
    -- sort = nil,
    -- sort = function(notif_arr)
    --   table.sort(notif_arr, function(a, b)
    --     return a.ts_update > b.ts_update
    --   end)
    --   return notif_arr
    -- end,
  },

  -- Notifications about LSP progress
  lsp_progress = {
    -- Whether to enable showing
    enable = true,

    -- Duration (in ms) of how long last message should be shown
    duration_last = 2000,
  },

  -- Window options
  window = {
    -- Floating window config
    config = {
      border = "",
    },

    -- Maximum window width as share (between 0 and 1) of available columns
    max_width_share = 0.382,

    -- Value of 'winblend' option
    winblend = 0,
  },
}

return opts
