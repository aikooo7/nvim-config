local trouble = require("trouble")

vim.keymap.set("n", "<leader>ef", function()
	trouble.toggle()
end)
