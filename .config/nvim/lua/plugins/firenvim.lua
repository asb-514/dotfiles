return {
	"glacambre/firenvim",
	build = ":call firenvim#install(0)",
	lazy = false,
	ft = "txt",
	config = function()
		vim.g.firenvim_config = {
			ask = "always",
			neovim = {
				command = "nvr",
				--neovim = "/usr/bin/nvim",
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
}
