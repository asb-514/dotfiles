-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- Optionally, override specific formatter options
require("conform").setup({
	formatters_by_ft = {
		c = { "clang_format" },
		cpp = { "clang_format" },
		latex = { "latexindent" },
	},
	formatters = {
		clang_format = {
			args = { "--style=file:/Users/shashank/.dotfiles/.config/nvim/.clang-format", "--fallback-style=WebKit" }, -- Override clang-format args
		},
	},
})
require("config.functions")
if vim.g.neovide then
	--vim.cmd("Lazy load solarized.nvim")
	--vim.cmd.colorscheme("solarized")
end
vim.api.nvim_create_autocmd({ "BufEnter" }, {
	pattern = "*hackerrank.com*.txt",
	command = "set filetype=cpp",
})

vim.api.nvim_create_autocmd({ "BufEnter" }, {
	pattern = "*codeforces.com*.txt",
	command = "set filetype=cpp",
})

vim.api.nvim_create_autocmd({ "BufEnter" }, {
	pattern = "*leetcode.com*.txt",
	command = "set filetype=cpp",
})

vim.api.nvim_create_autocmd({ "BufEnter" }, {
	pattern = "*codechef.com*.txt",
	command = "set filetype=cpp",
})

local ls = require("luasnip")

vim.keymap.set({ "i", "s" }, "<C-l>", function()
	ls.jump(1)
end, { silent = true })
vim.keymap.set({ "i", "s" }, "<C-h>", function()
	ls.jump(-1)
end, { silent = true })

vim.keymap.set({ "i", "s" }, "<C-y>", function()
	if ls.choice_active() then
		ls.change_choice(1)
	end
end, { silent = true })
vim.api.nvim_create_user_command("LuaSnipEdit", function()
	require("luasnip.loaders").edit_snippet_files()
end, { nargs = "*" })
