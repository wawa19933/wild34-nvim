" Expand Region {
    inoremap <C-J> <Plug>(expand_region_expand)
    inoremap <C-K> <Plug>(expand_region_shrink)
    nnoremap <LocalLeader>v <Plug>(expand_region_expand)
    nnoremap <LocalLeader>V <Plug>(expand_region_shrink)
" }

" Initialize plugins
call plug#begin('~/.local/share/nvim/plugged')

Plug 'vim-airline/vim-airline'
Plug 'NLKNguyen/c-syntax.vim'
Plug 'sheerun/vim-polyglot'
Plug 'pboettch/vim-cmake-syntax'
Plug 'skywind3000/asyncrun.vim'
Plug 'vhdirk/vim-cmake'

call plug#end()
"
" END
"

set hidden
set wildmenu
set wildmode=longest:full,full " Display Vim command mode autocompletion list

let g:airline_powerline_fonts = 1

