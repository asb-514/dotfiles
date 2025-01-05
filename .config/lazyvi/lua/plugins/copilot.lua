return {
	{
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		build = ":Copilot auth",
		--event = "InsertEnter",
		opts = {
			suggestion = {
				enabled = true,
				auto_trigger = true,
				keymap = {
					accept = "<C-Y>", -- currently not handled by nvim-cmp / blink.cmp
					accept_word = false,
					accept_line = "<C-y>",
					next = "<M-]>",
					prev = "<M-[>",
				},
			},
			panel = { enabled = true },
			filetypes = {
				markdown = true,
				help = true,
			},
		},
	},
}
