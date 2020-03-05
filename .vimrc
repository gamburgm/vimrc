filetype plugin indent on

call plug#begin('~/.vim/plugged')

Plug 'lifepillar/vim-solarized8'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'scrooloose/nerdtree'
Plug 'sheerun/vim-polyglot'
Plug 'itchyny/lightline.vim'
Plug 'mhinz/vim-startify'
" Plug 'jremmen/vim-ripgrep'
Plug 'neoclide/coc.nvim', { 'branch': 'release' }

call plug#end()

set exrc				" allow for directory-specific vimrc's

set tabstop=2           " number of spaces tab is shown as
set softtabstop=2		" number of spaces in a tab in editing
set shiftwidth=2		" set indent as 2 spaces
set expandtab			" convert tabs to spaces

let python_highlight_all=1 " for python linting

set number				" line numbers
set relativenumber " relative line numbers
syntax enable			" colors for syntax
set showcmd				" shows last command in bottom bar
set cursorline	  " highlights current line
set wildmenu			" show all autocomplete options (e.g. :e)
set showmatch			" show matching brackets

" set termguicolors and make compatible with tmux
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

set background=dark	    " dark colorscheme
colorscheme solarized8  " solarized colorscheme

let g:lightline = { 'colorscheme': 'solarized' } " solarized colorscheme for lightline

set incsearch			" search as characters are entered
set hlsearch			" highlight matches
set ignorecase		    " ignore case for search

" move vertically by visual line--don't skip screen-wrapped lines
nnoremap j gj
nnoremap k gk

" allows backspace in insert mode to delete all characters
" including tabs, eol, and where the cursor started
" see :help 'backspace'
set backspace=indent,eol,start

" custom header for vim screen, inspired by DOOM emacs

" let g:startify_custom_header = 
let g:startify_custom_header = [
  \ "                                                =================     ===============     ===============   ========  ========",
  \ "                                                \\\\ . . . . . . .\\\\   //. . . . . . .\\\\   //. . . . . . .\\\\  \\\\. . .\\\\// . . //",
  \ "                                                ||. . ._____. . .|| ||. . ._____. . .|| ||. . ._____. . .|| || . . .\\/ . . .||",
  \ "                                                || . .||   ||. . || || . .||   ||. . || || . .||   ||. . || ||. . . . . . . ||",
  \ "                                                ||. . ||   || . .|| ||. . ||   || . .|| ||. . ||   || . .|| || . | . . . . .||",
  \ "                                                || . .||   ||. _-|| ||-_ .||   ||. . || || . .||   ||. _-|| ||-_.|\\ . . . . ||",
  \ "                                                ||. . ||   ||-'  || ||  `-||   || . .|| ||. . ||   ||-'  || ||  `|\\_ . .|. .||",
  \ "                                                || . _||   ||    || ||    ||   ||_ . || || . _||   ||    || ||   |\\ `-_/| . ||", 
  \ "                                                ||_-' ||  .|/    || ||    \\|.  || `-_|| ||_-' ||  .|/    || ||   | \\  / |-_.||",
  \ "                                                ||    ||_-'      || ||      `-_||    || ||    ||_-'      || ||   | \\  / |  `||",
  \ "                                                ||    `'         || ||         `'    || ||    `'         || ||   | \\  / |   ||",
  \ "                                                ||            .===' `===.         .==='.`===.         .===' /==. |  \\/  |   ||",
  \ "                                                ||         .=='   \\_|-_ `===. .==='   _|_   `===. .===' _-|/   `==  \\/  |   ||",
  \ "                                                ||      .=='    _-'    `-_  `='    _-'   `-_    `='  _-'   `-_  /|  \\/  |   ||",
  \ "                                                ||   .=='    _-'          `-__\\._-'         `-_./__-'         `' |. /|  |   ||",
  \ "                                                ||.=='    _-'                                                     `' |  /==.||",
  \ "                                                =='    _-'                                                            \\/   `==",
  \ "                                                \\   _-'                                                                `-_   /",
  \ "                                                 `''                                                                      ``'",
  \]
