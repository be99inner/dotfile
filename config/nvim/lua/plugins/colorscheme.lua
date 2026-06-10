return {
  -- Main colorscheme. Loaded first so every later plugin can inherit highlights.
  {
    "EdenEast/nightfox.nvim",
    priority = 1000,
    config = function()
      require("nightfox").setup({
        options = {
          transparent = false,
          terminal_colors = true,
          styles = {
            comments = "italic",
            keywords = "bold",
            types = "italic,bold",
          },
        },
      })
      vim.cmd.colorscheme("duskfox")
    end,
  },
}
