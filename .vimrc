" Use Vim's settings, instead of Vi's.
set nocompatible

execute pathogen#infect()
syntax on
filetype plugin indent on

colorscheme desert

let mapleader = "\<Space>"

:inoremap jj <Esc>

nnoremap <Leader>s :w<Enter>
nnoremap <Leader>w :bp\|bd#<Enter>
nnoremap <Leader>p :CtrlPMixed<Enter>
nnoremap <Leader>b :CtrlPBuffer<Enter>

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

" Use tree view for file browsing.
let g:netrw_liststyle=3

" Display all matching files for tab completion.
set wildmenu

" Show keystrokes in status line in normal mode.
set showcmd

set splitbelow

" Always show status line.
set laststatus=2

" Status line with column and line number.
set statusline=%<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P

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

" YouCompleteMe: use first python in path for jedi.
let g:ycm_python_binary_path = 'python'

" YouCompleteMe: compiled with Python2.
let g:ycm_server_python_interpreter = '/usr/bin/python'

" YouCompleteMe: jump to definition.
nnoremap <Leader>gt :YcmCompleter GoToDefinition<Enter>

" YouCompleteMe: show docs.
nnoremap <Leader>gd :YcmCompleter GetDoc<Enter>

" CtrlP use system file find.
let g:ctrlp_user_command = 'find %s \! -name "*.meta" \! -name "*.swp" -type f'

" Omnisharp-vim complete options.
set completeopt=longest,menuone,preview

