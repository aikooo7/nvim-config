return {
  "stevearc/conform.nvim",
  event = { "BufWritePre" },
  opts = {
    -- Define your formatters
    formatters_by_ft = {
      lua = { "stylua" },
      javascript = { { "prettierd", "prettier" } },
      typescript = { { "prettierd", "prettier" } },
    },
    -- Set up format-on-save
    format_on_save = { timeout_ms = 500, lsp_fallback = true },
  },
  keys = {
    {
      "<leader>=",
      function()
        require("conform").format({ async = true, lsp_fallback = true })
      end,
      desc = "Manually runs formatter in current buffer or selection.",
      mode = { "n", "v" }
    },
  },
}
