return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.1",
		keys = {
			{ "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
			{ "<leader>fs", "<cmd>Telescope live_grep<cr>", desc = "Find String" },
			{ "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Find Buffer" },
			{ "<leader>fc", "<cmd>Telescope grep_string<cr>", desc = "Find under Cursor" },
		},
		config = function()
			local telescope = require("telescope")
			telescope.load_extension("fzf")
		end,
		dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope-fzf-native.nvim" },
	},
	{
		"nvim-telescope/telescope-fzf-native.nvim",
		build = "make", -- dependency for better sorting performance
	},
}
