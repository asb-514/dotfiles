return {
	{
		"lewis6991/gitsigns.nvim",
		lazy = true,
		event = { "InsertEnter", "CursorMoved" },
		keys = {
			{ "<leader>gp", ":Gitsigns preview_hunk<CR>" },
			{ "<leader>gt", ":Gitsigns toggle_signs<CR>" },
			{ "<leader>gb", ":Gitsigns toggle_current_line_blame<CR>" },
		},
	},
	{
		"christoomey/vim-tmux-navigator",
		lazy = true,
		cmd = {
			"TmuxNavigateLeft",
			"TmuxNavigateDown",
			"TmuxNavigateUp",
			"TmuxNavigateRight",
			"TmuxNavigatePrevious",
		},
		keys = {
			{ "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
			{ "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
			{ "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
			{ "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
			{ "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
		},
	},
	{
		"windwp/nvim-autopairs",
		lazy = true,
		event = "InsertEnter",
		config = true,
		-- use opts = {} for passing setup options
		-- this is equivalent to setup({}) function
		opts = {
			disable_filetype = { "TelescopePrompt", "vim" },
		},
	},
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
