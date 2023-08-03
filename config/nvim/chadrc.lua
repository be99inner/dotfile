---@type ChadrcConfig 
--- DirectConfig
local opt = vim.opt
opt.relativenumber = true

--- ChadCustomConfig
local M = {}
M.ui = {
  theme = "gruvchad"
}
M.plugins = "custom.plugins"
M.mappings = require("custom.mappings")

return M
