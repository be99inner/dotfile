-- Lazy.nvim configuration
local opts = {
  spec = {
    -- Load core plugins
    { import = "plugins.core" },
    -- Load extras plugins
    { import = "plugins.extras" },
  },
  -- Configure any other settings here. See the documentation for more details.
  -- colorscheme that will be used when installing plugins.
  install = { colorscheme = { "tokyonight", "habamax" } },
  -- automatically check for plugin updates
  checker = { enabled = false },
}

return opts
