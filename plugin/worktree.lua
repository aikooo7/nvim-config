require("git-worktree").setup()

-- Telescope stuff

vim.keymap.set("n", "<Leader>wk", "<CMD>lua require('telescope').extensions.git_worktree.git_worktrees()<CR>", silent)
vim.keymap.set(
	"n",
	"<Leader>cwk",
	"<CMD>lua require('telescope').extensions.git_worktree.create_git_worktree()<CR>",
	silent
)
