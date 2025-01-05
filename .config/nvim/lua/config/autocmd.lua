-- Set equalprg for Python files
vim.cmd([[
autocmd FileType python setlocal equalprg=black\ --quiet\ -
]])

-- Set equalprg for C++ files
vim.cmd([[
autocmd FileType cpp setlocal equalprg=clang-format\ --style=file:/Users/shashank/.dotfiles/.config/nvim/.clang-format
]])

-- enable lsp completion
vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("UserLspAttach", { clear = true }),
	callback = function(ev)
		vim.lsp.completion.enable(true, ev.data.client_id, ev.buf)
	end,
})

