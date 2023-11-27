return {
  "simrat39/rust-tools.nvim",
  ft = "rust",
  init = function()
    vim.g.rustfmt_autosave = 1
  end,
  opts = {
    tools = {
      runnables = {
        use_telescope = true,
      },
      inlay_hints = {
        only_current_line = true,
      },
    },
    server = {
      standalone = false,
      settings = {
        ["rust-analyzer"] = {
          -- enable clippy on save
          checkOnSave = {
            command = "clippy",
          },
        },
      },
    },
  },
  config = function(_, opts)
    require("rust-tools").setup(opts)
  end,
}
