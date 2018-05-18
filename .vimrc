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

nnoremap <Leader>m :-1read ~/dotfiles/_vim/snippets/microns_copyright.txt<Enter>14j
nnoremap <Leader>dc :-1read ~/dotfiles/_vim/snippets/csharp_doc.txt<Enter>V3j
nnoremap <Leader>dp :read ~/dotfiles/_vim/snippets/py_doc.txt<Enter>o

" Line numbering.
set number
set relativenumber

if exists('+colorcolumn')
    set colorcolumn=80
endif

" Allow backspacing over tabs/indents.
set backspace=indent

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

" Don't require save to change buffers.
set hidden

" Use system clipboard as default register.
set clipboard=unnamed

" Get code issues and syntax errors from OmniSharp.
let g:syntastic_cs_checkers = ['code_checker']

let g:OmniSharp_stop_server = 2  " Automatically stop the server on exit.
let g:OmniSharp_server_type = 'roslyn'
let g:OmniSharp_server_use_mono = 1
let g:OmniSharp_server_path = '/usr/local/bin/OmniSharp/OmniSharp.exe'
let g:OmniSharp_host = 'http://localhost:2000'
let g:OmniSharp_timeout = 1

augroup omnisharp_cmds
    autocmd!
    " Automatic syntax check on events (TextChanged requires >= vim 7.4).
    autocmd BufEnter,TextChanged,InsertLeave *.cs SyntasticCheck

    " Show type info when cursor stops moving.
    autocmd CursorHold *.cs call OmniSharp#TypeLookupWithoutDocumentation()
    autocmd FileType cs nnoremap <buffer> gd :OmniSharpGotoDefinition<cr>
    autocmd FileType cs nnoremap <buffer> <Leader>fu :OmniSharpFindUsages<cr>
    autocmd FileType cs nnoremap <buffer> <Leader>fi :OmniSharpFindImplementations<cr>
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
" Set CtrlP local working directory to that of current file unless it's a 
" sub-folder of the CWD.
let g:ctrlp_working_path_mode = 'a'

" Omnisharp-vim complete options.
set completeopt=longest,menuone,preview

