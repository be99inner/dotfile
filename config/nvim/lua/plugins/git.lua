return {
  -- Inline git signs plus hunk staging/reset/preview mappings.
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      signs = {
        add = { text = "▎" },
        change = { text = "▎" },
        delete = { text = "" },
        topdelete = { text = "" },
        changedelete = { text = "▎" },
        untracked = { text = "▎" },
      },
      current_line_blame = false,
      current_line_blame_opts = {
        delay = 500,
        virt_text_pos = "eol",
      },
      preview_config = {
        border = "single",
      },
      on_attach = function(buffer)
        local gs = package.loaded.gitsigns
        -- Buffer-local mappings only exist when the file is inside a git repo.
        local function map(mode, lhs, rhs, desc)
          vim.keymap.set(mode, lhs, rhs, { buffer = buffer, desc = desc })
        end

        map("n", "]h", gs.next_hunk, "Next hunk")
        map("n", "[h", gs.prev_hunk, "Previous hunk")
        map({ "n", "v" }, "<leader>ghs", ":Gitsigns stage_hunk<cr>", "Stage hunk")
        map({ "n", "v" }, "<leader>ghr", ":Gitsigns reset_hunk<cr>", "Reset hunk")
        map("n", "<leader>ghS", gs.stage_buffer, "Stage buffer")
        map("n", "<leader>ghu", gs.undo_stage_hunk, "Undo stage hunk")
        map("n", "<leader>ghR", gs.reset_buffer, "Reset buffer")
        map("n", "<leader>ghp", gs.preview_hunk, "Preview hunk")
        map("n", "<leader>ghb", function()
          gs.blame_line({ full = true })
        end, "Blame line")
        map("n", "<leader>ghB", gs.toggle_current_line_blame, "Toggle line blame")
        map("n", "<leader>ghd", gs.diffthis, "Diff this")
        map("n", "<leader>ght", gs.toggle_deleted, "Toggle deleted")
      end,
    },
  },

  -- Full git status workflow inside Neovim.
  {
    "NeogitOrg/neogit",
    cmd = "Neogit",
    keys = {
      { "<leader>gg", "<cmd>Neogit<cr>", desc = "Git status" },
      { "<leader>gc", "<cmd>Neogit commit<cr>", desc = "Git commit" },
      { "<leader>gA", "<cmd>Neogit commit --amend<cr>", desc = "Git amend" },
      { "<leader>gf", "<cmd>Neogit fetch<cr>", desc = "Git fetch" },
      { "<leader>gp", "<cmd>Neogit pull<cr>", desc = "Git pull" },
      { "<leader>gP", "<cmd>Neogit push<cr>", desc = "Git push" },
      { "<leader>gr", "<cmd>Neogit rebase<cr>", desc = "Git rebase" },
      { "<leader>gt", "<cmd>Neogit stash<cr>", desc = "Git stash" },
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
      "sindrets/diffview.nvim",
      "nvim-telescope/telescope.nvim",
    },
    opts = {
      graph_style = "unicode",
      kind = "tab",
      commit_editor = {
        kind = "split",
        staged_diff_split_kind = "split",
      },
      integrations = {
        diffview = true,
        telescope = true,
      },
    },
  },

  -- Dedicated diff and file-history views for reviewing changes.
  {
    "sindrets/diffview.nvim",
    cmd = {
      "DiffviewOpen",
      "DiffviewClose",
      "DiffviewFileHistory",
      "DiffviewFocusFiles",
      "DiffviewToggleFiles",
    },
    keys = {
      { "<leader>gd", "<cmd>DiffviewOpen<cr>", desc = "Git diff view" },
      { "<leader>gD", "<cmd>DiffviewOpen HEAD~1<cr>", desc = "Git previous commit diff" },
      { "<leader>gH", "<cmd>DiffviewFileHistory %<cr>", desc = "Git file history" },
      { "<leader>gR", "<cmd>DiffviewFileHistory<cr>", desc = "Git repo history" },
      { "<leader>gm", "<cmd>DiffviewOpen --merge<cr>", desc = "Git merge conflicts" },
      { "<leader>gq", "<cmd>DiffviewClose<cr>", desc = "Close diff view" },
    },
    opts = {
      enhanced_diff_hl = true,
      view = {
        merge_tool = {
          layout = "diff3_mixed",
        },
      },
      file_panel = {
        listing_style = "tree",
      },
    },
  },
}
