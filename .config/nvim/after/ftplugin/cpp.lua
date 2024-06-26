-- C/C++ customizations
vim.cmd([[
noremap <s-tab> <esc> ]}o
inoremap <s-tab> <esc> ]}o
noremap <F10> :lua mycompileAndRun("%<")<CR>
noremap <F9> :lua mycompile("%<")<CR>
noremap <F8> lua myrun_input("%<")<CR>
inoremap {<cr>   {}<left><cr><esc>ko
noremap <s-tab> <esc> ]}o
inoremap <s-tab> <esc> ]}o
noremap <Leader>i : call system('pbpaste > inp' . expand('%<'))<cr>
noremap <Leader>I :vs inp%<<CR>
setlocal equalprg=clang-format\ -style=WebKit
"autocmd FileType cpp setlocal makeprg=g\+\+\ %\ \-g\ \-std\=c\+\+20\ \-Wall
]])
