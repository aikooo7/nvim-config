return {
	{
		"sainnhe/gruvbox-material",
		lazy = false,
		config = function()
      vim.g.gruvbox_material_better_performance = 1
			vim.cmd.colorscheme("gruvbox-material")
		end,
	},
}
