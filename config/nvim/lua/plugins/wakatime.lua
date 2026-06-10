local function path_exists(path)
  return path and path ~= "" and vim.uv.fs_stat(vim.fn.expand(path)) ~= nil
end

-- Load WakaTime only on machines that are already configured for it.
local function has_wakatime_config()
  local config_file = vim.env.WAKATIME_CONFIG_FILE
  if path_exists(config_file) then
    return true
  end

  return path_exists("~/.wakatime.cfg") or path_exists("~/.config/wakatime/.wakatime.cfg")
end

return {
  {
    "wakatime/vim-wakatime",
    enabled = has_wakatime_config,
    lazy = false,
  },
}
