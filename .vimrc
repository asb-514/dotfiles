"colorscheme jellybeans

colorscheme slate
"colo sorbet


"cpp,c custimization
"autocmd Filetype cpp,c noremap <TAB> % if this is included then ultisnips not
"working properly 
"let CPPFLAGS = "-include-pch stdc++.h.pch -fsanitize=address -std=c++20 -Wall -Wextra -Wshadow  -DONPC -O2 -g" 

autocmd Filetype cpp,c inoremap {<cr>   {}<left><cr><esc>ko
"to shift out from {} bracktes 
autocmd Filetype cpp,c noremap <s-tab> <esc> ]}o
autocmd Filetype cpp,c inoremap <s-tab> <esc> ]}o
autocmd Filetype cpp,c command! LLDB :vertical terminal ++shell bash compile.sh "%<" 2 && lldb %<
autocmd Filetype cpp,c noremap <Leader>i : call system('pbpaste > inp' . expand('%<'))<cr>
autocmd Filetype cpp,c noremap <Leader>o : call system('pbpaste > out' . expand('%<'))<cr>
autocmd Filetype cpp,c noremap <Leader>I :vert terminal ++shell vim inp%<<cr>
autocmd Filetype cpp,c noremap <Leader>O :vert terminal ++shell vim out%<<cr>
autocmd Filetype cpp,c noremap <F10> <esc>gg=G<c-o><c-o>:w<CR>:vertical terminal ++shell ++cols=60 bash compile.sh %< 1<cr>
autocmd Filetype cpp,c inoremap <F10> <esc>gg=G<c-o><c-o>:w<CR>:vertical terminal ++shell ++cols=60 bash compile.sh %< 1<cr> 
autocmd Filetype cpp,c noremap <F9> <ESC>:w<CR>:!bash compile.sh %< 1<cr>
autocmd Filetype cpp,c inoremap <F9> <ESC>:w<CR>:!bash compile.sh %< 1<cr>
autocmd Filetype cpp,c noremap <F8> <ESC>:w<CR>:!bash compile.sh %< 0<cr>
autocmd Filetype cpp,c inoremap <F8> <ESC>:w<CR>:!bash compile.sh %< 0<cr>
autocmd Filetype cpp,c noremap <F7> <ESC>:w<CR>:vert terminal ++shell ++cols=60 bash compile.sh %< 0<cr>
autocmd Filetype cpp,c inoremap <F7> <ESC>:w<CR>:vert terminal ++shell ++cols=60 bash compile.sh %< 0<cr>
autocmd Filetype cpp,c noremap <F6> <ESC>:w<CR>:vert terminal ++shell ++cols=60 bash compile.sh %< 3<cr>
autocmd Filetype cpp,c inoremap <F6> <ESC>:w<CR>:vert terminal ++shell ++cols=60 bash compile.sh %< 3<cr>
autocmd FileType cpp,c setlocal equalprg=clang-format\ -style=WebKit
autocmd FileType cpp setlocal makeprg=g\+\+\ %\ \-g\ \-std\=c\+\+20\ \-Wall
inoremap jk <Esc>
"vnoremap jk <Esc>



"python custimizations
autocmd FileType python noremap <F10> <ESC>:w<CR>:vert terminal ++shell ++cols=60 python3 "%"< inpa<CR>
autocmd FileType python inoremap <F10> <ESC>:w<CR>:vert terminal ++shell ++cols=60 python3 "%"< inpa<CR>
autocmd FileType python noremap <F9> <ESC>:w<CR>:vert terminal ++shell ++cols=60 octave "%"<CR>
autocmd FileType python inoremap <F9> <ESC>:w<CR>:vert terminal ++shell ++cols=60 octave "%"<CR>
autocmd FileType python noremap <Leader>d :w<cr>:vert terminal ++shell python3 -m pdb "%"<cr>
autocmd FileType python setlocal equalprg=black\ -q\ 2>/dev/null\ -
autocmd FileType python setlocal makeprg=python3\ %


"plugins
"call plug#begin('~/.vim/plugged')
"
""Plug 'lervag/vimtex'
""let g:tex_flavor='latex'
""let g:vimtex_view_method='skim'
""let g:vimtex_quickfix_mode=0
""set conceallevel=1
""let g:tex_conceal='abdmg' 
"
"Plug 'christoomey/vim-tmux-navigator'
"Plug 'SirVer/ultisnips'
"let g:UltiSnipsExpandTrigger = '<tab>'
"let g:UltiSnipsJumpForwardTrigger = '<tab>'
"let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'
""let g:UltiSnipsJumpForwardTrigger="<c-b>"
""let g:UltiSnipsJumpBackwardTrigger="<c-z>"
"" If you want :UltiSnipsEdit to split your window.
"let g:UltiSnipsEditSplit="vertical"
"
"Plug 'honza/vim-snippets'
"Plug 'MunifTanjim/nui.nvim'        " it's a dependency
"Plug 'xeluxee/competitest.nvim'
"
"call plug#end()
":PlugInstall

let mapleader = "\<Space>"
noremap <Leader>e :Explore<cr>
noremap <Leader>n :vs<cr>
noremap <Leader>wq :wq<CR>
noremap <Leader>q :q<CR>
noremap <Leader>p :bp<CR>
noremap <Leader>n :bn<CR>
noremap <Leader>a ggVG$"*y
noremap <Leader>v :vert terminal ++shell <cr>
noremap <Leader>t :terminal<cr>
noremap <Leader>s :source ~/.vimrc <CR>


"customizations
" adding fzf to runtime path
set rtp+=/opt/homebrew/opt/fzf

" number of colors
set t_Co=256

"set background=dark
"set exrc

"set for latex plugin
set encoding=utf-8 

set autoindent
set autoread
set cin
set expandtab
set hlsearch
set ignorecase
set incsearch
set mousehide
set noerrorbells
set noswapfile
set number
set pastetoggle=
set vb t_vb=
set scrolloff=15
set shiftwidth=4
set tabstop=4
set history=1000
set sw=4
set guifont=*
set iskeyword+=:
"set cursorline
set smarttab
set splitbelow splitright
set shellslash
set nowrap
set relativenumber
filetype indent on
filetype plugin on
filetype on
syntax on



" latex related
"noremap <F5> <ESC> :w <CR> :vert terminal ++shell pdflatex -shell-escape main.tex  
"augroup VimTeX
    "autocmd!
    "autocmd BufReadPre /path/to/project/*.tex
                "\ let b:vimtex_main = '/path/to/project/main.tex'
"augroup END
"let g:vimtex_compiler_latexmx = {
            "\ 'options' : [
            "\   '-shell-escape',
            "\   '-verbose',
            "\   '-file-line-error',
            "\   '-synctex=1',
            "\   '-interaction=nonstopmode',
            "\ ],
            "\}
"

"g:Tex_CompileRule_pdf
"g:Tex_CompileRule_dvi = 'latex --interaction=nonstopmode $*'



" reset the cursor on start (for older versions of vim, usually not required)
"augroup myCmds
"    au!
"    autocmd VimEnter * silent !echo -ne "\e[2 q"
"augroup END


"cursor settings 
let &t_SI = "\e[4 q"
let &t_EI = "\e[2 q"
" Set block cursor in normal mode
if has('gui_running')
  set guicursor=n-v-c:block-Cursor/lCursor
endif
" Set horizontal line cursor in insert mode
autocmd InsertEnter * set guicursor=i-ci:ver25-Cursor/lCursor
autocmd InsertLeave * set guicursor=n-v-c:block-Cursor/lCursor

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


highlight Normal guibg=NONE ctermbg=NONE
