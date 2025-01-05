return {
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
}
