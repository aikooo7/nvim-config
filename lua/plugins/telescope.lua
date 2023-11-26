return {
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.2",
    -- or                              , branch = '0.1.x',
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
      { "<leader>gs", false },
      {
        "<leader>f",
        "<cmd>Telescope find_files <cr>",
        desc = "Fuzzy find files.",
      },
      {
        "<leader>nf",
        "<cmd>TodoTelescope<cr>",
        desc = "Find notes like TODO, NOTE, etc...",
      },
      {
        "<leader>gf",
        "<cmd>Telescope git_files<cr>",
        desc = "Fuzzy find files in a git repo.",
      },
      {
        "<leader>ps",
        "<cmd>Telescope live_grep<cr>",
        desc = "Fuzzy find all files for a string.",
      },
      {
        "<leader>vh",
        "<cmd>Telescope help_tags<cr>",
        desc = "Fuzzy find help tags based on a string",
      },
    },
    config = function(_, opts)
      local telescope = require("telescope")
      require("telescope").setup(opts)
      telescope.setup(opts)
    end,
  },
}
