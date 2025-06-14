return {
	{
		"saghen/blink.cmp",
		lazy = false, -- lazy loading handled internally
		dependencies = {
			{ "rafamadriz/friendly-snippets" },
		},
		version = "*",
		--build = "cargo build --release",
		opts = {
			completion = {
				accept = {
					auto_brackets = {
						enabled = false, --handled by auto pairs
					},
				},
				menu = {
					draw = {
						treesitter = { "lsp" },
					},
				},
				documentation = {
					auto_show = true,
					auto_show_delay_ms = 200,
				},
				ghost_text = {
					enabled = false,
				},
			},
			snippets = {
				-- Function to use when expanding LSP provided snippets
				expand = function(snippet)
					vim.snippet.expand(snippet)
				end,
				-- Function to use when checking if a snippet is active
				active = function(filter)
					return vim.snippet.active(filter)
				end,
				-- Function to use when jumping between tab stops in a snippet, where direction can be negative or positive
				jump = function(direction)
					vim.snippet.jump(direction)
				end,
			},
			sources = {
				default = { "lsp", "path", "snippets", "buffer" },
				--cmdline = {},
			},
			appearance = {
				use_nvim_cmp_as_default = false,
				nerd_font_variant = "mono",
			},
			keymap = {
				preset = "enter",
				["<C-l>"] = { "select_and_accept" },
				["<C-y>"] = {},
			},
			signature = { enabled = true },
		},
		opts_extend = {
			"sources.default",
		},
	},
}
