return {
		'metalelf0/jellybeans-nvim',
		lazy = false,
		priority = 1000,
		dependencies = {'rktjmp/lush.nvim',},
		config = function()
			vim.opt.background = "dark"
			vim.opt.termguicolors = true
			vim.cmd.colorscheme 'jellybeans-nvim'
		end
}
