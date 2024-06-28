return{
	{
		'honza/vim-snippets',
		lazy = true,
		event = "VeryLazy",
		dependencies = { 'SirVer/ultisnips' } -- 'dependencies' changed to 'requires'
	},
	{
		'SirVer/ultisnips',
		lazy = true,
		event = 'VeryLazy',
		--event = "InsertEnter", will be loaded when loading the nvim-cmp
		config = function()
			-- Set UltiSnips expand trigger to Enter key
			vim.g.UltiSnipsExpandTrigger = '<cr>'
			-- Set UltiSnips forward jump trigger to Tab key
			vim.g.UltiSnipsJumpForwardTrigger = '<tab>'
			-- Set UltiSnips backward jump trigger to Shift+Tab keys
			vim.g.UltiSnipsJumpBackwardTrigger = '<s-tab>'
			-- Set UltiSnipsEdit to split the window vertically
			vim.g.UltiSnipsEditSplit = "vertical" -- Commented out for now
		end
	}
}
