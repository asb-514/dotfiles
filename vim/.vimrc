colorscheme wildcharm

let mapleader = " "
let maplocalleader = ","

" Normal mode mappings
nnoremap <silent> <LocalLeader>e :Explore<CR>
nnoremap <silent> <LocalLeader>wq :wq<CR>
nnoremap <silent> <LocalLeader>q :q<CR>
nnoremap <silent> <LocalLeader>a mtgg0VG$"*y't
nnoremap <LocalLeader>l :%r ~/Documents/contest/library/templates/
nnoremap <silent> L :bn<CR>
nnoremap <silent> H :bp<CR>
nnoremap <silent> Q :bd<CR>
inoremap <silent> {<CR> {<CR>}<esc>ko
inoremap <silent> jk <Esc>

set noerrorbells
set relativenumber
set number
set scrolloff=15
set shiftwidth=4
set tabstop=4
set laststatus=2
set nowrap

filetype indent on
syntax on

" Formatting autocommands
augroup AutoFormat
    autocmd!
    autocmd BufWritePost *.py silent !black --quiet %
    autocmd BufWritePost *.py edit
    autocmd BufWritePost *.cpp silent !clang-format -i --style=file:/Users/shashank/.dotfiles/.config/nvim/.clang-format %
    autocmd BufWritePost *.cpp edit
augroup END

set background=dark
highlight Normal ctermbg=NONE
