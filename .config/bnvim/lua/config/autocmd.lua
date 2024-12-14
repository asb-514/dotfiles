vim.cmd([[
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

vim.cmd([[
" same as autocmd BufEnter * silent! :lcd%:p:h
set autochdir
" .zshrc on path 
set shell=/bin/zsh
autocmd BufEnter * if &buftype == 'terminal' | :startinsert | endif
]])
