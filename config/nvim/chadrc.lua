---@type ChadrcConfig
local M = {}
M.ui = {
  theme = "monekai",
  hl_override = {
    Cursor = { bg = "one_bg", fg = "one_bg" },
    CursorLine = { bg = "one_bg" },
  },
  theme = "doomchad",
}
M.plugins = "custom.plugins"
M.mappings = require "custom.mappings"

return M
