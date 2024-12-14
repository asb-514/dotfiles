-- refocus after inverse search in vimtex skim
vim.cmd([[
function! s:TexFocusVim() abort
silent execute "!open -a WezTerm"
redraw!
endfunction
augroup vimtex_event_focus
au!
au User VimtexEventViewReverse call s:TexFocusVim()
augroup END
]])
vim.cmd([[set spell]])
