return {
	"folke/todo-comments.nvim",
	cmd = { "TodoTrouble", "TodoTelescope" },
	event = { "BufReadPost", "BufWritePost", "BufNewFile" },
	dependencies = { "nvim-lua/plenary.nvim" },
	opts = {
		-- Using default.
	},
}
