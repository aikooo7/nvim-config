return {
  "m4xshen/autoclose.nvim",
  event = { "BufReadPost", "BufWritePost", "BufNewFile" },
  init = function()
    require("autoclose").setup()
  end,
}
