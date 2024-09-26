-- loading commentstring
-- https://github.com/JoosepAlviste/nvim-ts-context-commentstring/wiki/Integrations
--
local get_option = vim.filetype.get_option

---@diagnostic disable-next-line: duplicate-set-field
vim.filetype.get_option = function(filetype, option)
  return option == "commentstring" and require("ts_context_commentstring.internal").calculate_commentstring()
    or get_option(filetype, option)
end
