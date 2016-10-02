"Indent ======================================================================"

set nocompatible
filetype plugin indent on
set ai
set si
set expandtab
set backspace=indent,eol,start
set shiftwidth=2
set tabstop=2
set wrap

"Columns ====================================================================="

set tw=80
set colorcolumn=80

"Lines ======================================================================="

set number
set relativenumber

"Color ======================================================================="

syntax on
colorscheme molokai
match ErrorMsg '\s\+$'
2match ErrorMsg 'for(\|if(\|while(\|sizeof(\|switch(\|#define'

"Auto-completion ============================================================="

inoremap ( ()<Esc>i
inoremap [ []<Esc>i
inoremap ' ''<Esc>i
inoremap " ""<Esc>i
"inoremap { {}<Esc>i
inoremap { {<CR>}<Esc>ko

"Search ======================================================================"

set ignorecase
set smartcase
set hlsearch
set incsearch

"Other ======================================================================="

set mouse=a
"set list

"============================================================================="
