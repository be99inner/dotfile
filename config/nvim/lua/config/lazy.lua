-- Bootstrap lazy.nvim when this dotfile is installed on a fresh machine.
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

local uv = vim.uv or vim.loop
local lazy_root = vim.fn.stdpath("data") .. "/lazy"
local lockfile = vim.fn.stdpath("config") .. "/lazy-lock.json"

local function path_exists(path)
  return uv.fs_stat(path) ~= nil
end

local function is_first_plugin_install()
  local entries = uv.fs_scandir(lazy_root)
  if not entries then
    return true
  end

  while true do
    local name, kind = uv.fs_scandir_next(entries)
    if not name then
      break
    end
    if kind == "directory" and name ~= "lazy.nvim" then
      return false
    end
  end

  return true
end

local should_restore_lockfile = path_exists(lockfile) and is_first_plugin_install()

-- Load core config before plugins so plugin specs can read global defaults.
require("config.options")
require("config.notifications")
require("config.bigfile")
require("config.languages")
require("config.keymaps")
require("config.autocmds")

-- Plugin specs live in lua/plugins/*.lua and are imported as one module group.
require("lazy").setup({
  spec = {
    { import = "plugins" },
  },
  lockfile = lockfile,
  install = {
    missing = not should_restore_lockfile,
    colorscheme = { "habamax" },
  },
  checker = { enabled = true, notify = false },
  change_detection = { notify = false },
  performance = {
    cache = { enabled = true },
    -- Disable built-in plugins that are unused here to reduce startup work.
    rtp = {
      disabled_plugins = {
        "gzip",
        "matchit",
        "matchparen",
        "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
})

if should_restore_lockfile then
  vim.schedule(function()
    require("lazy").restore({ wait = true, show = false })
  end)
end
