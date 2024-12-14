colorscheme slate
"inoremap jk <Esc>

let mapleader = "\<Space>"
let maplocalleader = ","
noremap <LocalLeader>e :Explore<cr>
noremap <LocalLeader>wq :wq<CR>
noremap <LocalLeader>q :q<CR>
noremap <LocalLeader>a ggVG$"*y

set noerrorbells
set relativenumber
set number
set scrolloff=15
set shiftwidth=4
set tabstop=4
filetype indent on
syntax on
highlight Normal guibg=NONE ctermbg=NONE
