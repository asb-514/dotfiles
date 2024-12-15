-- C/C++ customizations
vim.cmd([[
inoremap {<cr>   {}<left><cr><esc>ko
noremap <s-tab> <esc> ]}o
inoremap <s-tab> <esc> ]}o
setlocal equalprg=clang-format\ -style=WebKit
]])
