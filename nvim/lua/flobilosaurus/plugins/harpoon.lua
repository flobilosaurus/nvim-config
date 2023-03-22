return {
	"ThePrimeagen/harpoon",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	keys = {
		{ "<leader>ha", ":lua require('harpoon.mark').add_file()<CR>", desc = "harpoon add file" },
		{ "<leader>hq", ":lua require('harpoon.ui').toggle_quick_menu()<CR>", desc = "harpoon quickmenu" },
		{ "<leader>hh", ":lua require('harpoon.ui').nav_next()<CR>", desc = "harpoon next file" },
		{ "<leader>hl", ":lua require('harpoon.ui').nav_prev()<CR>", desc = "harpoon previous file" },
	},
}
