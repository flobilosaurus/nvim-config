vim.g.mapleader = " "

local setup, wk = pcall(require, "which-key")
if not setup then
	return
end

local keymap = vim.keymap -- for conciseness

-- search
vim.keymap.set("n", "n", "nzzzv", { desc = "next and center screen" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "next (reverse) and center screen" })

wk.register({
	n = {
		name = "no",
		h = { ":nohl<CR>", "Turn off highlights" },
	},
}, { prefix = "<leader>" })

keymap.set("n", "x", '"_x', { desc = "delete char (without putting it in register)" })

-- splits
wk.register({
	s = {
		name = "split",
		v = { "<C-w>v", "vertically" },
		h = { "<C-w>h", "horizontally" },
		e = { "<C-w>=", "make equal" },
		x = { ":close<CR>", "close current" },
		m = { ":MaximizerToggle<CR>", "toggle maximize" },
	},
}, { prefix = "<leader>" })

-- vertical movement remaps
keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Jump half page down and center screen" })
keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Jump half page up and center screen" })

-- search remaps
keymap.set("n", "n", "nzzzv", { desc = "Jump to next search result and and center screen" })
keymap.set("n", "N", "Nzzzv", { desc = "Jump to previous search result and center screen" })
keymap.set("n", "*", "*zz", { desc = "Search word under cursor and center screen" })

keymap.set("v", "<leader>p", '"_dP', { desc = "delete and paste without overwriting register" })

-- save
keymap.set("n", "<c-s>", ":w<CR>", { desc = "save buffer" })

-- toggle colorscheme
keymap.set({ "n", "t" }, "<c-t>", ":ToggleColorscheme<CR>")

-- vim test asf
wk.register({
	t = {
		name = "test",
		t = { ":TestNearest<CR>", "Run tests nearest to cursor" },
		T = { ":TestFile<CR>", "Run all test in file" },
		a = { ":TestSuite<CR>", "Run test suite" },
		l = { ":TestLast<CR>", "Run last tests" },
		g = { ":TestSuite<CR>", "Visit test file of last run tests" },
	},
	{ prefix = "<leader>" },
})
-- neo-tree
keymap.set("n", "<leader>e", ":Neotree toggle reveal<CR>", { desc = "toggle neotree" })

-- telescope
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<CR>", { desc = "find file" })
keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<CR>", { desc = "find string" })
keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<CR>", { desc = "find (string under) cursor" })
keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<CR>", { desc = "list open buffers" })
keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", { desc = "list help tags" })

keymap.set("n", "<leader>gc", "<cmd>Telescope git_commits<CR>", { desc = "show commits" })
keymap.set("n", "<leader>gfc", "<cmd>Telescope git_bcommits<CR>", { desc = "show commits for buffer" })
keymap.set("n", "<leader>gb", "<cmd>Telescope git_branches<CR>", { desc = "show branches" })
keymap.set("n", "<leader>gs", "<cmd>Telescope git_status<CR>", { desc = "git status" })

-- neogit
-- restart lsp server
keymap.set("n", "<leader>rs", ":LspRestart<CR>") -- mapping to restart lsp if necessary

-- toggle float terminal
keymap.set({ "n", "t" }, "<A-d>", "<cmd>FloatermToggle --title=''<CR>")
