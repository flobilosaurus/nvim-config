return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		require("nvim-treesitter.configs").setup({
			-- enable syntax highlighting
			highlight = {
				enable = true,
			},
			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "gnn", -- set to `false` to disable one of the mappings
					node_incremental = "grn",
					scope_incremental = "grc",
					node_decremental = "grm",
				},
			},
			-- textobjects
			textobjects = {
				select = {
					enable = true,
					lookahead = true,
					keymaps = {
						["af"] = "@function.outer",
						["if"] = "@function.inner",
						["ac"] = "@class.outer",
						["ic"] = "@class.inner",
					},
				},
				move = {
					enable = true,
					set_jumps = true, -- whether to set jumps in the jumplist
					goto_next_start = {
						["]m"] = "@function.outer",
						["]]"] = { query = "@class.outer", desc = "next class start" },
						--
						-- you can use regex matching and/or pass a list in a "query" key to group multiple queires.
						["]o"] = "@loop.*",
						-- ["]o"] = { query = { "@loop.inner", "@loop.outer" } }
						--
						-- you can pass a query group to use query from `queries/<lang>/<query_group>.scm file in your runtime path.
						-- below example nvim-treesitter's `locals.scm` and `folds.scm`. they also provide highlights.scm and indent.scm.
						["]s"] = { query = "@scope", query_group = "locals", desc = "next scope" },
						["]z"] = { query = "@fold", query_group = "folds", desc = "next fold" },
					},
					goto_next_end = {
						["]m"] = "@function.outer",
						["]["] = "@class.outer",
					},
					goto_previous_start = {
						["[m"] = "@function.outer",
						["[["] = "@class.outer",
					},
					goto_previous_end = {
						["[m"] = "@function.outer",
						["[]"] = "@class.outer",
					},
					-- below will go to either the start or the end, whichever is closer.
					-- use if you want more granular movements
					-- make it even more gradual by adding multiple queries and regex.
					goto_next = {
						["]d"] = "@conditional.outer",
					},
					goto_previous = {
						["[d"] = "@conditional.outer",
					},
				},
			},
			-- enable indentation
			indent = { enable = true },
			-- enable autotagging (w/ nvim-ts-autotag plugin)
			autotag = { enable = true },
			-- ensure these language parsers are installed
			ensure_installed = "all",
			-- auto install above language parsers
			auto_install = false,
		})
	end,
	dependencies = {
		"nvim-treesitter/nvim-treesitter-textobjects",
	},
}
