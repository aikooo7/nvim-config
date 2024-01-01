return {
  "stevearc/oil.nvim",
  event = "VimEnter",
  opts = {
    default_file_explorer = true,
  },
  config = function(_, opts)
    require("oil").setup(opts)
  end,
  keys = {
    { "<leader>pv", "<cmd>Oil<cr>", desc = "Opens oil in fullscreen" },
  },
  -- Optional dependencies
  dependencies = { "nvim-tree/nvim-web-devicons" },
}
