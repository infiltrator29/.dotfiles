" auto reload .vimrc
autocmd! bufwritepost .vimrc source %

" Leader maping
let mapleader = ","





" Plugins (with vim-plug) {{{
call plug#begin('~/.vim/plugged')

Plug 'sjl/gundo.vim'	    " Graphical undo tree - 'super undo'
Plug 'mileszs/ack.vim'	    " Sourcecode search tool (like grep)
Plug 'ctrlpvim/ctrlp.vim'   " Fuzzy file, buffer, mru... finder

" initialize plugin system
call plug#end()

" }}}
" Colors and apperance {{{
syntax enable	" enable syntax processing

" }}}
" Spaces and Tabs {{{
set tabstop=4		" show tab as 4 spaces
set softtabstop=4	" tab indent = 4 spaces (when editing)
set expandtab		" tabs are spaces

" }}}
" UserInterface configuration {{{
set number	        " show line numbers
set cursorline      " highlite current line
set showcmd         " show last command in the bottom
set wildmenu        " visual autocomplete for command menu
set showmatch       " highlight matching brackets
filetype indent on  " load filetype-specific indent files

" }}}
" Text formating {{{

" paste below the line
nnoremap <leader>p o<ESC>p


" }}}
" Searching {{{
set incsearch       " real-time matching
set hlsearch        " highlight matches
" turn odd search highlight
nnoremap <leader><space> :nohlsearch<CR>

" }}}
" Folding {{{
set foldenable      " enable folding
set foldlevelstart=10   " most folds will be open
set foldnestmax=10
set foldmethod=indent
" space open/closes folds
nnoremap <space> za

" }}}
" Better Cursor Movement {{{
" -- move vertically by visual line (when folded)
nnoremap j gj
nnoremap k gk

" }}}
" Autogroups (language-specific settings) {{{
augroup configgroup
    autocmd!
    autocmd VimEnter * highlight clear SignColumn
    autocmd BufWritePre *.php,*.py,*.js,*.txt,*.hs,*.java,*.md
            \:call <SID>StripTrailingWhitespaces()
    autocmd FileType java setlocal noexpandtab
    autocmd FileType java setlocal list
    autocmd FileType java setlocal listchars=tab:+\ ,eol:-
    autocmd FileType java setlocal formatprg=par\ -w80\ -T4
    autocmd FileType php setlocal expandtab
    autocmd FileType php setlocal list
    autocmd FileType php setlocal listchars=tab:+\ ,eol:-
    autocmd FileType php setlocal formatprg=par\ -w80\ -T4
    autocmd FileType ruby setlocal tabstop=2
    autocmd FileType ruby setlocal shiftwidth=2
    autocmd FileType ruby setlocal softtabstop=2
    autocmd FileType ruby setlocal commentstring=#\ %s
    autocmd FileType python setlocal commentstring=#\ %s
    autocmd BufEnter *.cls setlocal filetype=java
    autocmd BufEnter *.zsh-theme setlocal filetype=zsh
    autocmd BufEnter Makefile setlocal noexpandtab
    autocmd BufEnter *.sh setlocal tabstop=2
    autocmd BufEnter *.sh setlocal shiftwidth=2
    autocmd BufEnter *.sh setlocal softtabstop=2
augroup END

"}}}
" Backups {{{
" -- save backup files in /tmp
set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set backupskip=/tmp/*,/private/tmp/*
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set writebackup
" }}}
" Custom Functions {{{
" -- functions created by Doug Black (dougblack.io)
" toggle between number and relativenumber
function! ToggleNumber()
    if(&relativenumber == 1)
        set norelativenumber
        set number
    else
        set relativenumber
    endif
endfunc

" strips trailing whitespace at the end of files. this
" is called on buffer write in the autogroup above.
function! <SID>StripTrailingWhitespaces()
    " save last search & cursor position
    let _s=@/
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    let @/=_s
    call cursor(l, c)
endfunction

" -- my own functions:

"}}}

" CtrlP settings {{{
let g:ctrlp_match_window = 'bottom,order:ttb'
let g:ctrlp_switch_buffer = 0
let g:ctrlp_working_path_mode = 0
" -- use The Silver Search if avilable
if executable('ag')
    let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'
endif

"}}}
" ack.vim settings {{{


" open ack.vim
" -- Open first matching file
nnoremap <leader>A :Ack
" -- Searching without opening first matching file
nnoremap <leader>a :Ack!

" using The Silver Searcher if available
if executable('ag')
	  let g:ackprg = 'ag --vimgrep'
endif

" }}}

" Vim behavior (config without category) {{{


set modelines=1     "read the last line and change config for specific file

" toggle gundo (graphical undo tree) - "super undo"
nnoremap <leader>u :GundoToggle<CR>

" save session - "super save" - reopen saved session with 'vim -S'
nnoremap <leader>s :mksession<CR>

" }}}






" vim:foldmethod=marker:foldlevel=0
