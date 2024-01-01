local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  defaults = {
    lazy = true,
  },
  { import = "plugins.navigation" },
  { import = "plugins.file_system" },
  { import = "plugins.language_related" },
  { import = "plugins.ui" },
  { import = "plugins.general" },
  { import = "plugins.git" },
  { import = "plugins.editor" },
  { import = "plugins.ai" },
  change_detection = { enabled = false },
})
