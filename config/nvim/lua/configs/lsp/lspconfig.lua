local configs = require "nvchad.configs.lspconfig"

local servers = {
  -- Lua
  lua_ls = {},
  -- Golang
  gopls = {},
  -- Terraform
  terraformls = {},
  -- Python
  basedpyright = {},

  marksman = {},
  -- React
  vls = {},
  -- TypeScript,JavaScript
  tsserver = {},
  -- Helm.sh Chart
  helm_ls = {},
}

-- lsps with default config
for name, opts in ipairs(servers) do
  opts.on_init = configs.on_init
  opts.on_attach = configs.on_attach
  opts.capabilities = configs.capabilities

  require("lspconfig")[name].setup(opts)
end
