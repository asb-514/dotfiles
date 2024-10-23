vim.cmd ([[
" Return to last edit position when opening files (You want this!)
" Only do this part when compiled with support for autocommands
if has("autocmd")
	augroup redhat
	autocmd!
	" When editing a file, always jump to the last cursor position
	autocmd BufReadPost *
	\ if line("'\"") > 0 && line ("'\"") <= line("$") |
	\   exe "normal! g'\"" |
	\ endif
	augroup END
	endif
]])

-- Autocmd to call the function for specific file types
vim.cmd([[
augroup UpdateStatusline
autocmd!
autocmd BufEnter,BufWinEnter * lua myupdate_statusline()
augroup END
]])

-- Set up the autocommand to call the function before saving C/C++ files
vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = {"*.c", "*.cpp"},  -- Pattern for C/C++ files
	callback = myformat_buffer
})

vim.cmd([[
" same as autocmd BufEnter * silent! :lcd%:p:h
set autochdir
" .zshrc on path 
set shell=/bin/zsh
autocmd BufEnter * if &buftype == 'terminal' | :startinsert | endif
]])

vim.api.nvim_create_autocmd({'BufEnter'}, {
    pattern = "www.hackerrank.com_*.txt",
    command = "set filetype=cpp",
    pattern = "www.leetcode.com_*.txt",
    command = "set filetype=cpp",
    pattern = "www.codeforces.com_*.txt",
    command = "set filetype=cpp",
})
