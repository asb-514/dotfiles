return {
	"windwp/nvim-autopairs",
	lazy = true,
	event = "InsertEnter",
	config = true,
	opts = {
		disable_filetype = { "TelescopePrompt", "vim" },
	},
}
