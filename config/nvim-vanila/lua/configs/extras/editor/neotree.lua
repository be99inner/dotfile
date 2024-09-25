-- autocmd to refresh the stage of Neotree
-- hook to update neotree git status when lazygit exits
vim.api.nvim_create_autocmd({ "BufLeave" }, {
  -- Try changing *lazygit* to *term*
  pattern = { "*lazygit*" },
  group = vim.api.nvim_create_augroup("neovim_neotree_update_git_lazygit_event", { clear = true }),
  callback = function()
    -- require("neo-tree.sources.filesystem.commands").refresh(require("neo-tree.sources.manager").get_state("filesystem"))
    local events = require("neo-tree.events")
    events.fire_event(events.GIT_EVENT)
  end,
})
-- hook to update neotree git status when focus is gained
vim.api.nvim_create_autocmd({ "FocusGained" }, {
  group = vim.api.nvim_create_augroup("neovim_neotree_update_git_cmd_event", { clear = true }),
  callback = function()
    local manager = require("neo-tree.sources.manager")
    local renderer = require("neo-tree.ui.renderer")

    local state = manager.get_state("filesystem")
    local window_exists = renderer.window_exists(state)
    if window_exists then
      local events = require("neo-tree.events")
      events.fire_event(events.GIT_EVENT)
      -- events.fire_event(events.FS_EVENT) -- This event is handle by libuv, file creation or deletion is detected.
    end
  end,
})

-- options
local opts = {
  close_if_last_window = true, -- Close Neo-tree if it is the last window left in the tab
  popup_border_style = "rounded",
  enable_git_status = true,
  enable_diagnostics = true,
  open_files_do_not_replace_types = { "terminal", "trouble", "qf" }, -- when opening files, do not use windows containing these filetypes or buftypes
  sort_case_insensitive = false, -- used when sorting files and directories in the tree
  sort_function = nil, -- use a custom function for sorting files and directories in the tree
  git_status = {
    symbols = {
      -- Change type
      added = "✚", -- or "✚", but this is redundant info if you use git_status_colors on the name
      modified = "", -- or "", but this is redundant info if you use git_status_colors on the name
      deleted = "✖", -- this can only be used in the git_status source
      renamed = "󰁕", -- this can only be used in the git_status source
      -- Status type
      untracked = "",
      ignored = "",
      unstaged = "󰄱",
      staged = "",
      conflict = "",
    },
  },
  filesystem = {
    use_libuv_file_watcher = true,
    filtered_items = {
      visible = false,
      hide_dotfiles = false,
      hide_gitignore = true,
      hide_by_name = {},
      never_show = {
        ".git",
        ".DS_Store",
        "thumbs.db",
      },
    },
  },
}

return opts
