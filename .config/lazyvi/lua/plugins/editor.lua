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
	{
		"glacambre/firenvim",
		build = ":call firenvim#install(0)",
		lazy = false,
		config = function()
			vim.g.firenvim_config = {
				ask = "always",
				neovim = {
					command = "nvr",
					neovim = "opt/homebrew/bin/nvim",
				},
				localSettings = {
					[".*"] = {
						selector = "textarea",
						method = "terminal",
						takeover = "never",
					},
				},
			}
		end,
	},
	{
		"lewis6991/gitsigns.nvim",
		lazy = true,
		event = "VeryLazy",
		config = function()
			require("gitsigns").setup()
			vim.keymap.set("n", "<leader>gp", ":Gitsigns preview_hunk<CR>", {})
			vim.keymap.set("n", "<leader>gt", ":Gitsigns toggle_signs<CR>", {})
			vim.keymap.set("n", "<leader>gb", ":Gitsigns toggle_current_line_blame<CR>", {})
		end,
	},
	{
		"folke/snacks.nvim",
		lazy = false,
		priority = 1000,
		opts = {
			indent = { enabled = false },
			input = { enabled = false },
			scope = { enabled = false },
			scroll = { enabled = false },
			words = { enabled = false },
			dim = { enable = false },
			dashboard = { enable = false },
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
}
