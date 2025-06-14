return {
	"lukas-reineke/indent-blankline.nvim",
	lazy = true,
	event = { "BufReadPre" },
	main = "ibl",
	opts = {
		scope = {
			show_start = false,
			show_end = false,
		},
		exclude = {
			filetypes = {
				"help",
				"lazy",
				"mason",
			},
		},
		indent = {
			char = "│",
			tab_char = "│",
		},
	},
}
