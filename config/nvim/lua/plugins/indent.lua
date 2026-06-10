return {
  -- Lightweight indent guides. Disabled for large files by config.bigfile.
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    event = { "BufReadPost", "BufNewFile" },
    opts = {
      indent = {
        char = "│",
        tab_char = "│",
      },
      scope = { enabled = false },
      exclude = {
        filetypes = {
          "help",
          "lazy",
          "mason",
          "neo-tree",
          "notify",
          "terminal",
          "trouble",
        },
      },
    },
    config = function(_, opts)
      local ibl = require("ibl")
      ibl.setup(opts)
      -- Big buffers skip indent guides to keep scrolling responsive.
      vim.api.nvim_create_autocmd("BufReadPost", {
        group = vim.api.nvim_create_augroup("ibl_bigfile_disable", { clear = true }),
        callback = function(args)
          if vim.b[args.buf].bigfile then
            ibl.setup_buffer(args.buf, { enabled = false })
          end
        end,
      })
    end,
  },
  -- Shows the active indentation scope around the cursor.
  {
    "echasnovski/mini.indentscope",
    event = { "BufReadPost", "BufNewFile" },
    opts = {
      symbol = "│",
      options = { try_as_border = true },
    },
    config = function(_, opts)
      require("mini.indentscope").setup(opts)
      -- Disable scope animation/markers in plugin and utility buffers.
      vim.api.nvim_create_autocmd("FileType", {
        group = vim.api.nvim_create_augroup("mini_indentscope_disable", { clear = true }),
        pattern = {
          "help",
          "lazy",
          "mason",
          "neo-tree",
          "notify",
          "terminal",
          "trouble",
        },
        callback = function()
          vim.b.miniindentscope_disable = true
        end,
      })
    end,
  },
}
