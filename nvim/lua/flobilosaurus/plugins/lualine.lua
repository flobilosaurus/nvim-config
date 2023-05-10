return {
	"nvim-lualine/lualine.nvim",
	config = function()
		require("lualine").setup({
			options = {
				icons_enabled = true,
				-- theme = "catppuccin",
				disabled_filetypes = {},
				component_separators = "|",
				section_separators = { left = "", right = "" },
			},
		})
	end,
}
