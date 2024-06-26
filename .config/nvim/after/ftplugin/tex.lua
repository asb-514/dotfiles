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
