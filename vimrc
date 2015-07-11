set nocompatible
filetype off


" -----------------------------------------------------------------------------
" Plugins
" -----------------------------------------------------------------------------

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
Plugin 'pangloss/vim-javascript'
Plugin 'sickill/vim-pasta'
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

set runtimepath^=~/.vim/bundle/ctrlp.vim


" -----------------------------------------------------------------------------
" General settings
" -----------------------------------------------------------------------------

filetype plugin on
filetype indent on
syntax on
set shiftwidth=2
set tabstop=2
set expandtab
set smarttab
set encoding=utf-8
set relativenumber
set number
set hidden " Allows to switch buffers without saving changes
set autoread " Auto reload if file saved externally
set hlsearch " Highlight search terms
set incsearch " Show search matches as you type
set ignorecase " Ignore case when searching
set colorcolumn=80 " Ruler at 80th column
set splitbelow
set splitright

" Write with sudo
cnoremap w!! w !sudo tee % >/dev/null

" Trim whitespaces on save
autocmd BufWritePre * :%s/\s\+$//e

" Ignore node_modules folders
set wildignore+=*/node_modules/*

" Allow to use Russian keymap in normal mode
set langmap=ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz

set wildmenu

" Turn off folding
set foldmethod=manual
set nofoldenable

" Disable automatic comment insertion
autocmd BufNewFile,BufRead * setlocal formatoptions-=cro

" Save that fuckin garbage in one place
set backupdir=~/.vim/backup//
set directory=~/.vim/swap//
set undodir=~/.vim/undo//

" Fix for backspace in os x
set backspace=indent,eol,start

" Regenerate tags automatically
au BufWritePost *.js,*.rb silent! !ctags 2> /dev/null &


" -----------------------------------------------------------------------------
" Status line
" -----------------------------------------------------------------------------

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


" -----------------------------------------------------------------------------
" Colors
" -----------------------------------------------------------------------------

set t_Co=256
colorscheme solarized
set bg=light
hi ColorColumn ctermbg=7
hi clear SignColumn


" -----------------------------------------------------------------------------
" Hotkeys
" -----------------------------------------------------------------------------

nnoremap <C-n> :NERDTreeToggle<CR>
nnoremap <leader>b :TagbarToggle<CR>
nnoremap <leader>m :CtrlPMRU<CR>
nnoremap <leader>t :CtrlPTag<CR>
nnoremap <leader>a :Ag<Space>

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" Disable arrow keys (:
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" Hide search highlighting
nnoremap <leader>n :noh<CR>

" vim-fugitive
nnoremap <leader>gs :Gstatus<cr>
nnoremap <leader>gc :Gcommit<cr>
nnoremap <leader>gl :Glog --<cr>

" ruby/rails
nnoremap <leader>r :Rake!<cr>

" -----------------------------------------------------------------------------
" Settings for plugins
" -----------------------------------------------------------------------------

let g:airline_theme = 'solarized'
let g:airline_left_sep=''
let g:airline_right_sep=''

" No lag when leaving insert mode with vim-airline plugin activated
set ttimeoutlen=50

" Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

" Ag is fast enough that CtrlP doesn't need to cache
let g:ctrlp_use_caching = 0

" Auto focus on tagbar window
let g:tagbar_autofocus = 1

" Syntastic
let g:syntastic_always_populate_loc_list = 1

" vim-slime
let g:slime_target = "tmux"
let g:slime_default_config = {"socket_name": "default", "target_pane": ":2"}

