return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.1",
		lazy = false,
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
					layout_config = {
						horizontal = {
							prompt_position = "bottom",
							preview_width = 0.55,
						},
						width = 0.85,
						height = 0.80,
					},
				},
			})
			local builtin = require("telescope.builtin")

			vim.api.nvim_create_autocmd("VimEnter", {
				callback = function()
					-- Open file browser if argument is a folder
					local arg = vim.api.nvim_eval("argv(0)")
					if arg and (vim.fn.isdirectory(arg) ~= 0 or arg == "") then
						vim.defer_fn(function()
							builtin.find_files({
								previewer = false,
								prompt_title = "",
								preview_title = "",
								results_title = "",
								hidden = true,
								no_ignore = true,
								layout_config = {
									width = 0.40,
									height = 0.40,
								},
							})
						end, 10)
					end
				end,
			})
		end,
		dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope-fzf-native.nvim" },
	},
	{
		"nvim-telescope/telescope-fzf-native.nvim",
		build = "make", -- dependency for better sorting performance
	},
}
