return {
	{
		"metalelf0/jellybeans-nvim",
		lazy = false,
		priority = 1000,
		dependencies = { "rktjmp/lush.nvim" },
		config = function()
			vim.opt.background = "dark"
			vim.opt.termguicolors = true
			vim.cmd.colorscheme("jellybeans-nvim")
			-- Transparent background
			vim.cmd([[highlight Normal guibg=NONE ctermbg=NONE]])
		end,
	},
}
