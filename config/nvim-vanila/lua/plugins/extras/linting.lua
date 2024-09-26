local plugins = {
  {
    "mfussenegger/nvim-lint",
    event = "BufWritePost",
    config = function()
      require("lint").linters_by_ft = {
        -- markdown = { "vale" },
        terraform = { "tflint", "tfsec" },
      }

      -- vim.api.nvim_create_autocmd({ "BufWritePost" }, {
      --   callback = function()
      --     -- try_lint without arguments runs the linters defined in `linters_by_ft`
      --     -- for the current filetype
      --     require("lint").try_lint()
      --
      --     -- You can call `try_lint` with a linter name or a list of names to always
      --     -- run specific linters, independent of the `linters_by_ft` configuration
      --     -- require("lint").try_lint("cspell")
      --   end,
      -- })
    end,
    keys = {
      { "<leader>cL", mode = { "n" }, function() require("lint").try_lint() end, desc = "Linting current buffer" },
    },
  },
}

return plugins
