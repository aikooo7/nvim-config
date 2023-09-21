local augroup = vim.api.nvim_create_augroup("Lspformatting", {})
local null_ls = require("null-ls")

local opts = {
  sources = {
    null_ls.builtins.diagnostics.eslint,
    null_ls.builtins.formatting.prettier,
  },
  on_attach = function (client, bufnr)
    if client.supports_method("textDocument/formatting") then
      vim.api.nvim_clear_autocmds({
        group = augroup,
        buffer = bufnr
      })
      vim.api.nvim_create_autocmds("BufWritePre", {
        group = augroup,
        bufnr = bufnr,
        callback = function ()
          vim.lsp.buf.format({bufnr = bufnr})
        end,
      })
    end
  end,
}

return opts

