local themeFile = vim.fn.expand("~/.config/nvim/theme")

local function readAll(fileName)
	local f = assert(io.open(fileName, "rb"))
	local content = f:read("*all")
	f:close()
	return content
end

local function reload()
	local currentTheme = readAll(themeFile)
	local light = string.find(currentTheme, "light")
	vim.cmd.colorscheme(light and "catppuccin-latte" or "catppuccin-mocha")
end

local w = vim.loop.new_fs_event()

local on_change

local function watch_file(fname)
	w:start(fname, {}, vim.schedule_wrap(on_change))
end

on_change = function()
	reload()
	-- Debounce: stop/start.
	w:stop()
	watch_file(themeFile)
end

-- reload vim config when background changes
watch_file(themeFile)
reload()
