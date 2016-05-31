"Always show current position
set ruler
set backspace=eol,start,indent
set hlsearch
set incsearch

syntax enable
set nobackup
set nowb
set noswapfile

set expandtab
set shiftwidth=4
set tabstop=4
set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines
set nu

"Smart paste with F5 to toggel
set invpaste paste
imap <F5> <C-O><F5>
set pastetoggle=<F5>

filetype plugin on
filetype indent on

"Browsing through list of fles using Ctrl -N / P
nnoremap <C-N> :next<Enter>
nnoremap <C-P> :prev<Enter>
set confirm

colorscheme c
set rtp+=$HOME/.local/lib/python2.7/site-packages/powerline/bindings/vim
set laststatus=2
set t_Co=256

map <F12> :set number!<CR>
imap <F12> <c-o>:set number!<CR>

syntax on
filetype plugin indent on

nnoremap <leader>y "*y
nnoremap <leader>p "*p
nnoremap <Leader>P "*P

set clipboard=unnamedplus

:map <F2> i<CR><ESC>
":map ±
:map <C-a> ggVG

execute pathogen#infect()

