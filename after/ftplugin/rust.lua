local opts = {
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
}

require("rust-tools").setup(opts)
