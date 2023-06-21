return {
	{ "mfussenegger/nvim-jdtls" },
	{
		"williamboman/mason.nvim",
		dependencies = {
			"williamboman/mason-lspconfig.nvim",
			"neovim/nvim-lspconfig",
			"hrsh7th/nvim-cmp",
			"hrsh7th/cmp-nvim-lsp",
		},
		config = function()
			-- order matters here
			require("mason").setup()
			require("mason-lspconfig").setup({
				automatic_installation = true,
			})

			local on_attach = function(_, bufnr)
				-- Enable completion triggered by <c-x><c-o>
				vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

				-- Mappings.
				-- See `:help vim.lsp.*` for documentation on any of the below functions
				local bufopts = { noremap = true, silent = true, buffer = bufnr }
				-- vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
				-- vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
				-- vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
				-- vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
				-- -- vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
				-- vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, bufopts)
				-- vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, bufopts)
				-- vim.keymap.set("n", "<space>wl", function()
				-- 	print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
				-- end, bufopts)
				-- vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, bufopts)
				-- vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, bufopts)
				-- vim.keymap.set("n", "<space>ca", vim.lsp.buf.code_action, bufopts)
				-- vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
				-- vim.keymap.set("n", "<space>f", function()
				-- 	vim.lsp.buf.format({ async = true })
				-- end, bufopts)
			end
			-- Change the Diagnostic symbols in the sign column (gutter)
			local signs = { Error = " ", Warn = " ", Hint = "ﴞ ", Info = " " }
			for type, icon in pairs(signs) do
				local hl = "DiagnosticSign" .. type
				vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
			end
			-- used to enable autocompletion (assign to every lsp server config)
			local cmp_nvim_lsp = require("cmp_nvim_lsp")
			local capabilities = cmp_nvim_lsp.default_capabilities()

			-- folding
			capabilities.textDocument.foldingRange = {
				dynamicRegistration = false,
				lineFoldingOnly = true,
			}
			require("neodev").setup({
				-- add any options here, or leave empty to use the default settings
			})
			-- folding
			local lspconfig = require("lspconfig")
			-- configure html server
			lspconfig["html"].setup({
				on_attach = on_attach,
				capabilities = capabilities,
			})

			-- configure css server
			lspconfig["cssls"].setup({
				on_attach = on_attach,
				capabilities = capabilities,
			})

			-- configure tailwindcss server
			-- lspconfig["tailwindcss"].setup({
			-- 	on_attach = on_attach,
			-- 	capabilities = capabilities,
			-- })

			-- configure lua server (with special settings)
			lspconfig["lua_ls"].setup({
				on_attach = on_attach,
				capabilities = capabilities,

				settings = {
					-- custom settings for lua
					Lua = {
						-- make the language server recognize "vim" global
						completion = {
							callSnippet = "Replace",
						},
						diagnostics = {
							globals = { "vim" },
						},
						workspace = {
							-- make language server aware of runtime files
							library = {
								[vim.fn.expand("$VIMRUNTIME/lua")] = true,
								[vim.fn.stdpath("config") .. "/lua"] = true,
							},
						},
					},
				},
			})

			lspconfig["gopls"].setup({
				on_attach = on_attach,
				capabilities = capabilities,
			})

			lspconfig["golangci_lint_ls"].setup({
				on_attach = on_attach,
				capabilities = capabilities,
			})

			lspconfig["terraformls"].setup({
				on_attach = on_attach,
				capabilities = capabilities,
			})

			lspconfig["tflint"].setup({
				on_attach = on_attach,
				capabilities = capabilities,
			})

			lspconfig["kotlin_language_server"].setup({
				on_attach = on_attach,
				capabilities = capabilities,
			})

			lspconfig["tsserver"].setup({
				on_attach = on_attach,
				capabilities = capabilities,
				-- settings = {
				-- 	typescript = {
				-- 		inlayHints = {
				-- 			includeInlayParameterNameHints = "all",
				-- 			includeInlayParameterNameHintsWhenArgumentMatchesName = false,
				-- 			includeInlayFunctionParameterTypeHints = true,
				-- 			includeInlayVariableTypeHints = true,
				-- 			includeInlayPropertyDeclarationTypeHints = true,
				-- 			includeInlayFunctionLikeReturnTypeHints = true,
				-- 			includeInlayEnumMemberValueHints = true,
				-- 		},
				-- 	},
				-- 	javascript = {
				-- 		inlayHints = {
				-- 			includeInlayParameterNameHints = "all",
				-- 			includeInlayParameterNameHintsWhenArgumentMatchesName = false,
				-- 			includeInlayFunctionParameterTypeHints = true,
				-- 			includeInlayVariableTypeHints = true,
				-- 			includeInlayPropertyDeclarationTypeHints = true,
				-- 			includeInlayFunctionLikeReturnTypeHints = true,
				-- 			includeInlayEnumMemberValueHints = true,
				-- 		},
				-- 	},
				-- },
			})

			lspconfig["rust_analyzer"].setup({
				on_attach = on_attach,
				capabilities = capabilities,
			})
			lspconfig["pylsp"].setup({
				on_attach = on_attach,
				capabilities = capabilities,
			})
			-- lspconfig["jdtls"].setup({
			-- 	on_attach = on_attach,
			-- 	capabilities = capabilities,
			-- })
		end,
	},
	{
		-- formatting & linting
		"jose-elias-alvarez/null-ls.nvim", -- configure formatters & linters
		config = function()
			-- for conciseness
			local null_ls = require("null-ls")
			local formatting = null_ls.builtins.formatting -- to setup formatters
			local diagnostics = null_ls.builtins.diagnostics -- to setup linters

			-- to setup format on save
			local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

			null_ls.setup({
				-- setup formatters & linters
				sources = {
					--  to disable file types use
					--  "formatting.prettier.with({disabled_filetypes: {}})" (see null-ls docs)
					formatting.prettier, -- js/ts formatter
					formatting.stylua, -- lua formatter
					formatting.gofumpt,
					formatting.goimports,
					formatting.rustfmt,
					formatting.google_java_format,
					-- formatting.clang_format,
					formatting.black.with({
						extra_args = { "--fast", "--line-length", "79", "--experimental-string-processing" },
					}),
					diagnostics.eslint_d.with({ -- js/ts linter
						-- only enable eslint if root has .eslintrc.js (not in youtube nvim video)
						condition = function(utils)
							return utils.root_has_file(".eslintrc.js") -- change file extension if you use something else
						end,
					}),
					diagnostics.pylint,
				},
				-- configure format on save
				on_attach = function(current_client, bufnr)
					if current_client.supports_method("textDocument/formatting") then
						vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
						vim.api.nvim_create_autocmd("BufWritePre", {
							group = augroup,
							buffer = bufnr,
							callback = function()
								vim.lsp.buf.format({
									filter = function(client)
										--  only use null-ls for formatting instead of lsp server
										return client.name == "null-ls"
									end,
									bufnr = bufnr,
								})
							end,
						})
					end
				end,
			})
		end,
	},
	{
		"jayp0521/mason-null-ls.nvim", -- bridges gap b/w mason & null-ls
		config = function()
			require("mason-null-ls").setup({
				automatic_installation = true,
			})
		end,
	},
	{
		"glepnir/lspsaga.nvim",
		event = "BufRead",
		config = true,
		dependencies = {
			{ "nvim-tree/nvim-web-devicons" },
			--Please make sure you install markdown and markdown_inline parser
			{ "nvim-treesitter/nvim-treesitter" },
			"preservim/vim-markdown",
		},
		keys = {

			-- LSP finder - Find the symbol's definition
			-- If there is no definition, it will instead be hidden
			-- When you use an action in finder like "open vsplit",
			-- you can use <C-t> to jump back
			{ "gh", "<cmd>Lspsaga lsp_finder<CR>" },

			-- Code action
			{ "<leader>ca", "<cmd>Lspsaga code_action<CR>", mode = { "n", "v" } },

			-- Rename all occurrences of the hovered word for the entire file
			{ "gr", "<cmd>Lspsaga rename<CR>" },

			-- Rename all occurrences of the hovered word for the selected files
			{ "gr", "<cmd>Lspsaga rename ++project<CR>" },

			-- Peek definition
			-- You can edit the file containing the definition in the floating window
			-- It also supports open/vsplit/etc operations, do refer to "definition_action_keys"
			-- It also supports tagstack
			-- Use <C-t> to jump back
			{ "gd", "<cmd>Lspsaga peek_definition<CR>" },

			-- Go to definition
			{ "gd", "<cmd>Lspsaga goto_definition<CR>" },

			-- Peek type definition
			-- You can edit the file containing the type definition in the floating window
			-- It also supports open/vsplit/etc operations, do refer to "definition_action_keys"
			-- It also supports tagstack
			-- Use <C-t> to jump back
			{ "gt", "<cmd>Lspsaga peek_type_definition<CR>" },

			-- Go to type definition
			{ "gt", "<cmd>Lspsaga goto_type_definition<CR>" },

			-- Show line diagnostics
			-- You can pass argument ++unfocus to
			-- unfocus the show_line_diagnostics floating window
			{ "<leader>sl", "<cmd>Lspsaga show_line_diagnostics<CR>" },

			-- Show cursor diagnostics
			-- Like show_line_diagnostics, it supports passing the ++unfocus argument
			{ "<leader>sc", "<cmd>Lspsaga show_cursor_diagnostics<CR>" },

			-- Show buffer diagnostics
			{ "<leader>sb", "<cmd>Lspsaga show_buf_diagnostics<CR>" },

			-- Diagnostic jump
			-- You can use <C-o> to jump back to your previous location
			{ "[e", "<cmd>Lspsaga diagnostic_jump_prev<CR>" },
			{ "]e", "<cmd>Lspsaga diagnostic_jump_next<CR>" },

			-- Diagnostic jump with filters such as only jumping to an error
			{
				"[E",
				function()
					require("lspsaga.diagnostic"):goto_prev({ severity = vim.diagnostic.severity.ERROR })
				end,
			},
			{
				"]E",
				function()
					require("lspsaga.diagnostic"):goto_next({ severity = vim.diagnostic.severity.ERROR })
				end,
			},

			-- Toggle outline
			{ "<leader>o", "<cmd>Lspsaga outline<CR>" },

			-- Hover Doc
			-- If there is no hover doc,
			-- there will be a notification stating that
			-- there is no information available.
			-- To disable it just use ":Lspsaga hover_doc ++quiet"
			-- Pressing the key twice will enter the hover window
			{ "K", "<cmd>Lspsaga hover_doc<CR>" },

			-- If you want to keep the hover window in the top right hand corner,
			-- you can pass the ++keep argument
			-- Note that if you use hover with ++keep, pressing this key again will
			-- close the hover window. If you want to jump to the hover window
			-- you should use the wincmd command "<C-w>w"
			{ "K", "<cmd>Lspsaga hover_doc ++keep<CR>" },

			-- Call hierarchy
			{ "<Leader>ci", "<cmd>Lspsaga incoming_calls<CR>" },
			{ "<Leader>co", "<cmd>Lspsaga outgoing_calls<CR>" },

			-- Floating terminal
			{ "<A-d>", "<cmd>Lspsaga term_toggle<CR>", mode = { "n", "t" } },
		},
	},
}
