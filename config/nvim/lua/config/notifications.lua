-- Keep the command area quiet during normal editing.
local original_notify = vim.notify
local suppressed_levels = {
  [vim.log.levels.TRACE] = true,
  [vim.log.levels.DEBUG] = true,
  [vim.log.levels.INFO] = true,
}

-- Suppress routine info/progress notifications and collapse duplicate warnings.
local seen = {}
vim.notify = function(message, level, opts)
  level = level or vim.log.levels.INFO
  if suppressed_levels[level] then
    return
  end

  local key = tostring(level) .. ":" .. tostring(message)
  if seen[key] then
    return
  end
  seen[key] = true

  vim.defer_fn(function()
    seen[key] = nil
  end, 10000)

  return original_notify(message, level, opts)
end

-- Hide noisy LSP progress messages; diagnostics and real errors still surface.
vim.lsp.handlers["$/progress"] = function() end
