return {
	"saghen/blink.cmp",
	opts = {
		providers = {
			snippets = {
				min_keyword_length = 1, -- don't show when triggered manually, useful for JSON keys
				score_offset = -1,
			},
			path = {
				opts = { get_cwd = vim.uv.cwd },
			},
			buffer = {
				fallback_for = {}, -- disable being fallback for LSP
				max_items = 4,
				min_keyword_length = 4,
				score_offset = -3,
			},
		},
		sources = {
			-- adding any nvim-cmp sources here will enable them
			-- with blink.compat
			compat = {},
			default = { "path", "snippets", "lsp", "buffer" },
			cmdline = {},
		},
		keymap = {
			["<C-i>"] = { "select_and_accept" },
		},
	},
}
