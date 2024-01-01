-- stylua
return {
  s("LazyFile", {
    dscr = "Equivalent to LazyFile used in Lazyvim, based on https://github.com/LazyVim/LazyVim/discussions/1583#discussioncomment-7187450",
    t('event = { "BufReadPost", "BufWritePost", "BufNewFile" },'),
  }),
}
