return {
	"NeogitOrg/neogit",
	dependencies = {
		"nvim-lua/plenary.nvim", -- required
		"sindrets/diffview.nvim", -- optional - Diff integration

		"nvim-telescope/telescope.nvim", -- optional
	},
	opts = {
		graph_style = "unicode",
	},
	config = function(_, opts)
		require("neogit").setup(opts)
	end,
	keys = {
		-- Emacs pain
		{ "<leader>gg", "<cmd>Neogit<cr>" },
	},
}
