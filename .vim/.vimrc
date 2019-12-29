" auto reload .vimrc
autocmd! bufwritepost .vimrc source %

" Leader maping
let mapleader = ","



" Plugins (with vim-plug) {{{
filetype plugin on

call plug#begin('~/.vim/plugged')

Plug 'simnalamburt/vim-mundo'           " Graphical undo tree - 'super undo'
Plug 'mileszs/ack.vim'	                " Sourcecode search tool (like grep)
Plug 'ctrlpvim/ctrlp.vim'               " Fuzzy file, buffer, mru... finder
Plug 'vim-airline/vim-airline'          " Lightweight powerline for vim
Plug 'vim-airline/vim-airline-themes'   " Themes for powerline
Plug 'python-mode/python-mode', { 'for': 'python', 'branch': 'develop' }    " python-mode
Plug 'scrooloose/nerdtree'              " Show file tree in vim
Plug 'Xuyuanp/nerdtree-git-plugin'      " Addon for NERDTree - add git status flag
Plug 'scrooloose/nerdcommenter'         " Auto Comment blocks of code
Plug 'deviantfero/wpgtk.vim'            " Vim colorscheme working with wpgtk
Plug 'junegunn/goyo.vim'                " Vim distraction free mode
Plug 'takac/vim-hardtime'               " Hardtime for better vim habits
Plug 'vimwiki/vimwiki'                  " Plugin for taking and organizing notes
Plug 'ryanoasis/vim-devicons'           " Add icons for VIM plugins (need load after the other plugins) - Nerd Fonts needed

" initialize plugin system
call plug#end()

" }}}
" Colors and apperance {{{
syntax enable	" enable syntax processing

colorscheme wpgtk

" }}}
    " Spaces and Tabs {{{
    set tabstop=4		" show tab as 4 spaces
    set softtabstop=4	" tab indent = 4 spaces (when editing)
    set shiftwidth=4    " auto indent value
    set expandtab		" tabs are spaces

    " }}}
" UserInterface configuration {{{
set number
set relativenumber	" show line numbers
set cursorline      " highlite current line
set showcmd         " show last command in the bottom
set wildmenu        " visual autocomplete for command menu
set showmatch       " highlight matching brackets
filetype indent on  " load filetype-specific indent files


" }}}
" Text formating {{{

" change block of code indent
vnoremap < <gv
vnoremap > >gv

"insert single char in normal mode
:nnoremap s :exec "normal i".nr2char(getchar())."\e"<CR>
:nnoremap S :exec "normal a".nr2char(getchar())."\e"<CR>

" }}}
" Searching {{{
set incsearch       " real-time matching
set hlsearch        " highlight matches
" toggle search highlight
let hlstate=0
nnoremap <leader><space> :if (hlstate%2 == 0) \| nohlsearch \| else \| set hlsearch \| endif \| let hlstate=hlstate+1<cr>
" }}}
" {{{ Copying and Pasting

" paste below the line
nnoremap <leader>p o<ESC>p

" paste blocks of codes with fixed indents
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
set showmode

" }}}
" Folding and Text wrapping {{{
set foldenable      " enable folding
set foldlevelstart=10   " most folds will be open
set foldnestmax=10
set foldmethod=indent
" space open/closes folds
nnoremap <space> za


" text wrapping ('gq') 
set textwidth=79
set nowrap 
set linebreak   " don't break words
set fo-=t
set colorcolumn=80
highlight ColorColumn ctermbg=233


" }}}
" Better Movement {{{

" -- move vertically by visual line (when folded)
nnoremap j gj
nnoremap k gk

" better split window navigation (CTRL + h/j/l/l)
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h


" Navigating with guides
inoremap <leader><leader> <Esc>/<++><Enter>"_c4l
vnoremap <leader><leader> <Esc>/<++><Enter>"_c4l
map <leader><leader> <Esc>/<++><Enter>"_c4l
" Delete all guides
"map <leader>q :%s/<++>//g<Enter>:nohlsearch<CR>
" Delete next guide
inoremap <leader>w <Esc>/<++><Enter>"_c4l<Esc><c-o>:nohlsearch<CR>a
map <leader>w /<++><Enter>"_c4l<Esc><c-o>:nohlsearch<CR>

