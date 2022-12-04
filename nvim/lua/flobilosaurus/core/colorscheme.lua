local theme = os.getenv("theme")
vim.api.nvim_create_user_command("ToggleColorscheme", function()
	if vim.g.colors_name == "nightfox" then
		pcall(vim.cmd, "colorscheme dayfox")
	else
		pcall(vim.cmd, "colorscheme nightfox")
	end
end, { nargs = 0 })

if theme == "light" then
	pcall(vim.cmd, "colorscheme dayfox")
else
	pcall(vim.cmd, "colorscheme nightfox")
end
