filetype plugin indent on

let $MYVIMRC = '~/.vimrc'
let mapleader=','

call plug#begin('~/.vim/plugged')

Plug 'lifepillar/vim-solarized8'    " colorscheme
Plug 'ctrlpvim/ctrlp.vim'           " fuzzy file search
Plug 'scrooloose/nerdtree'          " directory tree
Plug 'sheerun/vim-polyglot'         " syntax coloring (is okay)
Plug 'itchyny/lightline.vim'        " powerline variant
Plug 'mhinz/vim-startify'           " for DOOM
Plug 'tpope/vim-fugitive'           " for git
Plug 'pantharshit00/vim-prisma'     " for prisma syntax highlighting
Plug 'ycm-core/YouCompleteMe'       " for autocompletion & linting
Plug 'tpope/vim-commentary'         " For commenting things out
Plug 'rachitnigam/drracket.vim'     " For Dr.Racket Arrows -> It doesn't work very well, kinda want to clone and modify
" Plug 'kovisoft/slimv'
" Plug 'junegunn/rainbow_parentheses.vim' " For rainbow parens
" Plug 'vim-scripts/paredit.vim'      " For working with Lisps

call plug#end()

set exrc				    " allow for directory-specific vimrc's

set tabstop=2       " number of spaces tab is shown as
set softtabstop=2		" number of spaces in a tab in editing
set shiftwidth=2		" set indent as 2 spaces
set expandtab			  " convert tabs to spaces
set smarttab        " insert tabs based on shiftwidth, not tab size
set shiftround      " use shiftwidth to determine tabbing w/'<' and '>' commands

set autoindent      " always auto-indent
set copyindent      " copy the previous line's indent on autoindent


let python_highlight_all=1 " for python linting

set number				  " line numbers
set relativenumber  " relative line numbers
syntax enable			  " colors for syntax
set showcmd				  " shows last command in bottom bar
set cursorline	    " highlights current line
set wildmenu			  " show all autocomplete options (e.g. :e)
set showmatch			  " show matching brackets
set lazyredraw      " only redraw when something has been changed

set hidden          " hide previously open buffers rather than closing them (e.g., :e)

set nobackup        " don't create backup files
set nowritebackup   " don't create write-backup files
set noswapfile      " don't create backup swap files

set updatetime=300  " shorter update time for VIM and plugins


noremap <C-N> :NERDTreeToggle<CR>

nnoremap <leader>ev :vsplit $MYVIMRC<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>
nnoremap <leader>pv :PlugInstall<CR>
nnoremap <leader>pc :PlugClean<CR>


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
set ignorecase		" ignore case for search
set smartcase     " ignore case if search pattern all lowercase, case-sensitive otherwise TODO does this break the above one?

" move vertically by visual line--don't skip screen-wrapped lines
nnoremap j gj
nnoremap k gk

nnoremap dr 0d$

" allows backspace in insert mode to delete all characters
" including tabs, eol, and where the cursor started
" see :help 'backspace'
set backspace=indent,eol,start

augroup commentary
  autocmd!
  autocmd FileType racket setlocal commentstring=;;\ %s
augroup END

" custom header for vim screen, inspired by DOOM emacs

let g:ascii = [
  \ "=================     ===============     ===============   ========  ========",
  \ "\\\\ . . . . . . .\\\\   //. . . . . . .\\\\   //. . . . . . .\\\\  \\\\. . .\\\\// . . //",
  \ "||. . ._____. . .|| ||. . ._____. . .|| ||. . ._____. . .|| || . . .\\/ . . .||",
  \ "|| . .||   ||. . || || . .||   ||. . || || . .||   ||. . || ||. . . . . . . ||",
  \ "||. . ||   || . .|| ||. . ||   || . .|| ||. . ||   || . .|| || . | . . . . .||",
  \ "|| . .||   ||. _-|| ||-_ .||   ||. . || || . .||   ||. _-|| ||-_.|\\ . . . . ||",
  \ "||. . ||   ||-'  || ||  `-||   || . .|| ||. . ||   ||-'  || ||  `|\\_ . .|. .||",
  \ "|| . _||   ||    || ||    ||   ||_ . || || . _||   ||    || ||   |\\ `-_/| . ||", 
  \ "||_-' ||  .|/    || ||    \\|.  || `-_|| ||_-' ||  .|/    || ||   | \\  / |-_.||",
  \ "||    ||_-'      || ||      `-_||    || ||    ||_-'      || ||   | \\  / |  `||",
  \ "||    `'         || ||         `'    || ||    `'         || ||   | \\  / |   ||",
  \ "||            .===' `===.         .==='.`===.         .===' /==. |  \\/  |   ||",
  \ "||         .=='   \\_|-_ `===. .==='   _|_   `===. .===' _-|/   `==  \\/  |   ||",
  \ "||      .=='    _-'    `-_  `='    _-'   `-_    `='  _-'   `-_  /|  \\/  |   ||",
  \ "||   .=='    _-'          `-__\\._-'         `-_./__-'         `' |. /|  |   ||",
  \ "||.=='    _-'                                                     `' |  /==.||",
  \ "=='    _-'                                                            \\/   `==",
  \ "\\   _-'                                                                `-_   /",
  \ "`''                                                                      ``'",
  \]

  " \ ["  The object-oriented model makes it easy to build up programs by accretion.\n     What this often means\n, in practice, is that it\n provides a structures way to write spaghetti\n code."]
let g:startify_custom_header_quotes = [
  \ ["                                Welcome to VIM"],
  \ ["                                Welcome to HELL"],
  \ ["                          Correct answer, zero points"],
  \ ["                        I'll give you a hint: left paren"],
  \ ["                                     oopsah"],
  \]

let g:startify_custom_header = startify#center(g:ascii + g:startify#fortune#quote())

let g:ctrlp_prompt_mappings = {
  \ 'PrtBS()':    ['<BS>'],
  \ 'PrtCurleft()': ['<C-[>', '<left>', '<C-^>'],
  \ 'PrtCurRight()': ['<C-]>', '<right>'],
  \ 'ToggleType(1)': ['<C-L>', '<C-Up>'],
  \ 'ToggleType(-1)': ['<C-H>', '<C-Down>'],
  \ }
