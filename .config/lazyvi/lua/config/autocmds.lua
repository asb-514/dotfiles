-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds hereauto
--
-- Python customizations
vim.cmd([[
  augroup PythonCustomizations
    autocmd FileType python setlocal equalprg=black\ -q\ 2>/dev/null\ -
  augroup END
]])

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
-- C/C++ customizations
vim.cmd([[
  augroup CppCustomizations
    autocmd!
    autocmd FileType cpp,c noremap <F10> :lua mycompileAndRun("%<")<CR>
    autocmd FileType cpp,c noremap <F9> :lua mycompile("%<")<CR>
    autocmd FileType cpp,c noremap <F8> lua myrun_input("%<")<CR>
    autocmd FileType cpp,c inoremap {<cr>   {}<left><cr><esc>ko
    autocmd FileType cpp,c noremap <s-tab> <esc> ]}o
    autocmd FileType cpp,c inoremap <s-tab> <esc> ]}o
    autocmd Filetype cpp,c noremap <Leader>i : call system('pbpaste > inp' . expand('%<'))<cr>
    autocmd FileType cpp,c noremap <Leader>I :vs inp%<<CR>
    autocmd FileType cpp,c setlocal equalprg=clang-format\ -style=WebKit
    autocmd FileType cpp setlocal makeprg=g\+\+\ %\ \-g\ \-std\=c\+\+20\ \-Wall
  augroup END
]])
