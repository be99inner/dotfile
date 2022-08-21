-- Guess indent
require("guess-indent").setup {
  auto_cmd = true,  -- Set to false to disable automatic execution
  filetype_exclude = {  -- A list of filetypes for which the auto command gets disabled
    "netrw",
    "tutor",
  },
  buftype_exclude = {  -- A list of buffer types for which the auto command gets disabled
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
vim.api.nvim_set_keymap("n", "<C-h>", ":lua require'nvim-tmux-navigation'.NvimTmuxNavigateLeft()<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-j>", ":lua require'nvim-tmux-navigation'.NvimTmuxNavigateDown()<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-k>", ":lua require'nvim-tmux-navigation'.NvimTmuxNavigateUp()<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-l>", ":lua require'nvim-tmux-navigation'.NvimTmuxNavigateRight()<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-\\>", ":lua require'nvim-tmux-navigation'.NvimTmuxNavigateLastActive()<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-Space>", ":lua require'nvim-tmux-navigation'.NvimTmuxNavigateNext()<cr>", { noremap = true, silent = true })

-- File explorer
require("nvim-tree").setup({
  sort_by = "case_sensitive",
  reload_on_bufenter = true,
  view = {
    adaptive_size = true,
    mappings = {
      list = {
        { key = "u", action = "dir_up" },
      },
    },
  },
  renderer = {
    group_empty = true,
    highlight_git = true,
    icons = {
      show = {
        folder_arrow = false,
      }
    },
  },
  filters = {
    dotfiles = true,
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
vim.api.nvim_set_keymap("n", "<Leader>fn",":NvimTreeToggle<CR>", { noremap = true, silent = true })

-- Fuzzy
require("telescope").load_extension("themes") -- relate with themer on UI part
vim.api.nvim_set_keymap("n", "<Leader>ff", ":lua require('telescope.builtin').find_files()<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Leader>fg", ":lua require('telescope.builtin').live_grep()<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Leader>fb", ":lua require('telescope.builtin').buffers()<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Leader>fh", ":lua require('telescope.builtin').help_tags()<cr>", { noremap = true, silent = true })

-- Quick Scope
-- Trigger a highlight in the appropriate direction when pressing these keys
vim.g.qs_highlight_on_keys = { "f", "F", "t", "T" }

-- Outline
require("symbols-outline").setup({})
