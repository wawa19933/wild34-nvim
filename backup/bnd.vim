" vim: set sw=4 ts=4 sts=4 et tw=78 foldmarker={,} foldlevel=0 foldmethod=marker spell:

" Help for 'Plug' {

" " Multiple Plug commands can be written in a single line using | separators
" Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

" " On-demand loading
" Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle'  }
" Plug 'tpope/vim-fireplace', { 'for': 'clojure'  }

" " Using a non-master branch
" Plug 'rdnetto/YCM-Generator', { 'branch': 'stable'  }

" " Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
" Plug 'fatih/vim-go', { 'tag': '*'  }

" " Plugin options
" Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim'  }

" " Plugin outside ~/.vim/plugged with post-update hook
" Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all'  }


" " NERD tree will be loaded on the first invocation of NERDTreeToggle command
" Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle'  }

" " Multiple commands
" Plug 'junegunn/vim-github-dashboard', { 'on': ['GHDashboard', 'GHActivity']  }

" " Loaded when clojure file is opened
" Plug 'tpope/vim-fireplace', { 'for': 'clojure'  }

" " Multiple file types
" Plug 'kovisoft/paredit', { 'for': ['clojure', 'scheme']  }

" " On-demand loading on both conditions
" Plug 'junegunn/vader.vim',  { 'on': 'Vader', 'for': 'vader'  }

" " Code to execute when the plugin is lazily loaded on demand
" Plug 'junegunn/goyo.vim', { 'for': 'markdown'  }
" autocmd! User goyo.vim echom 'Goyo is now loaded!'"

" }


" General plugins {
if count(g:spf13_bundle_groups, 'general')
    Plug 'Shougo/context_filetype.vim'
    Plug 'Shougo/neoyank.vim'
    " Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins'  }
    " Plug 'Shougo/vimfiler.vim'
    Plug 'Shougo/junkfile.vim'
    Plug 'Shougo/neomru.vim'
    " Hex editor
    Plug 'Shougo/vinarise.vim'

    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
    Plug 'junegunn/fzf.vim'
    Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }
    Plug 'junegunn/vim-peekaboo'
    Plug 'junegunn/gv.vim'

    Plug 'godlygeek/tabular'
endif
" }

" Themes {
if count(g:spf13_bundle_groups, 'themes')
    Plug 'rafi/awesome-vim-colorschemes'

    Plug 'jacoborus/tender.vim'
    Plug 'blueshirts/darcula'
    Plug 'mkarmona/colorsbox'
    Plug 'junegunn/seoul256.vim'
    Plug 'connorholyday/vim-snazzy'
    Plug 'kristijanhusak/vim-hybrid-material'
    Plug 'arcticicestudio/nord-vim'
    Plug 'morhetz/gruvbox'
    Plug 'vim-scripts/PaperColor.vim'

    " Enhanced syntax
    Plug 'pboettch/vim-cmake-syntax'
    Plug 'docker/docker', {'rtp': '/contrib/syntax/vim/'}
    Plug 'plasticboy/vim-markdown'
    Plug 'sheerun/vim-polyglot'
    Plug 'NLKNguyen/c-syntax.vim'
    Plug 'elzr/vim-json'
    Plug 'neovimhaskell/haskell-vim'

    " UI extensions
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'airblade/vim-gitgutter'
    Plug 'mhinz/vim-startify'
    Plug 'junegunn/goyo.vim'
    Plug 'amix/vim-zenroom2'
endif
" }

" Snippets & AutoComplete {
if count(g:spf13_bundle_groups, 'deoplete')
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins'  }

    Plug 'Shougo/neco-vim'
    Plug 'Shougo/neco-syntax'
    Plug 'eagletmt/neco-ghc'
    Plug 'slashmili/alchemist.vim'

    Plug 'Shougo/neosnippet'
    Plug 'Shougo/neosnippet-snippets'
    Plug 'honza/vim-snippets'

    Plug 'Shougo/denite.nvim'
    Plug 'Shougo/deol.nvim'
endif
" }

" C/C++ {
if count(g:spf13_bundle_groups, 'c/c++')
    " Plug 'jansenm/vim-cmake'
    Plug 'skywind3000/asyncrun.vim'
    Plug 'vhdirk/vim-cmake'
    Plug 'jalcine/cmake.vim'
    " Plug 'xolox/vim-misc'
    " Plug 'xolox/vim-easytags'
    if executable('ctags')
        Plug 'majutsushi/tagbar'
    endif
    if executable('gtags')
        Plug 'bbchung/gasynctags'
        Plug '5t111111/alt-gtags.vim'
        " Plug 'hewes/unite-gtags'
        " Plug 'bbchung/gtags.vim'
    endif
    if count(g:spf13_bundle_groups, 'deoplete')
        " Plug 'zchee/deoplete-clang'
        Plug 'Shougo/deoplete-clangx'
        Plug 'Shougo/neoinclude.vim'
    endif
endif
" }

" Go {
if count(g:spf13_bundle_groups, 'go')
    Plug 'garyburd/go-explorer'
    Plug 'jodosha/vim-godebug'
    if count(g:spf13_bundle_groups, 'deoplete')
        Plug 'zchee/deoplete-go', { 'do': 'make' }
    endif
endif
" }

" Rust {
    if count(g:spf13_bundle_groups, 'rust')
        " Plug 'racer-rust/vim-racer'
        Plug 'rust-lang/rust.vim', { 'for': 'rust' }
        Plug 'autozimu/LanguageClient-neovim', {
                    \ 'branch': 'next',
                    \ 'do': 'bash install.sh',
                    \ }
        if count(g:spf13_bundle_groups, 'deoplete')
            Plug 'sebastianmarkow/deoplete-rust', { 'for': 'rust' }
        endif
    endif
" }

" Python {
if count(g:spf13_bundle_groups, 'python')
    Plug 'zchee/deoplete-jedi'
endif
" }

" Misc {
if count(g:spf13_bundle_groups, 'misc')
    Plug 'andrewradev/splitjoin.vim'
    Plug 'dbakker/vim-projectroot'
    Plug 'junegunn/vim-journal'
    Plug 'junegunn/vim-easy-align'
    Plug 'derekwyatt/vim-fswitch'
    Plug 'pbogut/fzf-mru.vim'
    Plug 'dominickng/fzf-session.vim'
    Plug 'fszymanski/fzf-gitignore', {'do': ':UpdateRemotePlugins'}
    Plug 'justinhoward/fzf-neoyank'
endif
" }
