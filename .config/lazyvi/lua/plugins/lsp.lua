return {
	{
		"neovim/nvim-lspconfig",
		opts = {
			inlay_hints = {
				enabled = true,
				exclude = { "cpp" }, -- filetypes for which you don't want to enable inlay hints
			},
			diagnostics = {
				virtual_text = false,
			},
			-- LSP Server Settings
			servers = {
				typst_lsp = {
					settings = {
						exportPdf = "onType", -- Choose onType, onSave, or never.
					},
				},
				clangd = {
					mason = false,
				},
				pyright = {},
			},
		},
	},
	{
		"saghen/blink.cmp",
		keys = {
			{ "<C-l>", "<cmd>lua LazyVim.cmp.actions.snippet_forward()<CR>", mode = "i" },
		},
		opts = {
			keymaps = {
				preset = "enter",
			},
		},
	},
	{
		"stevearc/conform.nvim",
		opts = {
			formatters_by_ft = {
				c = { "clang_format" },
				cpp = { "clang_format" },
				latex = { "latexindent" },
			},
			formatters = {
				clang_format = {
					args = {
						"--style=file:/Users/shashank/.dotfiles/.config/nvim/.clang-format",
						"--fallback-style=WebKit",
					}, -- Override clang-format args
				},
			},
		},
	},
	{
		"zbirenbaum/copilot.lua",
		opts = {
			filetypes = {
				-- if needed make this false.
				cpp = "true",
			},
		},
	},
}
