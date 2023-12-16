return {
	"nvimdev/dashboard-nvim",
	event = "VimEnter",
	opts = {
		theme = "doom",
	},
	config = function(_, opts)
		require("dashboard").setup(opts)
	end,
	dependencies = { { "nvim-tree/nvim-web-devicons" } },
}
