local rust = require("rust-tools")

rust.setup({
  tools = {
    runnables = {
      use_telescope = true,
    },
    autoSetFT = true,
    server = {
      settings = {
        ['rust-analyzer'] = {
          cargo = {
            allFeatures = true,
          },
          checkOnSave = {
            enable = true,
            overrideCommand = { "clippy" }
          },
        }
      }
    }
  }
})
