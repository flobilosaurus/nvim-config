local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
		vim.cmd([[packadd packer.nvim]])
		return true
	end
	return false
end

local packer_bootstrap = ensure_packer() -- true if packer was just installed

-- Autocommand that reloads neovim whenever you save this file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
  augroup end
]])

local status, packer = pcall(require, "packer")
if not status then
	return
end

return packer.startup(function(use)
	use("wbthomason/packer.nvim")

	-- lua functions that many plugins use
	use("nvim-lua/plenary.nvim")

	use({ "catppuccin/nvim", as = "catppuccin" }) -- color theme

	-- tmux & split window navigation
	use("christoomey/vim-tmux-navigator")

	use("szw/vim-maximizer") --maximizes and restore current window

	use({
		"akinsho/git-conflict.nvim",
		tag = "*",
		config = function()
			require("git-conflict").setup()
		end,
	})
	-- essential plugins
	use("tpope/vim-surround") -- change surrounding symbols
	use("vim-scripts/ReplaceWithRegister")

	-- commenting with gc
	use("numToStr/Comment.nvim")

	-- show indent
	use("lukas-reineke/indent-blankline.nvim")

	-- icons
	use("kyazdani42/nvim-web-devicons")

	--statusLine
	use({
		"nvim-lualine/lualine.nvim",
		requires = { "kyazdani42/nvim-web-devicons", opt = true },
	})

	-- fuzzy finding w/ telescope
	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" }) -- dependency for better sorting performance
	use({ "nvim-telescope/telescope.nvim", branch = "0.1.x" }) -- fuzzy finder

	-- autocompletion
	use("hrsh7th/nvim-cmp") -- completion plugin
	use("hrsh7th/cmp-buffer") -- source for text in buffer
	use("hrsh7th/cmp-path") -- source for file system paths

	-- snippets
	use("L3MON4D3/LuaSnip") -- snippet engine
	use("saadparwaiz1/cmp_luasnip") -- for autocompletion
	use("rafamadriz/friendly-snippets") -- useful snippets

	-- configuring lsp servers
	use("neovim/nvim-lspconfig") -- easily configure language servers
	use("hrsh7th/cmp-nvim-lsp") -- for autocompletion
	use({ "glepnir/lspsaga.nvim", branch = "main" }) -- enhanced lsp uis
	-- use("jose-elias-alvarez/typescript.nvim") -- additional functionality for typescript server (e.g. rename file & update imports)
	use("onsails/lspkind.nvim") -- vs-code like icons for autocompletion

	-- managing & installing lsp servers, linters & formatters
	use("williamboman/mason.nvim") -- in charge of managing lsp servers, linters & formatters
	use("williamboman/mason-lspconfig.nvim") -- bridges gap b/w mason & lspconfig

	-- formatting & linting
	use("jose-elias-alvarez/null-ls.nvim") -- configure formatters & linters
	use("jayp0521/mason-null-ls.nvim") -- bridges gap b/w mason & null-ls
	use("lvimuser/lsp-inlayhints.nvim") -- inlay hints

	use("ray-x/lsp_signature.nvim")

	-- outline
	use("simrat39/symbols-outline.nvim")

	-- treesitter configuration
	use({
		"nvim-treesitter/nvim-treesitter",
		run = function()
			require("nvim-treesitter.install").update({ with_sync = true })
		end,
	})
	use({ "nvim-treesitter/nvim-treesitter-textobjects", after = "nvim-treesitter" })
	use({ "nvim-treesitter/nvim-treesitter-context", after = "nvim-treesitter" })
	-- auto closing
	use("windwp/nvim-autopairs") -- autoclose parens, brackets, quotes, etc...
	use({ "windwp/nvim-ts-autotag", after = "nvim-treesitter" }) -- autoclose tags

	-- git integration
	use("lewis6991/gitsigns.nvim") -- show line modifications on left hand side

	use({ "TimUntersberger/neogit", requires = "nvim-lua/plenary.nvim" })

	-- vim movement game
	use("ThePrimeagen/vim-be-good")

	-- markdown
	use("godlygeek/tabular")
	use("preservim/vim-markdown")

	-- markdown preview
	use({
		"iamcco/markdown-preview.nvim",
		run = function()
			vim.fn["mkdp#util#install"]()
		end,
	})

	-- file explorer
	use({
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v2.x",
		requires = {
			"nvim-lua/plenary.nvim",
			"kyazdani42/nvim-web-devicons", -- not strictly required, but recommended
			"MunifTanjim/nui.nvim",
		},
	})
	-- start screen
	use("goolord/alpha-nvim")

	-- vim test
	use("vim-test/vim-test")

	-- key suggestions
	use("folke/which-key.nvim")

	-- float term
	use("voldikss/vim-floaterm")

	if packer_bootstrap then
		require("packer").sync()
	end
end)
