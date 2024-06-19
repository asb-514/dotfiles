-- C/C++ customizations
vim.cmd([[
augroup CppCustomizations
autocmd!
autocmd Filetype cpp,c noremap <s-tab> <esc> ]}o
autocmd Filetype cpp,c inoremap <s-tab> <esc> ]}o
autocmd FileType cpp,c noremap <F10> :lua mycompileAndRun("%<")<CR>
autocmd FileType cpp,c noremap <F9> :lua mycompile("%<")<CR>
autocmd FileType cpp,c noremap <F8> lua myrun_input("%<")<CR>
autocmd FileType cpp,c inoremap {<cr>   {}<left><cr><esc>ko
"autocmd FileType cpp,c noremap <s-tab> <esc> ]}o
"autocmd FileType cpp,c inoremap <s-tab> <esc> ]}o
autocmd Filetype cpp,c noremap <Leader>i : call system('pbpaste > inp' . expand('%<'))<cr>
autocmd FileType cpp,c noremap <Leader>I :vs inp%<<CR>
autocmd FileType cpp,c setlocal equalprg=clang-format\ -style=WebKit
"autocmd FileType cpp setlocal makeprg=g\+\+\ %\ \-g\ \-std\=c\+\+20\ \-Wall
augroup END
]])


-- Python customizations
vim.cmd([[
augroup PythonCustomizations
autocmd!
autocmd FileType python noremap <F10> <ESC>:w<CR>:python3.10 "%"<CR>
autocmd FileType python inoremap <F10> <ESC>:w<CR>:python3.10 "%"<CR>
autocmd FileType python noremap <F9> <ESC>:w<CR>:vert terminal octave "%"<CR>
autocmd FileType python inoremap <F9> <ESC>:w<CR>:vert terminal octave "%"<CR>
"autocmd FileType python noremap <Leader>dd :w<cr>:vsplit | terminal python3 -m pdb "%"<cr>
"autocmd FileType python setlocal equalprg=black\ -q\ 2>/dev/null
autocmd FileType python setlocal equalprg=black\ -q\ 2>/dev/null\ -


"autocmd FileType python set formatprg=black\ -q\ 2>/dev/null\ --stdin-filename\ %\ -
augroup END
]])

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
-- refocus after inverse search in vimtex skim 
vim.cmd([[
function! s:TexFocusVim() abort
" Replace `TERMINAL` with the name of your terminal application
" Example: execute "!open -a iTerm"  
" Example: execute "!open -a Alacritty"
"silent execute "!open -a TERMINAL"
"silent execute "!open -a iTerm"
silent execute "!open -a WezTerm"
redraw!
endfunction
augroup vimtex_event_focus
au!
au User VimtexEventViewReverse call s:TexFocusVim()
augroup END

]])


-- Setup our JDTLS server any time we open up a java file
vim.cmd [[
    augroup jdtls_lsp
        autocmd!
        autocmd FileType java lua require'config.jdtls'.setup_jdtls()
    augroup end
]]
