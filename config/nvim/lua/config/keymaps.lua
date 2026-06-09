local map = vim.keymap.set

-- Move by visual lines when no count is provided, useful for wrapped text.
map({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
map({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

-- Common editor actions.
map({ "i", "n", "s" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Escape and clear search" })
map({ "i", "x", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save file" })

-- Window navigation and resizing.
map("n", "<C-h>", "<C-w>h", { desc = "Go to left window", remap = true })
map("n", "<C-j>", "<C-w>j", { desc = "Go to lower window", remap = true })
map("n", "<C-k>", "<C-w>k", { desc = "Go to upper window", remap = true })
map("n", "<C-l>", "<C-w>l", { desc = "Go to right window", remap = true })

map("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase window height" })
map("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease window height" })
map("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease window width" })
map("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase window width" })

-- Move lines or selections without losing indentation/selection.
map("n", "<A-j>", "<cmd>m .+1<cr>==", { desc = "Move line down" })
map("n", "<A-k>", "<cmd>m .-2<cr>==", { desc = "Move line up" })
map("v", "<A-j>", ":m '>+1<cr>gv=gv", { desc = "Move selection down" })
map("v", "<A-k>", ":m '<-2<cr>gv=gv", { desc = "Move selection up" })
map("v", "<", "<gv")
map("v", ">", ">gv")

-- Close the current buffer while keeping the window layout usable.
local function close_buffer(force)
  local current = vim.api.nvim_get_current_buf()
  if vim.bo[current].modified and not force then
    vim.notify("Buffer has unsaved changes. Use force delete to close it.", vim.log.levels.WARN)
    return
  end

  local listed = vim.tbl_filter(function(buf)
    return vim.api.nvim_buf_is_valid(buf) and vim.bo[buf].buflisted
  end, vim.api.nvim_list_bufs())

  if #listed > 1 then
    vim.cmd("bprevious")
  else
    vim.cmd("enew")
  end

  vim.cmd((force and "bdelete! " or "bdelete ") .. current)
end

-- Delete every listed buffer except the current one.
local function close_other_buffers()
  local current = vim.api.nvim_get_current_buf()
  for _, buf in ipairs(vim.api.nvim_list_bufs()) do
    if buf ~= current and vim.api.nvim_buf_is_valid(buf) and vim.bo[buf].buflisted then
      pcall(vim.cmd, "bdelete " .. buf)
    end
  end
end

-- Buffer actions and quick cycling.
map("n", "<leader>bb", "<cmd>Telescope buffers<cr>", { desc = "Switch buffer" })
map("n", "<leader>bn", "<cmd>enew<cr>", { desc = "New buffer" })
map("n", "<leader>bd", function()
  close_buffer(false)
end, { desc = "Delete buffer" })
map("n", "<leader>bD", function()
  close_buffer(true)
end, { desc = "Force delete buffer" })
map("n", "<leader>bo", close_other_buffers, { desc = "Delete other buffers" })
map("n", "<Tab>", "<cmd>bnext<cr>", { desc = "Next buffer" })
map("n", "<S-Tab>", "<cmd>bprevious<cr>", { desc = "Previous buffer" })

-- Tab page management.
map("n", "<leader><tab>n", "<cmd>tabnew<cr>", { desc = "New tab" })
map("n", "<leader><tab>d", "<cmd>tabclose<cr>", { desc = "Close tab" })
map("n", "<leader><tab>o", "<cmd>tabonly<cr>", { desc = "Close other tabs" })
map("n", "<leader><tab>]", "<cmd>tabnext<cr>", { desc = "Next tab" })
map("n", "<leader><tab>[", "<cmd>tabprevious<cr>", { desc = "Previous tab" })

local term = { buf = nil, win = nil }

-- Prefer terminal sessions to start at the current git root.
local function project_root()
  return vim.fs.root(0, ".git") or vim.uv.cwd()
end

local function create_terminal_buffer()
  local buf = vim.api.nvim_create_buf(false, true)
  vim.bo[buf].bufhidden = "hide"
  vim.bo[buf].buflisted = false
  return buf
end

local function start_terminal(buf)
  vim.api.nvim_set_current_buf(buf)
  vim.fn.termopen(vim.o.shell, { cwd = project_root() })
  vim.cmd("startinsert")
end

-- Reuse one floating terminal buffer so shell state survives toggles.
local function toggle_terminal()
  if term.win and vim.api.nvim_win_is_valid(term.win) then
    vim.api.nvim_win_hide(term.win)
    return
  end

  local width = math.floor(vim.o.columns * 0.9)
  local height = math.floor(vim.o.lines * 0.85)
  if not term.buf or not vim.api.nvim_buf_is_valid(term.buf) then
    term.buf = create_terminal_buffer()
  end

  term.win = vim.api.nvim_open_win(term.buf, true, {
    relative = "editor",
    width = width,
    height = height,
    row = math.floor((vim.o.lines - height) / 2),
    col = math.floor((vim.o.columns - width) / 2),
    style = "minimal",
    border = "single",
    title = " terminal ",
    title_pos = "center",
  })

  if vim.bo[term.buf].buftype ~= "terminal" then
    start_terminal(term.buf)
    return
  end
  vim.cmd("startinsert")
end

local function open_split_terminal(split_cmd)
  vim.cmd(split_cmd)
  local buf = create_terminal_buffer()
  vim.api.nvim_win_set_buf(0, buf)
  start_terminal(buf)
end

-- Terminal layouts and terminal-mode navigation.
map("n", "<leader>tt", toggle_terminal, { desc = "Toggle terminal" })
map("n", "<leader>th", function()
  open_split_terminal("botright 15split")
end, { desc = "Horizontal terminal" })
map("n", "<leader>tv", function()
  open_split_terminal("botright vsplit")
end, { desc = "Vertical terminal" })
map("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Enter normal mode" })
map("t", "<C-h>", "<C-\\><C-n><C-w>h", { desc = "Go to left window" })
map("t", "<C-j>", "<C-\\><C-n><C-w>j", { desc = "Go to lower window" })
map("t", "<C-k>", "<C-\\><C-n><C-w>k", { desc = "Go to upper window" })
map("t", "<C-l>", "<C-\\><C-n><C-w>l", { desc = "Go to right window" })

-- Miscellaneous utility mappings.
map("n", "<leader>l", "<cmd>Lazy<cr>", { desc = "Lazy" })
map("n", "<leader>fn", "<cmd>enew<cr>", { desc = "New file" })
map("n", "[q", vim.cmd.cprev, { desc = "Previous quickfix" })
map("n", "]q", vim.cmd.cnext, { desc = "Next quickfix" })
map("n", "<leader>qq", "<cmd>qa<cr>", { desc = "Quit all" })
