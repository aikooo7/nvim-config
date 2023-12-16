-- [
-- Enable autocompletion for issues/prs (#) and users (@)
--
-- Reference:
--
-- https://github.com/pwntester/octo.nvim#-faq
-- ]

vim.keymap.set("i", "@", "@<C-x><C-o>", { silent = true, buffer = true })
vim.keymap.set("i", "#", "#<C-x><C-o>", { silent = true, buffer = true })
