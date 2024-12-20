return {
	"lewis6991/gitsigns.nvim",
	lazy = true,
	event = { "BufReadPre" },
	keys = {
		{ "<leader>gp", ":Gitsigns preview_hunk<CR>" },
		{ "<leader>gt", ":Gitsigns toggle_signs<CR>" },
		{ "<leader>gb", ":Gitsigns toggle_current_line_blame<CR>" },
	},
}
