set nocompatible
filetype off


" ------------------------------------------------------------------------------
" Plugins
" ------------------------------------------------------------------------------

set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#rc()

Plugin 'gmarik/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'Valloric/YouCompleteMe'
Plugin 'majutsushi/tagbar'
Plugin 'bling/vim-airline'
Plugin 'tpope/vim-fugitive'
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/syntastic'
Plugin 'mhinz/vim-signify'
Plugin 'digitaltoad/vim-jade'
Plugin 'rking/ag.vim'
Plugin 'slim-template/vim-slim'
Plugin 'tpope/vim-commentary'
Plugin 'altercation/vim-colors-solarized'
Plugin 'moll/vim-node'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-rbenv'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-unimpaired'
Plugin 'tpope/vim-bundler'
Plugin 'jpalardy/vim-slime'
Plugin 'tpope/vim-haml'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'pangloss/vim-javascript'
Plugin 'tpope/vim-dispatch'
Plugin 'sjl/gundo.vim'
Plugin 'godlygeek/tabular'
Plugin 'ternjs/tern_for_vim'
Plugin 'editorconfig/editorconfig-vim'

set runtimepath^=~/.vim/bundle/ctrlp.vim


" ------------------------------------------------------------------------------
" General settings
" ------------------------------------------------------------------------------

filetype plugin on  " Load filetype-specific plugin files
filetype indent on  " Load filetype-specific indent files
syntax on           " Enable syntax highlighting

set encoding=utf-8

set shiftwidth=2    " Number of spaces to use for each step of (auto)indent
set tabstop=2       " Number of visual spaces per TAB
set expandtab       " Tabs are spaces
set smarttab

set number          " Show line numbers
set relativenumber  " But show them relative to the current line
set hidden          " Allows to switch buffers without saving changes
set autoread        " Auto reload if file saved externally

set hlsearch        " Highlight search terms
set incsearch       " Show search matches as you type
set ignorecase      " Ignore case when searching

set colorcolumn=81  " Ruler at the 81th column
set cursorline      " Highlight current line

set splitbelow
set splitright

set history=1000    " How many commands to store in the history

set undofile        " Enable persistent undo history
set undolevels=1000 " Store up to 1000 undo entries

set wildmenu        " Visual autocomplete for command menu
set lazyredraw      " Redraw only when it is really needed

" Ignore node_modules folders
set wildignore+=*/node_modules/*

" Allow to use Russian keymap in normal mode
set langmap=ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz


" Turn off folding
set foldmethod=manual
set nofoldenable

" Where to store backups, swap and undo files
set backupdir=~/.vim/backup//
set directory=~/.vim/swap//
set undodir=~/.vim/undo//

" Fix for backspace in os x
set backspace=indent,eol,start

" Start scrolling three lines before the horizontal window border
set scrolloff=3

" Don’t show the intro message when starting Vim
set shortmess=atI

" Show tabs and trailing whritespaces
set list
set listchars=tab:▸\ ,trail:·

" Don't show preview window with autocompletion
set completeopt-=preview

" ------------------------------------------------------------------------------
" Status line
" ------------------------------------------------------------------------------

set laststatus=2
set statusline=
set statusline+=%-3.3n\                      " buffer number
set statusline+=%f\                          " filename
set statusline+=%h%m%r%w                     " status flags
set statusline+=\[%{strlen(&ft)?&ft:'none'}] " file type
set statusline+=%=                           " right align remainder
set statusline+=0x%-8B                       " character value
set statusline+=%-14(%l,%c%V%)               " line, character
set statusline+=%<%P                         " file position


" ------------------------------------------------------------------------------
" Colors
" ------------------------------------------------------------------------------

set t_Co=256
colorscheme solarized
set bg=light
highlight ColorColumn ctermbg=7
highlight clear SignColumn
highlight CursorLineNr ctermfg=12 ctermbg=7


" ------------------------------------------------------------------------------
" Mappings
" ------------------------------------------------------------------------------

:command WQ wq
:command Wq wq
:command W w
:command Q q
:command Qa qa

nnoremap <C-n> :NERDTreeToggle<CR>
nnoremap <leader>b :TagbarToggle<CR>
nnoremap <leader>p :CtrlPBuffer<CR>
nnoremap <leader>a :Ag<CR>
nnoremap <leader>f :Ag ""<left>
nnoremap <Leader>w :w<CR>
nnoremap <Leader>r :.,$s/\<<C-r><C-w>\>//gc<left><left><left>
nnoremap <F5> :GundoToggle<CR>

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" Disable arrow keys
inoremap <Up> <NOP>
inoremap <Down> <NOP>
inoremap <Left> <NOP>
inoremap <Right> <NOP>
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" Hide search highlighting
nmap <silent> <BS> :noh<CR>

" vim-fugitive
nnoremap <leader>gs :Gstatus<cr>
nnoremap <leader>gc :Gcommit<cr>
nnoremap <leader>gl :Glog --<cr>
nnoremap <leader>gd :Gdiff<cr>

" ternjs
nnoremap <leader>td :TernDef<cr>
nnoremap <leader>tr :TernRename<cr>
nnoremap <leader>tR :TernRefs<cr>

" Bye bye ex mode
nnoremap Q <nop>

" Highlight last inserted text
nnoremap gV `[v`]

" Write with sudo
cnoremap w!! w !sudo tee % >/dev/null


" ------------------------------------------------------------------------------
" Autogroups
" ------------------------------------------------------------------------------

augroup configgroup
  autocmd!

  " Trim whitespaces on save
  autocmd BufWritePre * :%s/\s\+$//e

  " Disable automatic comment insertion
  autocmd BufNewFile,BufRead * setlocal formatoptions-=cro

  " Generate tags on file save
  autocmd BufWritePost *.js,*.rb silent! Start! ctags 2> /dev/null
augroup END


" ------------------------------------------------------------------------------
" Settings for plugins
" ------------------------------------------------------------------------------

" vim-airline theme settings
let g:airline_theme = 'solarized'
let g:airline_left_sep=''
let g:airline_right_sep=''

" No lag when leaving insert mode with vim-airline plugin activated
set ttimeoutlen=50

" CtrlP
let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
let g:ctrlp_use_caching = 0
let g:ctrlp_working_path = 0

" Auto focus on tagbar window
let g:tagbar_autofocus = 1

" Fixes for js tags
let g:tagbar_type_javascript = {
  \ 'ctagstype' : 'JavaScript',
  \ 'kinds'     : [
      \ 'o:objects',
      \ 'f:functions',
      \ 'a:arrays'
  \ ]
\ }

" Syntastic
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_auto_jump = 0
let g:syntastic_javascript_checkers = ['jshint']
let g:syntastic_html_checkers = []

" vim-slime
let g:slime_target = "tmux"
let g:slime_default_config = {"socket_name": "default", "target_pane": ":2"}

" gundo.vim
let g:gundo_right = 1
let g:gundo_preview_bottom = 1

" editorconfig-vim
let g:EditorConfig_exclude_patterns = ['fugitive://.*']

" ------------------------------------------------------------------------------
" GUI specific shit
" ------------------------------------------------------------------------------
if has('gui_running')
  set guifont=Monaco:h13

  " Turn off all GUI shit (menu bar, scrollbars, etc)
  set guioptions=

  " Disable mouse
  set mouse=
  map <ScrollWheelUp> <nop>
  map <ScrollWheelDown> <nop>
endif

