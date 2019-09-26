" Use Vim's settings, instead of Vi's.
set nocompatible
set encoding=utf-8

execute pathogen#infect()
syntax on
filetype plugin indent on

" colorscheme desert
colorscheme zellner

let mapleader = "\<Space>"

:inoremap jj <Esc>

nnoremap <Leader>q :q<Enter>
nnoremap <Leader>s :w<Enter>
nnoremap <Leader>w :b#\|bd#<Enter>
nnoremap <Leader>p :CtrlPMixed<Enter>
nnoremap <Leader>b :CtrlPBuffer<Enter>
nnoremap <Leader>n :set relativenumber!<Enter>

nnoremap <Leader>h <C-w>h
nnoremap <Leader>l <C-w>l
nnoremap <Leader>j <C-w>j
nnoremap <Leader>k <C-w>k

nnoremap <Leader>m :-1read ~/dotfiles/_vim/snippets/microns_copyright.txt<Enter>14j
nnoremap <Leader>dc :-1read ~/dotfiles/_vim/snippets/csharp_doc.txt<Enter>V3j
nnoremap <Leader>dp :read ~/dotfiles/_vim/snippets/py_doc.txt<Enter>o

nnoremap <Leader>v :source ~/.vimrc<cr>

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
set statusline=%<%f\ %h%m%r%=%{FugitiveStatusline()}\ %-14.(%l,%c%V%)\ %P

" Don't require save to change buffers.
set hidden

" Use system clipboard as default register.
set clipboard=unnamed

" let g:ale_linters = {'cs': ['OmniSharp'], 'python': ['pyls'], 'typescript': ['tsserver']}
let g:ale_linters = {'cs': ['OmniSharp'], 'python': ['pyls'], 'typescript': ['tsserver', 'eslint']}
let g:ale_fixers = {
\ '*': ['trim_whitespace'],
\ 'typescript': ['eslint'],
\}
highlight ALEWarning ctermbg=DarkMagenta
highlight ALEError ctermbg=LightGrey

let g:OmniSharp_stop_server = 2  " Automatically stop the server on exit.
let g:OmniSharp_server_use_mono = 1
let g:OmniSharp_timeout = 2

augroup yaml_cmds
    autocmd!
    autocmd FileType yaml setlocal tabstop=2
    autocmd FileType yaml setlocal shiftwidth=2
    autocmd FileType yaml setlocal softtabstop=2
augroup END

augroup omnisharp_cmds
    autocmd!
    " Show type info when cursor stops moving.
    autocmd CursorHold *.cs call OmniSharp#TypeLookupWithoutDocumentation()
    autocmd FileType cs nnoremap <buffer> gd :OmniSharpGotoDefinition<cr>
    autocmd FileType cs nnoremap <buffer> <Leader>fu :OmniSharpFindUsages<cr>
    autocmd FileType cs nnoremap <buffer> <Leader>fi :OmniSharpFindImplementations<cr>
    autocmd FileType cs nnoremap <buffer> <Leader>r :OmniSharpRename<cr>
    autocmd FileType cs nnoremap <buffer> <Leader>os :OmniSharpStopServer<cr>
    autocmd FileType cs nnoremap <buffer> <Leader>og :OmniSharpStartServer<cr>
augroup END

augroup javascript_cmds
    autocmd!
    autocmd FileType javascript setlocal tabstop=2
    autocmd FileType javascript setlocal shiftwidth=2
    autocmd FileType javascript setlocal softtabstop=2
augroup END

augroup typescript_cmds
    autocmd!
    " Show type info when cursor stops moving.
    autocmd FileType typescript setlocal tabstop=2
    autocmd FileType typescript setlocal shiftwidth=2
    autocmd FileType typescript setlocal softtabstop=2
    autocmd FileType typescript nnoremap <buffer> gd :TsuDefinition<cr>
    autocmd FileType typescript nnoremap <buffer> <Leader>t : <C-u>echo tsuquyomi#hint()<CR>
    autocmd FileType typescript nnoremap <buffer> <Leader>r :TsuRenameSymbol<cr>
augroup END

" Delay (ms) before fetching type/symbol info.
set updatetime=500

" YouCompleteMe: use first python in path for jedi.
let g:ycm_python_binary_path = 'python'

" YouCompleteMe: compiled with Python2.
"let g:ycm_server_python_interpreter = '/usr/bin/python'

" YouCompleteMe: jump to definition.
nnoremap <Leader>gt :YcmCompleter GoToDefinition<Enter>

" YouCompleteMe: show docs.
nnoremap <Leader>gd :YcmCompleter GetDoc<Enter>

" CtrlP use system file find.
" let g:ctrlp_user_command = 'find %s -not -path "*/.git/*" -not -path "*/node_modules/*" \! -name "*.meta" \! -name "*.swp" -type f'
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
" Set CtrlP local working directory to that of current file unless it's a 
" sub-folder of the CWD.
let g:ctrlp_working_path_mode = 'a'
let g:ctrlp_by_filename = 1

if has('python')
    let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }
" else
"     echo 'No Python for pymatcher to use.'
endif

let g:ctrlp_lazy_update = 350
let g:ctrlp_clear_cache_on_exit = 0

" Omnisharp-vim complete options.
set completeopt=longest,menuone,preview

set wildignore+=*/.git/*,*.swp
