return {
	{
		"saghen/blink.cmp",
		lazy = false, -- lazy loading handled internally
		dependencies = {
			{ "giuxtaposition/blink-cmp-copilot", version = false },
			{ "rafamadriz/friendly-snippets" },
			{ "L3MON4D3/LuaSnip", version = "v2.*" },
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
				expand = function(snippet)
					require("luasnip").lsp_expand(snippet)
				end,
				active = function(filter)
					if filter and filter.direction then
						return require("luasnip").jumpable(filter.direction)
					end
					return require("luasnip").in_snippet()
				end,
				jump = function(direction)
					require("luasnip").jump(direction)
				end,
			},
			sources = {
				default = { "lsp", "path", "luasnip", "buffer" },
				--default = { "lsp", "path", "luasnip", "buffer", "copilot" },
				--providers = {
				--	copilot = {
				--		name = "copilot",
				--		module = "blink-cmp-copilot",
				--		score_offset = 100,
				--		async = true,
				--		transform_items = function(_, items)
				--			local CompletionItemKind = require("blink.cmp.types").CompletionItemKind
				--			local kind_idx = #CompletionItemKind + 1
				--			CompletionItemKind[kind_idx] = "Copilot"
				--			for _, item in ipairs(items) do
				--				item.kind = kind_idx
				--			end
				--			return items
				--		end,
				--	},
				--},
			},
			appearance = {
				use_nvim_cmp_as_default = false,
				nerd_font_variant = "mono",
				-- Blink does not expose its default kind icons so you must copy them all (or set your custom ones) and add Copilot
				--kind_icons = {
				--	Copilot = "",
				--	Text = "󰉿",
				--	Method = "󰊕",
				--	Function = "󰊕",
				--	Constructor = "󰒓",

				--	Field = "󰜢",
				--	Variable = "󰆦",
				--	Property = "󰖷",

				--	Class = "󱡠",
				--	Interface = "󱡠",
				--	Struct = "󱡠",
				--	Module = "󰅩",

				--	Unit = "󰪚",
				--	Value = "󰦨",
				--	Enum = "󰦨",
				--	EnumMember = "󰦨",

				--	Keyword = "󰻾",
				--	Constant = "󰏿",

				--	Snippet = "󱄽",
				--	Color = "󰏘",
				--	File = "󰈔",
				--	Reference = "󰬲",
				--	Folder = "󰉋",
				--	Event = "󱐋",
				--	Operator = "󰪚",
				--	TypeParameter = "󰬛",
				--},
			},
			keymap = {
				["<C-l>"] = { "select_and_accept" },
				["<C-y>"] = {},
			},
			signature = { enabled = true },
		},
		--opts_extend = { "sources.default" },
		opts_extend = {
			"sources.completion.enabled_providers",
			"sources.compat",
			"sources.default",
		},
	},
	--{
	--	-- coudnt make copilot work with blink now
	--	"giuxtaposition/blink-cmp-copilot",
	--	after = { "zibcopilot/copilot.lua" },
	--},
}
