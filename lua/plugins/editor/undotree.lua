return {
  "mbbill/undotree",
  event = { "BufReadPost", "BufWritePost", "BufNewFile" },
  keys = {
    {
      "<leader>u",
      "<cmd>UndotreeToggle<cr>",
      desc = "Toggles undotree",
    },
  },
}
