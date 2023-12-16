return {
	"jay-babu/mason-null-ls.nvim",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"williamboman/mason.nvim",
		"nvimtools/none-ls.nvim",
	},

	opts = function()
		require("mason").setup()
		require("mason-null-ls").setup({
			handlers = {},
		})
		local augroup = vim.api.nvim_create_augroup("none-ls", {})
		local null_ls = require("null-ls")
		null_ls.setup({

			on_init = function(new_client, _)
				new_client.offset_encoding = "utf-16"
			end,

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
