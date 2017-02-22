" Use Vim's settings, instead of Vi's.
set nocompatible

execute pathogen#infect()
syntax on
filetype plugin indent on

colorscheme desert

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

" Tab settings.
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set smarttab

" Ignore case in search.
set ignorecase
" Unless there's a capital letter.
set smartcase

" Search subfolders.
set path+=**

" Display all matching files for tab completion.
set wildmenu

" Show keystrokes in status line in normal mode.
set showcmd

set splitbelow

" Get Code Issues and syntax errors
let g:syntastic_cs_checkers = ['syntax', 'semantic', 'issues']

" Don't require save to change buffers.
set hidden

" Use system clipboard as default register.
set clipboard=unnamed

augroup omnisharp_cmds
    autocmd!
    " Automatic syntax check on events (TextChanged requires >= vim 7.4).
    autocmd BufEnter,TextChanged,InsertLeave *.cs SyntasticCheck

    " Show type info when cursor stops moving.
    autocmd CursorHold *.cs call OmniSharp#TypeLookupWithoutDocumentation()
    autocmd FileType cs nnoremap gd :OmniSharpGotoDefinition<cr>
augroup END 

" Delay (ms) before fetching type/symbol info.
set updatetime=500
