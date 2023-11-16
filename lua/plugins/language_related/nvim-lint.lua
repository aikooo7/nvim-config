return {
  "mfussenegger/nvim-lint",
  event = { "BufEnter" },
  opts = {
    linters_bt_ft = {
      javascript = { "eslint_d" },
      typescript = { "eslint_d" },
      lua = { "luacheck" },
    },
  },
  keys = {
    {
      "<leader>ly",
      function()
        require("lint").try_lint()
      end,
      desc = "Mannualy runs linter in current buffer.",
    }
  },
  config = function()
    vim.api.nvim_create_autocmd({ "BufWritePost", "BufEnter", "InsertLeave" }, {
      callback = function()
        require("lint").try_lint()
      end,
    })
  end
}
