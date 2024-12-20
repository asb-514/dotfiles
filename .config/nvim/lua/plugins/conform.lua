return {
	"stevearc/conform.nvim",
	lazy = true,
	event = "BufWritePre",
	version = false,
	opts = {
		formatters_by_ft = {
			lua = { "stylua" },
			c = { "clang_format" },
			cpp = { "clang_format" },
			latex = { "latexindent" },
			python = { "black" },
		},
		formatters = {
			clang_format = {
				args = {
					"--style=file:/Users/shashank/.dotfiles/.config/nvim/.clang-format",
					"--fallback-style=WebKit",
				},
			},
		},
		format_on_save = {
			timeout_ms = 500,
			lsp_format = "fallback",
		},
	},
}
