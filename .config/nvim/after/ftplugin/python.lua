-- Python customizations
vim.cmd([[
noremap <F10> <ESC>:w<CR>:python3.10 "%"<CR>
inoremap <F10> <ESC>:w<CR>:python3.10 "%"<CR>
noremap <F9> <ESC>:w<CR>:vert terminal octave "%"<CR>
inoremap <F9> <ESC>:w<CR>:vert terminal octave "%"<CR>
"noremap <Leader>dd :w<cr>:vsplit | terminal python3 -m pdb "%"<cr>
setlocal equalprg=black\ -q\ 2>/dev/null\ -
set formatprg=black\ -q\ 2>/dev/null\ --stdin-filename\ %\ -
]])
