return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.1",
		keys = {
			{ "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "find files" },
			{ "<leader>fs", "<cmd>Telescope live_grep<cr>", desc = "find string" },
			{ "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "find buffer" },
			{ "<leader>fc", "<cmd>Telescope grep_string<cr>", desc = "find under cursor" },
		},
		config = function()
			local telescope = require("telescope")
			telescope.load_extension("fzf")
			telescope.setup({
				pickers = {
					find_files = {
						hidden = true,
					},
					live_grep = {
						additional_args = function()
							return { "--hidden" }
						end,
					},
				},
				defaults = {
					file_ignore_patterns = { "node_modules", ".git/" },
				},
			})
		end,
		dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope-fzf-native.nvim" },
	},
	{
		"nvim-telescope/telescope-fzf-native.nvim",
		build = "make", -- dependency for better sorting performance
	},
}
