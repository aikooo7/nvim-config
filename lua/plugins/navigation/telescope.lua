return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    tag = '0.1.5',
    keys = {
      { "<leader>f", "<cmd>Telescope find_files <cr>", desc = "Fuzzy find files." },
      { "<leader>tf", "<cmd>TodoTelescope<cr>", desc = "Find notes like TODO, NOTE, etc..." },
      { "<leader>gf", "<cmd>Telescope git_files<cr>" },
      { "<leader>ps", "<cmd>Telescope live_grep<cr>", desc = "Fuzzy find all files for a string." },
      { "<leader>vh", "<cmd>Telescope help_tags<cr>", desc = "Fuzzy find help tags based on a string" },
    },
    opts = {
      defaults = {
        vimgrep_arguments = {
          "rg",
          "-L",
          "--color=never",
          "--no-heading",
          "--with-filename",
          "--line-number",
          "--column",
          "--smart-case",
        },
        prompt_prefix = "   ",
        selection_caret = "  ",
        entry_prefix = "  ",
        initial_mode = "insert",
        selection_strategy = "reset",
        sorting_strategy = "ascending",
        layout_strategy = "horizontal",
        layout_config = {
          horizontal = {
            prompt_position = "top",
            preview_width = 0.55,
            results_width = 0.8,
          },
          vertical = {
            mirror = false,
          },
          width = 0.87,
          height = 0.80,
          preview_cutoff = 120,
        },
        file_ignore_patterns = { "node_modules" },
        path_display = { "truncate" },
        winblend = 0,
        border = {},
        borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
      },
    },
    config = function(_, opts)
      local telescope = require("telescope")
      telescope.setup(opts)
      telescope.load_extension("git_worktree")
    end,
  },
}
