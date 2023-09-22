function ColorMyPencils()
  -- Only way that I found to made it work with gruvbox.
  vim.cmd("let g:gruvbox_transparent_bg = 1")
  vim.cmd("autocmd VimEnter * hi Normal ctermbg=NONE guibg=NONE")

  color = color or "gruvbox"
	vim.cmd.colorscheme(color)

	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

ColorMyPencils();
