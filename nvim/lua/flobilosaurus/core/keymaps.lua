local setup, wk = pcall(require, "which-key")
if not setup then
	return
end

local keymap = vim.keymap -- for conciseness

-- search
keymap.set("n", "n", "nzzzv", { desc = "next and center screen" })
keymap.set("n", "N", "Nzzzv", { desc = "next (reverse) and center screen" })
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

-- local keymap = vim.keymap.set
--
-- -- LSP finder - Find the symbol's definition
-- -- If there is no definition, it will instead be hidden
-- -- When you use an action in finder like "open vsplit",
-- -- you can use <C-t> to jump back
-- keymap("n", "gh", "<cmd>Lspsaga lsp_finder<CR>")
--
-- -- Code action
-- keymap({ "n", "v" }, "<leader>ca", "<cmd>Lspsaga code_action<CR>")
--
-- -- Rename all occurrences of the hovered word for the entire file
-- keymap("n", "gr", "<cmd>Lspsaga rename<CR>")
--
-- -- Rename all occurrences of the hovered word for the selected files
-- keymap("n", "gr", "<cmd>Lspsaga rename ++project<CR>")
--
-- -- Peek definition
-- -- You can edit the file containing the definition in the floating window
-- -- It also supports open/vsplit/etc operations, do refer to "definition_action_keys"
-- -- It also supports tagstack
-- -- Use <C-t> to jump back
-- keymap("n", "gd", "<cmd>Lspsaga peek_definition<CR>")
--
-- -- Go to definition
-- keymap("n", "gd", "<cmd>Lspsaga goto_definition<CR>")
--
-- -- Peek type definition
-- -- You can edit the file containing the type definition in the floating window
-- -- It also supports open/vsplit/etc operations, do refer to "definition_action_keys"
-- -- It also supports tagstack
-- -- Use <C-t> to jump back
-- keymap("n", "gt", "<cmd>Lspsaga peek_type_definition<CR>")
--
-- -- Go to type definition
-- keymap("n", "gt", "<cmd>Lspsaga goto_type_definition<CR>")
--
-- -- Show line diagnostics
-- -- You can pass argument ++unfocus to
-- -- unfocus the show_line_diagnostics floating window
-- keymap("n", "<leader>sl", "<cmd>Lspsaga show_line_diagnostics<CR>")
--
-- -- Show cursor diagnostics
-- -- Like show_line_diagnostics, it supports passing the ++unfocus argument
-- keymap("n", "<leader>sc", "<cmd>Lspsaga show_cursor_diagnostics<CR>")
--
-- -- Show buffer diagnostics
-- keymap("n", "<leader>sb", "<cmd>Lspsaga show_buf_diagnostics<CR>")
--
-- -- Diagnostic jump
-- -- You can use <C-o> to jump back to your previous location
-- keymap("n", "[e", "<cmd>Lspsaga diagnostic_jump_prev<CR>")
-- keymap("n", "]e", "<cmd>Lspsaga diagnostic_jump_next<CR>")
--
-- -- Diagnostic jump with filters such as only jumping to an error
-- keymap("n", "[E", function()
-- 	require("lspsaga.diagnostic"):goto_prev({ severity = vim.diagnostic.severity.ERROR })
-- end)
-- keymap("n", "]E", function()
-- 	require("lspsaga.diagnostic"):goto_next({ severity = vim.diagnostic.severity.ERROR })
-- end)
--
-- -- Toggle outline
-- keymap("n", "<leader>o", "<cmd>Lspsaga outline<CR>")
--
-- -- Hover Doc
-- -- If there is no hover doc,
-- -- there will be a notification stating that
-- -- there is no information available.
-- -- To disable it just use ":Lspsaga hover_doc ++quiet"
-- -- Pressing the key twice will enter the hover window
-- keymap("n", "K", "<cmd>Lspsaga hover_doc<CR>")
--
-- -- If you want to keep the hover window in the top right hand corner,
-- -- you can pass the ++keep argument
-- -- Note that if you use hover with ++keep, pressing this key again will
-- -- close the hover window. If you want to jump to the hover window
-- -- you should use the wincmd command "<C-w>w"
-- keymap("n", "K", "<cmd>Lspsaga hover_doc ++keep<CR>")
--
-- -- Call hierarchy
-- keymap("n", "<Leader>ci", "<cmd>Lspsaga incoming_calls<CR>")
-- keymap("n", "<Leader>co", "<cmd>Lspsaga outgoing_calls<CR>")
--
-- -- Floating terminal
-- keymap({ "n", "t" }, "<A-d>", "<cmd>Lspsaga term_toggle<CR>")
