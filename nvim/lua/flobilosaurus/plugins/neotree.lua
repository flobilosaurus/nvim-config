return {
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v2.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
			"MunifTanjim/nui.nvim",
		},
		keys = {
			{ "<leader>ft", "<cmd>Neotree toggle<cr>", desc = "neotree" },
		},
		opts = {
			close_if_last_window = true, -- Close Neo-tree if it is the last window left in the tab

			filesystem = {
				follow_current_file = true, -- This will find and focus the file in the active buffer every
				filtered_items = {
					visible = true, -- This is what you want: If you set this to `true`, all "hide" just mean "dimmed out"
					hide_dotfiles = false,
					hide_gitignored = true,
				},
			},
			buffers = {
				follow_current_file = true, -- This will find and focus the file in the active buffer every
			},
		},
	},
}
