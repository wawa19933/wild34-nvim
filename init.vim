
let g:config_root = fnamemodify(resolve($MYVIMRC), ":p:h")

set nocompatible        " Must be first line
set shell=/bin/sh
if has('termguicolors')
  set termguicolors       " Use true colors (nvim)
endif
set term=xterm-256color
set mouse=a


"au!
"  autocmd BufRead * highlight OverLength ctermbg=red ctermfg=white guibg=#592929
"  autocmd BufRead * match OverLength /\%81v.*/

"----------------------------------------------------------------------------

if filereadable(g:config_root . '/bundles.vim')
  execute "source " . g:config_root . "/bundles.vim"
endif

"----------------------------------------------------------------------------

syntax on
set background=dark
let g:one_allow_italics = 1
colorscheme one

set autoindent                  " Indent at the same level of the previous line
set smartindent                 " Smart indent
set shiftwidth=4                " Use indents of 4 spaces
set expandtab                   " Tabs are spaces, not tabs
set tabstop=4                   " An indentation every four columns
set softtabstop=4               " Let backspace delete indent
set nojoinspaces                " Prevents inserting two spaces after punctuation on a join (J)

set backspace=indent,eol,start  " Backspace for dummies
set linespace=0                 " No extra spaces between rows
set number                      " Line numbers on
set lazyredraw

set wildmenu
set ignorecase
"set textwidth=90
let &colorcolumn=join(range(110,999),",")
highlight ColorColumn guibg=#2d2d2d ctermbg=246

" Rainbow {
  let g:rainbow_active = 1
" }

" Airline {
  let g:airline_powerline_fonts = 1
" }

" Commentary {
  autocmd FileType cpp,c setlocal commentstring=//\ %s
" }
