local theme = os.getenv("theme")
vim.api.nvim_create_user_command("ToggleColorscheme", function()
	if vim.g.colors_name == "catppuccin-latte" then
		pcall(vim.cmd, "colorscheme catppuccin-mocha")
	else
		pcall(vim.cmd, "colorscheme catppuccin-latte")
	end
end, { nargs = 0 })

if theme == "light" then
	pcall(vim.cmd, "colorscheme catppuccin-latte")
else
	pcall(vim.cmd, "colorscheme catppuccin-mocha")
end
