---@type ChadrcConfig 
local M = {}

-- UI Settings
M.ui = {
  theme = "gruvchad"
}

-- Plugins 
M.plugins = "custom.plugins"

-- Key Mapping
M.mappings = require("custom.mappings")

return M
