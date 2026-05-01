local M = {}

-- Extra filetype detection for common project files Neovim may not infer well.
vim.filetype.add({
  extension = {
    env = "dotenv",
    gotmpl = "gotmpl",
    tf = "terraform",
    tfvars = "terraform",
    templ = "templ",
  },
  filename = {
    [".env"] = "dotenv",
    [".env.local"] = "dotenv",
    ["Dockerfile"] = "dockerfile",
  },
  pattern = {
    [".*%.env%.[%w_.-]+"] = "dotenv",
  },
})

-- Baseline parsers installed early so core Neovim files are highlighted.
M.default_treesitter = {
  "lua",
  "vim",
  "vimdoc",
  "query",
  "markdown",
  "markdown_inline",
}

-- Prefer stable, general-purpose LSP servers when multiple servers support a filetype.
M.lsp_by_ft = {
  bash = "bashls",
  c = "clangd",
  cpp = "clangd",
  css = "cssls",
  dockerfile = "dockerls",
  go = "gopls",
  gomod = "gopls",
  gowork = "gopls",
  gotmpl = "gopls",
  html = "html",
  java = "jdtls",
  javascript = "ts_ls",
  javascriptreact = "ts_ls",
  json = "jsonls",
  jsonc = "jsonls",
  kotlin = "kotlin_language_server",
  lua = "lua_ls",
  markdown = "marksman",
  php = "intelephense",
  python = "pyright",
  ruby = "ruby_lsp",
  rust = "rust_analyzer",
  scss = "cssls",
  sh = "bashls",
  svelte = "svelte",
  terraform = "terraformls",
  typescript = "ts_ls",
  typescriptreact = "ts_ls",
  vue = "vue_ls",
  yaml = "yamlls",
}

-- Formatter order is used by conform.nvim. stop_after_first means use the first available formatter.
M.formatters_by_ft = {
  go = { "goimports", "gofmt" },
  javascript = { "prettierd", "prettier", stop_after_first = true },
  json = { "prettierd", "prettier", stop_after_first = true },
  jsonc = { "prettierd", "prettier", stop_after_first = true },
  lua = { "stylua" },
  markdown = { "prettierd", "prettier", stop_after_first = true },
  python = { "black" },
  sh = { "shfmt" },
  terraform = { "terraform_fmt" },
  typescript = { "prettierd", "prettier", stop_after_first = true },
  yaml = { "prettierd", "prettier", stop_after_first = true },
}

-- Mason package names for formatters that are not provided by the language toolchain.
M.formatter_packages = {
  black = "black",
  goimports = "goimports",
  prettier = "prettier",
  prettierd = "prettierd",
  shfmt = "shfmt",
  stylua = "stylua",
}

-- Avoid installing heavy/style-only language servers as generic fallbacks.
M.lsp_fallback_exclude = {
  angularls = true,
  ast_grep = true,
  biome = true,
  codebook = true,
  cssmodules_ls = true,
  dprint = true,
  emmet_language_server = true,
  emmet_ls = true,
  eslint = true,
  grammarly = true,
  harper_ls = true,
  htmx = true,
  ltex = true,
  ltex_plus = true,
  oxlint = true,
  spectral = true,
  stylelint_lsp = true,
  snyk_ls = true,
  tailwindcss = true,
  unocss = true,
  vale_ls = true,
}

-- Return formatter names while ignoring conform.nvim control keys.
function M.formatter_names(ft)
  local formatters = M.formatters_by_ft[ft]
  if not formatters then
    return {}
  end

  local names = {}
  for _, formatter in ipairs(formatters) do
    table.insert(names, formatter)
  end
  return names
end

return M
