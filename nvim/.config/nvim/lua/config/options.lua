vim.o.errorbells = false
vim.wo.relativenumber = true
vim.wo.number = true
vim.o.scrolloff = 15
vim.o.shiftwidth = 4
vim.o.tabstop = 4
vim.o.laststatus = 2
vim.opt.wrap = false
vim.opt.foldmethod = "syntax"
vim.opt.foldenable = true
vim.opt.ignorecase = true

vim.cmd("filetype indent on")
vim.cmd("syntax on")
vim.cmd("set path+=**")

-- Hide all semantic highlights
for _, group in ipairs(vim.fn.getcompletion("@lsp", "highlight")) do
	vim.api.nvim_set_hl(0, group, {})
end

vim.lsp.enable("lua_ls")
vim.lsp.enable("clangd")
vim.opt.runtimepath:append("/opt/homebrew/opt/fzf")

vim.diagnostic.config({
	virtual_text = false,
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = "",
			[vim.diagnostic.severity.WARN] = "",
			[vim.diagnostic.severity.HINT] = "",
			[vim.diagnostic.severity.INFO] = "",
		},
		numhl = {
			[vim.diagnostic.severity.WARN] = "WarningMsg",
			[vim.diagnostic.severity.ERROR] = "ErrorMsg",
		},
	},
})
