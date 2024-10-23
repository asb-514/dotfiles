-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- Optionally, override specific formatter options
require("conform").setup({
	formatters_by_ft = {
		c = { "clang_format" },
		cpp = { "clang_format" },
	},
	formatters = {
		clang_format = {
			args = { "--style=WebKit", "--fallback-style=LLVM" }, -- Override clang-format args
		},
	},
})
