return {
	"sindrets/diffview.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	keys = {
		{ "<leader>gx", "<cmd>DiffviewOpen --base=LOCAL<cr>", desc = "Diffview: Show local changes" },
		{
			"<leader>gf",
			"<cmd>DiffviewFileHistory --base=LOCAL %<cr>",
			desc = "Diffview: Show history of current file",
		},
		{
			"<leader>gc",
			"<cmd>DiffviewOpen <C-r><C-w><cr>",
			desc = "Diffview: Show diff of HEAD and commit under cursor",
		},
	},
}
