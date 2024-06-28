return {
	{
		'metalelf0/jellybeans-nvim',
		lazy = false,
		priority = 1000,
		dependencies = {'rktjmp/lush.nvim',},
		config = function()
			vim.opt.background = "dark"
			vim.opt.termguicolors = true
			vim.cmd.colorscheme 'jellybeans-nvim'
			-- Transparent background
			vim.cmd [[highlight Normal guibg=NONE ctermbg=NONE]]
		end
	}, 
	{
		'folke/tokyonight.nvim',
		lazy = true,
		priority = 1000,
		config = function()
			vim.opt.background = "dark"
			vim.opt.termguicolors = true
			vim.cmd.colorscheme 'tokyonight'
			-- Transparent background
			vim.cmd [[highlight Normal guibg=NONE ctermbg=NONE]]
		end
	},
	{
		"catppuccin/nvim", 
		lazy = true,
		name = "catppuccin", 
		priority = 1000,
		config = function()
			vim.g.catppuccin_flavour = "Macchiato"
			require("catppuccin").setup()
			vim.cmd.colorscheme "catppuccin"
			-- Transparent background
			--vim.cmd [[highlight Normal guibg=NONE ctermbg=NONE]]
		end
	}
}