" }}}
" Snippets and Autogroups (language-specific settings) {{{

" Templates
nnoremap ,html :-1read $HOME/.vim/templates/skeleton.html<Enter>

augroup configgroup
    autocmd!
    autocmd VimEnter * highlight clear SignColumn
    autocmd BufWritePre *.php,*.py,*.js,*.txt,*.hs,*.java,*.md :call <SID>StripTrailingWhitespaces()
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
    autocmd BufEnter Makefile setlocal noexpandtab
    autocmd BufEnter *.sh setlocal tabstop=2
    autocmd BufEnter *.sh setlocal shiftwidth=2
    autocmd BufEnter *.sh setlocal softtabstop=2
augroup END


augroup autoclosingConfig 
    autocmd!
    autocmd Filetype * inoremap ( ()<++><Esc>F(a
    autocmd Filetype * inoremap *( (
    autocmd Filetype * inoremap () ()
    autocmd Filetype * inoremap ' ''<++><Esc>F';a
    autocmd Filetype * inoremap ;' '
    autocmd Filetype * inoremap '' ''
    autocmd Filetype * inoremap " ""<++><Esc>F";a
    autocmd Filetype * inoremap :" "
    autocmd Filetype * inoremap "" ""
    autocmd Filetype python inoremap { {}<++><Esc>F{a
    autocmd Filetype python inoremap *{ {
    autocmd Filetype python inoremap {} {}
    autocmd Filetype python inoremap [ []<++><Esc>F[a
    autocmd Filetype python inoremap *[ [
    autocmd Filetype python inoremap [] []
    autocmd Filetype php,css,javascript,lua inoremap { {<Enter>}<Esc>O
augroup END

augroup pythonConfig
    autocmd!
    " Code Snippets
    autocmd Filetype python nnoremap ,she i#!/usr/bin/env<space>python<Esc>o<Enter>
    autocmd Filetype python inoremap ,im import<space>
    autocmd Filetype python inoremap ,fim from<space><space>import<space><++><Esc>2b2ha
augroup END

augroup rmdConfig
    autocmd!
    " Autorender Rmarkdown
    autocmd Filetype rmd map <leader>h :w<CR>:!echo<space>"require(rmarkdown);<space>render('<c-r>%')"<space>\|<space>R<space>--vanilla<enter>
    autocmd Filetype rmd map <leader>p :w<CR>:!echo<space>"require(rmarkdown);<space>render('<c-r>%', 'pdf_document')"<space>\|<space>R<space>--vanilla<enter>
augroup END

augroup phpConfig
    autocmd!
    "Code snippets
    autocmd Filetype php inoremap ,P <?php<Enter>?><Esc>O
augroup END

augroup htmlConfig
    autocmd!
    " Code snippets
    autocmd Filetype html,php nnoremap ,css i<link rel="Stylesheet" href=""><Enter><++><Esc>kfff"a
    autocmd Filetype html,php nnoremap ,js i<script src=""></script><++><Esc>F"i

    autocmd Filetype html,php inoremap ,b <b></b><Space><++><Esc>FbT>i
    autocmd FileType html,php inoremap ,1 <h1></h1><Enter><Enter><++><Esc>2kf<i
	autocmd FileType html,php inoremap ,2 <h2></h2><Enter><Enter><++><Esc>2kf<i
	autocmd FileType html,php inoremap ,3 <h3></h3><Enter><Enter><++><Esc>2kf<i
	autocmd FileType html,php inoremap ,p <p></p><Enter><Enter><++><Esc>02kf>a
    autocmd FileType html,php inoremap ,im <img src="" alt="<++>"><++><esc>Fcf"a
    autocmd FileType html,php inoremap ,a <a<Space>href=""><++></a><Space><++><Esc>14hi
    autocmd FileType html,php inoremap ,d <div><Enter></div><++><Esc>kA<Enter>
augroup END

augroup cssConfig
    autocmd!
    "Code snippets
augroup END

" }}}

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
let g:ctrlp_max_height = 30
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
" {{{ Gundo settings 
" toggle gundo (graphical undo tree) - "super undo"
nnoremap <leader>u :MundoToggle<CR> 
" }}}
    " {{{ vim-airline settings
        
    " enable Smarter tab line
    let g:airline#extensions#tabline#enabled = 1

    " powerline font symbols
    let g:airline_powerline_fonts = 1


    " Overriding the inactive statuslin
    function! Render_Only_File(...)
      let builder = a:1
      let context = a:2

      call builder.add_section('file', '! %F')

    " return 0   " the default: draw the rest of the statusline
    " return -1  " do not modify the statusline
      return 1   " modify the statusline with the current contents of the builder
    endfunction
    call airline#add_inactive_statusline_func('Render_Only_File')

    " Add the window number in front of the mode
    function! WindowNumber(...)
        let builder = a:1
        let context = a:2
        call builder.add_section('airline_b', '%{tabpagewinnr(tabpagenr())}')
        return 0
    endfunction

    call airline#add_statusline_func('WindowNumber')
    call airline#add_inactive_statusline_func('WindowNumber')

    " }}}
    " {{{ python-mode settings

    let g:pymode_python = 'python3'     " python 3 syntax

    " Open file with object definition
    let g:pymode_rope_goto_definition_bind = '<leader>g'

    let g:pymode_rope = 1   " turn on rope script
    let g:pymode_rope_autoimport = 1

    " Debugging
    let g:pymode_breakpoint = 1
    let g:pymode_breakpoint_bind = '<leader>b'
    let g:pymode_breakpoint_cmd = ''


    let ropevim_enable_shortcuts = 1    " enable shortcuts
    let g:pymode_rope_goto_definition_cmd = 'vnew'  " open new window vertically
    let g:pymode_rope_extended_complete = 1
    let g:pymode_syntax = 1
    let g:pymode_virtualenv = 1

    "TEMP! change mapping ,r to run python prompt
    noremap  <silent><leader>q :w<CR>:!nohup st -e ipython % > /dev/null <CR>

    " OmniPopup movement
    "set completeopt=longest,menuone
    set completeopt=menuone,noinsert
    function! OmniPopup(action)
        if pumvisible()
            if a:action == 'j'
                return "\<C-N>"
            elseif a:action == 'k'
                return "\<C-P>"
            endif
        endif
        return a:action
    endfunction

    inoremap <silent><C-j> <C-R>=OmniPopup('j')<CR>
    inoremap <silent><C-k> <C-R>=OmniPopup('k')<CR>

    " }}}
    " {{{ NERDTree settings

    " toogle NERDTree
    noremap <leader>t :NERDTreeToggle<CR>
    " close NERDTree with the last buffor
    autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

    " }}}
" Hardtime settings {{{ 
let g:hardtime_default_on = 0   " Always run harditme
let g:hardtime_allow_different_key = 1 " Allow different keys
let g:hardtime_maxcount = 2         " Maximum number of repetative key press
" }}}
" Vimwiki settings {{{

let g:vimwiki_list = [{'path': '~/Documents/notes',
                      \ 'syntax': 'default', 'ext': '.wiki'}]

let g:vimwiki_folding = 'list'
" }}}

    " Vim behavior (config without category) {{{

    "Search down into subfolders and add thats to path
    set path+=**

    " quick save (CTRL + z)
    noremap <C-Z> :update<CR>
    vnoremap <C-Z> <C-C>:update<CR>
    inoremap <C-Z> <C-O>:update<CR>

    " quick exit
    noremap <Leader>e :quit<CR>
    noremap <Leader>E :qa!<CR>

    " save session - "super save" - reopen saved session with 'vim -S'
    nnoremap <leader>s :mksession!<CR>

    " Change timeout lenght (faster changing  airline insert>normal status)
    set timeoutlen=1500

    " edit vimrc and load vimrc bindings
    nnoremap <leader>ev :vsp $MYVIMRC<CR>
    nnoremap <leader>sv :source $MYVIMRC<CR>

    set hidden          " can't close buffer(s) without save

    set modelines=1     "read the last line and change config for specific file



    " }}}




    " vim:foldmethod=marker:foldlevel=0
