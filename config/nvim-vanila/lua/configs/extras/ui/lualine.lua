local function lsp_list()
  local clients = vim.lsp.get_clients()
  if next(clients) == nil then
    return ""
  end

  local c = {}
  for _, client in pairs(clients) do
    table.insert(c, client.name)
  end
  return table.concat(c, "|")
end

local function LspIcon()
  local active_clients_count = #vim.lsp.get_clients()
  local active_clients = lsp_list()

  return active_clients_count > 0 and " " .. active_clients or ""
end

local function LspStatus()
  return require("lsp-progress").progress({
    format = function(messages)
      return #messages > 0 and table.concat(messages, " ") or ""
    end,
  })
end

require("lualine").setup({
  sections = {
    lualine_a = { "mode" },
    lualine_b = {
      "branch",
      "diff",
    },
    lualine_c = {
      "filename",
      "diagnostics",
      LspIcon,
      LspStatus,
    },
    -- ...,
  },
})

-- listen lsp-progress event and refresh lualine
vim.api.nvim_create_augroup("lualine_augroup", { clear = true })
vim.api.nvim_create_autocmd("User", {
  group = "lualine_augroup",
  pattern = "LspProgressStatusUpdated",
  callback = require("lualine").refresh,
})
