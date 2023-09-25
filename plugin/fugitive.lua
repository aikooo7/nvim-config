vim.keymap.set("n", "<leader>gs", vim.cmd.Git)

-- Normal push
local bufnr = vim.api.nvim_get_current_buf()
local opts = {buffer = bufnr, remap = false}
vim.keymap.set("n", "<leader>p", function()
  vim.cmd.Git('push')
end, opts)

-- rebase always
vim.keymap.set("n", "<leader>P", function()
  vim.cmd.Git({'pull',  '--rebase'})
end, opts)


-- Git push -u is very usefull
vim.keymap.set("n", "<leader>t", ":Git push -u origin ", opts);
