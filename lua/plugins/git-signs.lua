return {
  "lewis6991/gitsigns.nvim",
  event = { "BufEnter" },
  opts = {
    signs = {
      add = { text = "+" },
      change = { text = "~" },
      delete = { text = "-" },
      topdelete = { text = "‾" },
      changedelete = { text = "-~" },
    },
    current_line_blame = true,
  },
}
