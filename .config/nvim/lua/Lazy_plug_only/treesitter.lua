return {
	"nvim-treesitter/nvim-treesitter",
	opts = {
		ensure_installed = { "python", "cpp", "bash" },
		--vim.cmd([[
		--	set foldmethod=expr
		--	set foldexpr=nvim_treesitter#foldexpr()
		--	set nofoldenable                     " Disable folding at startup.
		--	]]),
	},
}
