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
				},
			})
			local plenary = require("plenary.path")
			local builtin = require("telescope.builtin")
			local themes = require("telescope.themes")

			local dropdown = themes.get_dropdown({
				hidden = true,
				no_ignore = true,
				previewer = false,
				prompt_title = "",
				preview_title = "",
				results_title = "",
				layout_config = { prompt_position = "top" },
			})

			-- File browser always relative to buffer
			local opts_file_browser = vim.tbl_extend("force", dropdown, {
				path = "%:p:h",
			})

			-- Set current folder as prompt title
			local with_title = function(opts, extra)
				extra = extra or {}
				local path = opts.cwd or opts.path or extra.cwd or extra.path or nil
				local title = ""
				local buf_path = vim.fn.expand("%:p:h")
				local cwd = vim.fn.getcwd()
				if path ~= nil and buf_path ~= cwd then
					title = plenary:new(buf_path):make_relative(cwd)
				else
					title = vim.fn.fnamemodify(cwd, ":t")
				end

				return vim.tbl_extend("force", opts, {
					prompt_title = title,
				}, extra or {})
			end
			vim.api.nvim_create_autocmd("VimEnter", {
				callback = function()
					-- Open file browser if argument is a folder
					local arg = vim.api.nvim_eval("argv(0)")
					if arg and (vim.fn.isdirectory(arg) ~= 0 or arg == "") then
						vim.defer_fn(function()
							builtin.find_files(with_title(dropdown))
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
