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

