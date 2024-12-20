function ColorMyPencils(color)
	color = color or "jellybeans-nvim"
	vim.cmd.colorscheme(color)
	-- Transparent background
	vim.cmd([[highlight Normal guibg=NONE ctermbg=NONE]])
	--vim.opt.background = "dark"
	--vim.opt.termguicolors = true
end
return {
	{
		"metalelf0/jellybeans-nvim",
		lazy = false,
		priority = 1000,
		dependencies = { "rktjmp/lush.nvim" },
		config = function()
			ColorMyPencils("jellybeans-nvim")
		end,
	},
}
