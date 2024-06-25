return
	{
		'hrsh7th/nvim-cmp',
		lazy = true,
		event = "VeryLazy",
		dependencies = {
			'neovim/nvim-lspconfig',
			'hrsh7th/cmp-nvim-lsp',
			'hrsh7th/cmp-buffer',
			'hrsh7th/cmp-path',
			'hrsh7th/cmp-cmdline',
			'SirVer/ultisnips',
			'quangnguyen30192/cmp-nvim-ultisnips',
		},

		config = function ()

			-- Set up nvim-cmp.
			local cmp = require'cmp'

			cmp.setup({
				snippet = {
					-- REQUIRED - you must specify a snippet engine
					expand = function(args)
						-- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
						-- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
						-- require('snippy').expand_snippet(args.body) -- For `snippy` users.
						vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
						-- vim.snippet.expand(args.body) -- For native neovim snippets (Neovim v0.10+)
					end,
				},
				window = {
					--completion = cmp.config.window.bordered(),
					documentation = cmp.config.window.bordered(),
				},
				mapping = cmp.mapping.preset.insert({
					['<C-b>'] = cmp.mapping.scroll_docs(-4),
					['<C-f>'] = cmp.mapping.scroll_docs(4),
					['<C-Space>'] = cmp.mapping.complete(),
					['<C-e>'] = cmp.mapping.abort(),
					['<Cr>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
				}),
				sources = cmp.config.sources({
					{ name = 'ultisnips' }, -- For ultisnips users.
					{ name = 'nvim_lsp', max_item_count = 4},
					-- { name = 'vsnip' }, -- For vsnip users.
					-- { name = 'luasnip' }, -- For luasnip users.
					-- { name = 'snippy' }, -- For snippy users.
					}, {
					{ name = 'buffer' },
						{ name = 'path' },
				})
			})

			-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
			cmp.setup.cmdline({ '/', '?' }, {
				mapping = cmp.mapping.preset.cmdline(),
				sources = {
					{ name = 'buffer' }
				}
			})
			-- LSP

			local nvim_lsp = require('lspconfig')

			vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
				vim.lsp.diagnostic.on_publish_diagnostics, {
					underline = true,
					virtual_text = {
						spacing = 8,
						severity_limit = "Error",
					},
					signs = false,
					update_in_insert = false,
				}
			)

			-- Use an on_attach function to only map the following keys
			-- after the language server attaches to the current buffer
			local lsp_on_attach = function(client, bufnr)
				local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
				local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

				--Enable completion triggered by <c-x><c-o>
				buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

				-- Mappings.
				local opts = { noremap=true, silent=true }

				-- See `:help vim.lsp.*` for documentation on any of the below functions
				buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
				buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
				buf_set_keymap('n', 'gk', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
				buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
				buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
				buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
				buf_set_keymap('n', 'gt', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)

				-- Workspace management
				buf_set_keymap('n', '<Leader>lwa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
				buf_set_keymap('n', '<Leader>lwr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
				buf_set_keymap('n', '<Leader>lwl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)

				buf_set_keymap('n', '<Leader>lr', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
				buf_set_keymap('n', '<Leader>lf', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
				buf_set_keymap('n', '<Leader>le', '<cmd>lua vim.diagnostic.open_float({scope="c"})<CR>', opts)
				buf_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
				buf_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
				buf_set_keymap('n', '<Leader>lq', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)

				if client.server_capabilities.documentFormattingProvider then
					buf_set_keymap('n', '<Leader>lw', '<cmd>lua vim.lsp.buf.format()<CR>', opts)
				else
					buf_set_keymap('n', '<Leader>lw', '<cmd>echom "LSP formatting not supported"<CR>', opts)
				end
				if client.server_capabilities.documentRangeFormattingProvider then
					buf_set_keymap('v', '<Leader>lw', '<cmd>lua vim.lsp.buf.format()<CR>', opts)
				else
					buf_set_keymap('v', '<Leader>lw', '<cmd>echom "LSP range formatting not supported"<CR>', opts)
				end

				if client.server_capabilities.documentHighlightProvider then
					vim.cmd [[
						augroup lsp_document_highlight
						autocmd! * <buffer>
						autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
						autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
						]]
				end
			end

			vim.cmd [[highlight LspReferenceText cterm=bold guibg=LightYellow]]
			vim.cmd [[highlight LspReferenceRead cterm=bold ctermbg=0 guibg=LightYellow]]
			vim.cmd [[highlight LspReferenceWrite cterm=bold ctermbg=0 guibg=LightYellow]]


			local capabilities = require('cmp_nvim_lsp').default_capabilities()
			capabilities.offsetEncoding = "utf-8"

			local servers = { "clangd","pyright","lua_ls","texlab", "marksman","bashls"}
			for _, lsp in ipairs(servers) do
				local capabilities = require('cmp_nvim_lsp').default_capabilities()
				capabilities.offsetEncoding = "utf-8"
				nvim_lsp[lsp].setup {
					on_attach = lsp_on_attach,
					flags = {
						debounce_text_changes = 150,
					},
					capabilities = capabilities,
				}
			end
		end
	}
