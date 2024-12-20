return {
	"ibhagwan/fzf-lua",
	lazy = true,
	cmd = "FzfLua",
	keys = {
		{ "<leader>/", "<cmd>FzfLua live_grep<CR>", desc = "Grep (Root Dir)" },
		{
			"<leader>fc",
			"<cmd>lua require('fzf-lua').files({ cwd = '~/.config/nvim' })<CR>",
			desc = "Find Config File",
		},
		{ "<leader>ff", "<cmd>FzfLua files<CR>", desc = "find files" },
		{ "<leader>,", "<cmd>FzfLua buffers<CR>", desc = "find files" },
	},
	opts = function(_, opts)
		local config = require("fzf-lua.config")
		config.defaults.keymap.builtin["<c-f>"] = "preview-page-down"
		config.defaults.keymap.builtin["<c-b>"] = "preview-page-up"
	end,
}
