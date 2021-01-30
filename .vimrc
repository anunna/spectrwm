""""""""""""""""""""""""""""""""""""""""""""""""
" Configuration file for vim
""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible

""""""""""""""""""""""""""""""""""""""""""""""""
" appearance
""""""""""""""""""""""""""""""""""""""""""""""""
syntax on
set ruler
set showmode
set showcmd
set cmdheight=1
set matchpairs+=<:>
set number relativenumber
colo peachpuff
set modelines=0
set wrap

""""""""""""""""""""""""""""""""""""""""""""""""
" formating
""""""""""""""""""""""""""""""""""""""""""""""""
set formatoptions=tcqrn1
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set noshiftround
set autoindent
set ignorecase
set magic
set scrolloff=5
set backspace=indent,eol,start

" Explicitly render different types of whitespaces differently
" and render trailing spaces.
set list listchars=tab:→\ ,nbsp:␣,trail:•

""""""""""""""""""""""""""""""""""""""""""""""""
" speed vim up
""""""""""""""""""""""""""""""""""""""""""""""""
set ttyfast
set lazyredraw
set noswapfile
"set list

" searching
""""""""""""""""""""""""""""""""""""""""""""""""
set hlsearch
set incsearch
set ignorecase
" misc.
set encoding=utf-8
" custom mappings
""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap U <c-r>
nnoremap W <c-w>
nnoremap J <c-d>
nnoremap K <c-u>
nnoremap m K
nmap ; :

" disable arrow keys
""""""""""""""""""""""""""""""""""""""""""""""""
no <Up> <Nop>
no <Down> <Nop>
no <Left> <Nop>
no <Right> <Nop>
ino <Up> <Nop>
ino <Down> <Nop>
ino <Left> <Nop>
ino <Right> <Nop>

" statusline
""""""""""""""""""""""""""""""""""""""""""""""""
set laststatus=2
" [filetype] filename [unix]    <line:column> [%location]
set statusline+=%y 
set statusline+=\  
set statusline+=%F
set statusline+=\  
set statusline+=[%{&fileformat}]
"set statusline+=\%2*
set statusline+=%=
set statusline+=[%l:%c]
set statusline+=\  
set statusline+=[%P]
set statusline+=\  
set statusline+=[%L\ lines]

hi Statusline ctermfg=1 ctermbg=0
" reset colour when switching modes
if version >= 700
  au InsertEnter * hi Statusline ctermfg=5 ctermbg=0
  au InsertLeave * hi Statusline ctermfg=1 ctermbg=0
endif

set shell=/bin/zsh
set noautowrite
set hidden

" netrw 
""""""""""""""""""""""""""""""""""""""""""""
let g:netrw_liststyle = 4
let g:netrw_list_hide = '.git,.jpg,.png,.svg'
let g:netrw_altv = 1
let g:netrw_banner = 0
let g:netrw_browser_split = 4
