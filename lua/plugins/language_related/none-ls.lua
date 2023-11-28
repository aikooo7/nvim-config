return {
	"nvimtools/none-ls.nvim",
	event = { "BufReadPost", "BufWritePost", "BufNewFile" },
	keys = {
		{
			"<leader>ca",
			function()
				vim.lsp.buf.code_action()
			end,
		},
	},
	opts = function()
		local augroup = vim.api.nvim_create_augroup("none-ls", {})
		local null_ls = require("null-ls")
		null_ls.setup({
			sources = {
				null_ls.builtins.formatting.stylua,
				null_ls.builtins.formatting.prettierd.with({
					disabled_filetypes = { "lua" },
				}),
				null_ls.builtins.diagnostics.eslint_d,
				null_ls.builtins.diagnostics.typos,
				null_ls.builtins.diagnostics.write_good,
				null_ls.builtins.code_actions.gitsigns,
			},
			on_attach = function(client, bufnr)
				if client.supports_method("textDocument/formatting") then
					vim.api.nvim_clear_autocmds({
						group = augroup,
						buffer = bufnr,
					})
					vim.api.nvim_create_autocmd("BufWritePre", {
						group = augroup,
						buffer = bufnr,
						callback = function()
							vim.lsp.buf.format({ bufnr = bufnr })
						end,
					})
				end
			end,
		})
	end,
}
