return {
	"tpope/vim-fugitive",
	cmd = "Git",
	keys = {
		{ "<leader>gs", "<cmd>Git<cr>" },

		-- Normal push
		{ "<leader>p", "<cmd>Git push<cr>" },

		-- rebase always
		{ "<leader>P", "<cmd>Git push --rebase<cr>" },

		-- Git push -u is very useful
		{ "<leader>t", "<cmd>Git push -u origin<cr>" },

		-- Horizontal and vertical git splitting
		{ "<leader>gv", "<cmd>Gvdiffsplit<cr>" },
		{ "<leader>gh", "<cmd>Ghdiffsplit<cr>" },
	},
}
