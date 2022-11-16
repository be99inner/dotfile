-- Auto Pairs
require("nvim-autopairs").setup({
  disable_filetype = { "TelescopePrompt", "vim" },
})

-- Guess indent
require("guess-indent").setup {
  auto_cmd = true, -- Set to false to disable automatic execution
  filetype_exclude = { -- A list of filetypes for which the auto command gets disabled
    "netrw",
    "tutor",
  },
  buftype_exclude = { -- A list of buffer types for which the auto command gets disabled
    "help",
    "nofile",
    "terminal",
    "prompt",
  },
}

-- Comment
require("nvim_comment").setup({
  hook = function()
    -- Set comment string for Terraform
    if vim.api.nvim_buf_get_option(0, "filetype") == "terraform" then
      vim.api.nvim_buf_set_option(0, "commentstring", "# %s")
    end
  end
})
vim.api.nvim_buf_set_option(0, "commentstring", "# %s")

-- Tmux
-- initialize plugin
require("nvim-tmux-navigation").setup {
  disable_when_zoomed = true -- default to false
}
-- map key
vim.api.nvim_set_keymap("n", "<C-h>", ":lua require'nvim-tmux-navigation'.NvimTmuxNavigateLeft()<cr>",
  { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-j>", ":lua require'nvim-tmux-navigation'.NvimTmuxNavigateDown()<cr>",
  { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-k>", ":lua require'nvim-tmux-navigation'.NvimTmuxNavigateUp()<cr>",
  { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-l>", ":lua require'nvim-tmux-navigation'.NvimTmuxNavigateRight()<cr>",
  { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-\\>", ":lua require'nvim-tmux-navigation'.NvimTmuxNavigateLastActive()<cr>",
  { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-Space>", ":lua require'nvim-tmux-navigation'.NvimTmuxNavigateNext()<cr>",
  { noremap = true, silent = true })

-- File explorer
require("nvim-tree").setup({
  auto_reload_on_write = true,
  sync_root_with_cwd = true,
  respect_buf_cwd = true,
  sort_by = "case_sensitive",
  reload_on_bufenter = true,
  hijack_unnamed_buffer_when_opening = true,
  view = {
    adaptive_size = true,
    mappings = {
      list = {
        { key = "u", action = "dir_up" },
      },
    },
  },
  renderer = {
    group_empty = false,
    highlight_git = true,
    icons = {
      show = {
        folder_arrow = false,
      },
    },
    indent_markers = {
      enable = true,
      inline_arrows = true,
      icons = {
        corner = "└",
        edge = "│",
        item = "│",
        -- bottom = "─", -- Unknow bottom
        none = " ",
      },
    },
  },
  filters = {
    dotfiles = true,
    custom = { "^\\.git" },
    exclude = {},
  },
  git = {
    timeout = 2000,
  },
  log = {
    enable = true,
    truncate = true,
    types = {
      git = true,
      profile = true,
    },
  },
  filesystem_watchers = {
    enable = true,
    debounce_delay = 100,
  },
})
vim.api.nvim_set_keymap("n", "<Leader>fn", ":NvimTreeToggle<CR>", { noremap = true, silent = true })

-- Fuzzy
local telescope = require("telescope")

telescope.load_extension("themes") -- relate with themer on UI part
telescope.load_extension("command_center")
telescope.load_extension("workspaces") -- workspace

telescope.setup({
  extensions = {
    workspaces = {
      -- keep insert mode after selection in the picker, default is false
      keep_insert = true,
    }
  }
})

vim.api.nvim_set_keymap("n", "<Leader>ff", ":lua require('telescope.builtin').find_files()<cr>",
  { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Leader>fg", ":lua require('telescope.builtin').live_grep()<cr>",
  { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Leader>fb", ":lua require('telescope.builtin').buffers()<cr>",
  { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Leader>fh", ":lua require('telescope.builtin').help_tags()<cr>",
  { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Leader>fw", "<CMD>Telescope workspaces<cr>",
  { noremap = true, silent = true })

-- Quick Scope
-- Trigger a highlight in the appropriate direction when pressing these keys
vim.g.qs_highlight_on_keys = { "f", "F", "t", "T" }

-- Outline
require("symbols-outline").setup({})


-- registers
local registers = require("registers")
registers.setup({
  bind_keys = {
    visual = false
  },
  show_empty = false
})

-- workspace
require("workspaces").setup({
  -- path to a file to store workspaces data in
  -- on a unix system this would be ~/.local/share/nvim/workspaces
  path = vim.fn.stdpath("data") .. "/workspaces",

  -- to change directory for all of nvim (:cd) or only for the current window (:lcd)
  -- if you are unsure, you likely want this to be true.
  global_cd = true,

  -- sort the list of workspaces by name after loading from the workspaces path.
  sort = true,

  -- sort by recent use rather than by name. requires sort to be true
  mru_sort = true,

  -- enable info-level notifications after adding or removing a workspace
  notify_info = true,

  -- lists of hooks to run after specific actions
  -- hooks can be a lua function or a vim command (string)
  -- lua hooks take a name, a path, and an optional state table
  -- if only one hook is needed, the list may be omitted
  hooks = {
    add = {},
    remove = {},
    rename = {},
    open_pre = {},
    open = { "NvimTreeOpen", "Telescope find_files" },
  },
})
