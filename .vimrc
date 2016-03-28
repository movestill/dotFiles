" Use Vim's settings, instead of Vi's.
set nocompatible

let mapleader = "\<Space>"

:inoremap jj <Esc>

nnoremap <Leader>s :w<Enter>

nnoremap <Leader>h <C-w>h
nnoremap <Leader>l <C-w>l
nnoremap <Leader>j <C-w>j
nnoremap <Leader>k <C-w>k

" Line numbering.
set nu

if exists('+colorcolumn')
    set colorcolumn=80
endif

set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set smarttab

" Ignore case in search.
set ignorecase
" Unless there's a capital letter.
set smartcase
