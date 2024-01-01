return {
  "ThePrimeagen/git-worktree.nvim",
  keys = {
    {
      "<leader>wk",
      "<cmd>lua require('telescope').extensions.git_worktree.git_worktrees()<cr>",
      desc = "Open a git worktree in a interactive way.",
    },
    {
      "<leader>cwk",
      "<cmd>lua require('telescope').extensions.git_worktree.create_git_worktree()<cr>",
      desc = "Create a new git worktree in a interactive way.",
    },
  },
}
-- vim.keymap.set("n", "<Leader>wk", "<CMD>lua require('telescope').extensions.git_worktree.git_worktrees()<CR>", silent)
--vim.keymap.set(
-- 	"n",
--	"<Leader>cwk",
--	"<CMD>lua require('telescope').extensions.git_worktree.create_git_worktree()<CR>",
--	silent
--)
