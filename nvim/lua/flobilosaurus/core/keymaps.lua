vim.g.mapleader = " "

local wk = require("which-key")

local keymap = vim.keymap -- for conciseness

-- general keymaps

-- disable arrow keys
-- keymap.set({ "i", "n" }, "<Up>", "")
-- keymap.set({ "i", "n" }, "<Down>", "")
-- keymap.set({ "i", "n" }, "<Left>", "")
-- keymap.set({ "i", "n" }, "<Right>", "")
--
-- keymap.set("i", "jk", "<ESC>")

wk.register({
	n = {
		name = "no",
		h = { ":nohl<CR>", "Turn off highlights" },
	},
}, { prefix = "<leader>" })

keymap.set("n", "x", '"_x') -- dont save deleted char in register

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

-- delete and paste without overwriting register
keymap.set("v", "<leader>p", '"_dP', { noremap = true })

-- save
keymap.set("n", "<c-s>", ":w<CR>")

-- toggle colorscheme
vim.keymap.set({"n", "t"}, "<c-t>", ":ToggleColorscheme<CR>", { noremap = true })

-- tabs
-- wk.register({
-- 	t = {
-- 		name = "tab",
-- 		o = { ":tabnew<CR>", "new" },
-- 		x = { ":tabclose<CR>", "close" },
-- 		n = { ":tabn<CR>", "next" },
-- 		p = { ":tabp<CR>", "previous" },
-- 	},
-- }, { prefix = "<leader>" })

-- plugin keymaps

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
keymap.set("n", "<leader>e", ":Neotree toggle reveal<CR>")

-- telescope
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>") -- find files within current working directory, respects .gitignore
keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>") -- find string in current working directory as you type
keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>") -- find string under cursor in current working directory
keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>") -- list open buffers in current neovim instance
keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>") -- list available help tags

-- telescope git commands
keymap.set("n", "<leader>gc", "<cmd>Telescope git_commits<cr>") -- list all git commits (use <cr> to checkout) ["gc" for git commits]
keymap.set("n", "<leader>gfc", "<cmd>Telescope git_bcommits<cr>") -- list git commits for current file/buffer (use <cr> to checkout) ["gfc" for git file commits]
keymap.set("n", "<leader>gb", "<cmd>Telescope git_branches<cr>") -- list git branches (use <cr> to checkout) ["gb" for git branch]
keymap.set("n", "<leader>gs", "<cmd>Telescope git_status<cr>") -- list current changes per file with diff preview ["gs" for git status]

-- restart lsp server
keymap.set("n", "<leader>rs", ":LspRestart<CR>") -- mapping to restart lsp if necessary

-- toggle float terminal
keymap.set({"n", "t"}, "<A-d>", "<cmd>FloatermToggle<CR>")
