-- import nvim-treesitter plugin safely
local status, whichkey = pcall(require, "which-key")
if not status then
	return
end

whichkey.setup({})
