-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Moves selected area also indenting

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- keybinds for buffers

vim.keymap.set("n", "<Tab>", vim.cmd.bnext)
vim.keymap.set("n", "<S-Tab>", vim.cmd.bprevious)
vim.keymap.set("n", "<leader>x", vim.cmd.bd)

-- Telescope keybinds

vim.api.nvim_set_keymap("n", "<leader>f", "<cmd>Telescope find_files <cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>nf", "<cmd>TodoTelescope<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>gf", "<cmd>Telescope git_files<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>ps", "<cmd>Telescope live_grep<cr>", { noremap = true, silent = true })

vim.api.nvim_set_keymap("n", "<leader>f", "<cmd>Telescope find_files <cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>nf", "<cmd>TodoTelescope<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>gf", "<cmd>Telescope git_files<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>ps", "<cmd>Telescope live_grep<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>vh", "<cmd>Telescope help_tags<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>vh", "<cmd>Telescope help_tags<cr>", { noremap = true, silent = true })

