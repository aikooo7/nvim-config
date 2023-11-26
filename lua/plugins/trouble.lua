return {
  "folke/trouble.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {},
  keys = {
    {
      "<leader>ef",
      "<cmd>TroubleToggle<cr>",
      desc = "Display errors in new buffer.",
    },
  },
}
