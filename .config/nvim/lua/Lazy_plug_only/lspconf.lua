return {
	{
		"neovim/nvim-lspconfig",
		keys = {
			{ "<C-k>", vim.NIL },
		},
		opts = {
			-- Enable this to enable the builtin LSP inlay hints on Neovim >= 0.10.0
			-- Be aware that you also will need to properly configure your LSP server to
			-- provide the inlay hints.
			inlay_hints = {
				enabled = true,
				exclude = { "cpp" }, -- filetypes for which you don't want to enable inlay hints
			},
			-- LSP Server Settings
			servers = {
				lua_ls = {
					-- mason = false, -- set to false if you don't want this server to be installed with mason
					-- Use this to add any additional keymaps
					-- for specific lsp servers
					-- ---@type LazyKeysSpec[]
					-- keys = {},
					settings = {
						Lua = {
							workspace = {
								checkThirdParty = false,
							},
							codeLens = {
								enable = true,
							},
							completion = {
								callSnippet = "Replace",
							},
							doc = {
								privateName = { "^_" },
							},
							hint = {
								enable = true,
								setType = false,
								paramType = true,
								paramName = "Disable",
								semicolon = "Disable",
								arrayIndex = "Disable",
							},
						},
					},
				},
				typst_lsp = {
					settings = {
						exportPdf = "onType", -- Choose onType, onSave, or never.
					},
				},
				clangd = {
					mason = false,
				},
				pyright = {},
				texlab = {},
				marksman = {},
				bashls = {},
				tinymist = {},
			},
		},
	},
}
