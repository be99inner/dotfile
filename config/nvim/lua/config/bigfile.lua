local M = {}

-- Thresholds for automatic large-file mode.
M.max_filesize = 1024 * 1024 * 2
M.max_lines = 50000

-- Return file size without reading the file into memory.
local function filesize(path)
  local stat = path and path ~= "" and vim.uv.fs_stat(path) or nil
  return stat and stat.size or 0
end

-- Check whether a buffer is already marked as a large file.
function M.is_big(bufnr)
  bufnr = bufnr or 0
  return vim.b[bufnr].bigfile == true
end

-- Mark regular file buffers as large when they exceed size or line thresholds.
function M.detect(bufnr)
  bufnr = bufnr or 0
  if not vim.api.nvim_buf_is_valid(bufnr) or vim.bo[bufnr].buftype ~= "" then
    return false
  end

  local path = vim.api.nvim_buf_get_name(bufnr)
  local big = filesize(path) > M.max_filesize or vim.api.nvim_buf_line_count(bufnr) > M.max_lines
  if big then
    vim.b[bufnr].bigfile = true
    vim.b[bufnr].disable_autoformat = true
    vim.b[bufnr].miniindentscope_disable = true
  end
  return big
end

-- Apply lightweight buffer/window settings and detach expensive services.
function M.apply(bufnr)
  bufnr = bufnr or 0
  if not M.detect(bufnr) then
    return
  end

  vim.bo[bufnr].swapfile = false
  vim.bo[bufnr].undofile = false
  vim.bo[bufnr].syntax = "OFF"
  vim.bo[bufnr].indentexpr = ""

  vim.api.nvim_buf_call(bufnr, function()
    vim.opt_local.cursorline = false
    vim.opt_local.foldmethod = "manual"
    vim.opt_local.list = false
    vim.opt_local.number = true
    vim.opt_local.relativenumber = false
    vim.opt_local.signcolumn = "no"
    vim.opt_local.spell = false
    vim.opt_local.wrap = false
    vim.opt_local.foldenable = false
  end)

  pcall(vim.treesitter.stop, bufnr)
  vim.diagnostic.enable(false, { bufnr = bufnr })

  for _, client in ipairs(vim.lsp.get_clients({ bufnr = bufnr })) do
    vim.lsp.buf_detach_client(bufnr, client.id)
  end

  vim.b[bufnr].bigfile_notified = true
end

-- Detect large files as early as possible during file read.
vim.api.nvim_create_autocmd({ "BufReadPre", "FileReadPre" }, {
  group = vim.api.nvim_create_augroup("dotfile_bigfile_detect", { clear = true }),
  callback = function(args)
    M.detect(args.buf)
  end,
})

-- Apply large-file mode after the buffer has its contents.
vim.api.nvim_create_autocmd({ "BufReadPost", "FileReadPost" }, {
  group = vim.api.nvim_create_augroup("dotfile_bigfile_apply", { clear = true }),
  callback = function(args)
    M.apply(args.buf)
  end,
})

-- Reapply after filetype detection because filetype plugins can restore syntax.
vim.api.nvim_create_autocmd("FileType", {
  group = vim.api.nvim_create_augroup("dotfile_bigfile_filetype", { clear = true }),
  callback = function(args)
    if M.is_big(args.buf) then
      M.apply(args.buf)
    end
  end,
})

-- Keep syntax disabled even if later syntax autocommands try to enable it.
vim.api.nvim_create_autocmd("Syntax", {
  group = vim.api.nvim_create_augroup("dotfile_bigfile_syntax", { clear = true }),
  callback = function(args)
    if M.is_big(args.buf) and vim.bo[args.buf].syntax ~= "OFF" then
      vim.bo[args.buf].syntax = "OFF"
    end
  end,
})

-- If an LSP attaches after detection, immediately detach it for this buffer.
vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("dotfile_bigfile_lsp_detach", { clear = true }),
  callback = function(args)
    if M.is_big(args.buf) then
      vim.schedule(function()
        if vim.api.nvim_buf_is_valid(args.buf) then
          vim.lsp.buf_detach_client(args.buf, args.data.client_id)
          vim.diagnostic.enable(false, { bufnr = args.buf })
        end
      end)
    end
  end,
})

return M
