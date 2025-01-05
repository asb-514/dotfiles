vim.cmd("colorscheme wildcharm")

vim.g.mapleader = " "
vim.g.maplocalleader = ","

-- Normal mode mappings
vim.api.nvim_set_keymap("n", "<LocalLeader>e", ":Explore<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<LocalLeader>wq", ":wq<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<LocalLeader>q", ":q<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<LocalLeader>a", "mtgg=G:w<CR>0VG$\"*y't", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<LocalLeader>r", ":make!<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap(
	"n",
	"<LocalLeader>l",
	":-1read ~/Documents/contest/library/templates/",
	{ noremap = true, silent = false }
)
vim.api.nvim_set_keymap(
	"n",
	"<LocalLeader>s",
	":-1read ~/.config/nvim-vim/snippets",
	{ noremap = true, silent = false }
)
vim.api.nvim_set_keymap("n", "L", ":bn<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "H", ":bp<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "Q", ":bd<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "{<CR>", "{<CR>}<esc>ko", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "jk", "<Esc>", { noremap = true, silent = true })

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

vim.cmd("filetype indent on")
vim.cmd("syntax on")
vim.cmd("highlight Normal guibg=NONE ctermbg=NONE")
vim.cmd("set path+=**")

-- Set equalprg for Python files
vim.cmd([[
autocmd FileType python setlocal equalprg=black\ --quiet\ -
]])

-- Set equalprg for C++ files
vim.cmd([[
autocmd FileType cpp setlocal equalprg=clang-format\ --style=file:/Users/shashank/.dotfiles/.config/nvim/.clang-format
]])

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
-- enable lsp completion
vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("UserLspAttach", { clear = true }),
	callback = function(ev)
		vim.lsp.completion.enable(true, ev.data.client_id, ev.buf)
	end,
})
