" Modeline and License {
" vim: set sw=4 ts=4 sts=4 et tw=78 foldmarker={,} foldlevel=0 foldmethod=marker spell:
"
"             _ _     _ ____  _  _
"            (_) |   | |___ \| || |
"   __      ___| | __| | __) | || |_
"   \ \ /\ / / | |/ _` ||__ <|__   _|
"    \ V  V /| | | (_| |___) |  | |
"     \_/\_/ |_|_|\__,_|____/   |_|
"
"
"   Licensed under the Apache License, Version 2.0 (the "License");
"   you may not use this file except in compliance with the License.
"   You may obtain a copy of the License at
"
"       http://www.apache.org/licenses/LICENSE-2.0
"
"   Unless required by applicable law or agreed to in writing, software
"   distributed under the License is distributed on an "AS IS" BASIS,
"   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
"   See the License for the specific language governing permissions and
"   limitations under the License.
"
"   Copyright 2018 Sergio Scalpone
"
"
"   This file contains plugins
"
" }

" General plugins {
if count(g:spf13_bundle_groups, 'general')
    " File browser
    " Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins'  }
    Plug 'jistr/vim-nerdtree-tabs'          " Keep NT the same in all tabs
    Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
    Plug 'Shougo/vimfiler.vim', { 'on': 'VimFiler' }
    Plug 'mbbill/undotree', {'on': 'UndotreeToggle'} " Graphical undo

    Plug 'osyo-manga/vim-over'          " Preview substitution
    Plug 'terryma/vim-multiple-cursors' " Multiple cursor like in Sublime Text
    Plug 'farmergreg/vim-lastplace'     " Restore cursor position
    Plug 'wellle/targets.vim'           " Textobj operators support 'c', 'd'
    Plug 'tpope/vim-repeat'             " Repeat operator extension
    Plug 'easymotion/vim-easymotion'    " Motion
    Plug 'justinmk/vim-sneak'           " Motion
    Plug 'muziqiushan/vim-bufonly'      " :BO keep current buffer only
    Plug 'mattn/webapi-vim'             " Web API framework

    Plug 'Shougo/vimproc.vim', {'do' : 'make'} " Async command execution
    Plug 'Shougo/neossh.vim'    " Unite / VimFiler SSH extension
    Plug 'Shougo/denite.nvim'   " Unite plugin
    Plug 'Shougo/deol.nvim'     " Integrated shell
    Plug 'Shougo/junkfile.vim'  " Temporary buffer for drafts
    Plug 'Shougo/neomru.vim'    " MRU
    Plug 'Shougo/vinarise.vim'  " Hex editor
    Plug 'Shougo/neoyank.vim'   " Yank history provider for Unite/Fzf
    Plug 'junegunn/vim-peekaboo'        " Display register contents
    Plug 'junegunn/gv.vim'              " Git commit browser (log viewer)

    Plug 'terryma/vim-expand-region'    " IntelliJ-like selection expansion
    Plug 'gcmt/wildfire.vim'            " Select the nearest textobj on Enter

    Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }
    Plug 'haya14busa/incsearch.vim'
    Plug 'tpope/vim-abolish'
    if !exists('g:spf13_no_views')
        Plug 'vim-scripts/restore_view.vim'
    endif
endif
" }

" Themes, UI and syntax {
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
    Plug 'cespare/vim-toml'
    Plug 'saltstack/salt-vim'

    " UI extensions
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    "Plug 'bling/vim-bufferline'             " list of buffers in the command bar
    Plug 'airblade/vim-gitgutter'           " Git markers
    Plug 'luochen1990/rainbow'              " Colorful parentheses
    Plug 'mhinz/vim-startify'               " Fancy start page
    Plug 'junegunn/goyo.vim'                " Disturbtion-free mode
    Plug 'amix/vim-zenroom2'                " Goyo extension
    Plug 'mhinz/vim-signify'                " Display signs on changed lines
    Plug 'greyblake/vim-preview'            " Preview for HTML,md e.t.c
    Plug 'kien/tabman.vim'                  " Tabs manager
    Plug 'nathanaelkane/vim-indent-guides'  " Indent guides
    Plug 'yggdroot/indentline'              " Indent guides
endif
" }

" General Programming {
if count(g:spf13_bundle_groups, 'programming')
    Plug 'devjoe/vim-codequery'         " Code navigation on tags
    Plug 'tpope/vim-fugitive'           " Git support
    Plug 'tpope/vim-commentary'         " Comment toggle
    Plug 'scrooloose/nerdcommenter', {'on': ['NERDComComment', 'NERDComToggleComment', 'NERDComInvertComment', 'NERDComSexyComment']}    " Comment toggle
    if executable('ctags')
        Plug 'majutsushi/tagbar'
    endif
    Plug 'metakirby5/codi.vim', {'on': 'Codi'} " Interactive scratchpad with Python support
endif
" }

" Snippets & AutoComplete {
if count(g:spf13_bundle_groups, 'deoplete')
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins'  }
    if filereadable(expand('~/.config/nvim/deoplete.vim'))
        source ~/.config/nvim/deoplete.vim
    endif
endif

if count(g:spf13_bundle_groups, 'ultisnips')
    Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
endif
" }

" Linter & Syntacs checker {
    if count(g:spf13_bundle_groups, 'linter')
        "Plug 'scrooloose/syntastic'
        Plug 'w0rp/ale'
    endif
" }

" C/C++ {
if count(g:spf13_bundle_groups, 'c/c++')
    " Plug 'jansenm/vim-cmake'
    Plug 'skywind3000/asyncrun.vim'
    Plug 'vhdirk/vim-cmake'
    " Plug 'jalcine/cmake.vim'
    if executable('gtags')
        Plug 'bbchung/gtags.vim', {'for': ['c', 'cpp'], 'on': ['Gtags']}
        Plug 'bbchung/gasynctags', {'for': ['c', 'cpp'], 'on': ['Gtags']}
        Plug '5t111111/alt-gtags.vim', {'on': 'AltGtags'}
        Plug 'hewes/unite-gtags', {'for': ['c', 'cpp']}
    endif
endif
" }

" Go {
if count(g:spf13_bundle_groups, 'go')
    Plug 'garyburd/go-explorer'
    Plug 'jodosha/vim-godebug'
    Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
    "Plug 'Blackrush/vim-gocode'
    "Plug 'nsf/gocode', { 'rtp': 'nvim', 'do': '~/.config/nvim/plugged/gocode/nvim/symlink.sh' }
endif
" }

" Rust {
if count(g:spf13_bundle_groups, 'rust')
    Plug 'rust-lang/rust.vim', { 'for': 'rust' }
endif
" }

" Python {
if count(g:spf13_bundle_groups, 'python')
    Plug 'hynek/vim-python-pep8-indent'
    Plug 'klen/python-mode'
endif
" }

" Ruby {
if count(g:spf13_bundle_groups, 'ruby')
    Plug 'tpope/vim-cucumber', { 'for': 'ruby' }
    Plug 'tpope/vim-rails', { 'for': 'ruby' }
    Plug 'quentindecock/vim-cucumber-align-pipes'

    let g:rubycomplete_buffer_loading = 1
    " let g:rubycomplete_classes_in_global = 1
    " let g:rubycomplete_rails = 1
endif
" }

" Fzf & CtrlP {
if count(g:spf13_bundle_groups, 'fzf')
    "Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
    Plug 'junegunn/fzf.vim'
    Plug 'pbogut/fzf-mru.vim'
    Plug 'dominickng/fzf-session.vim'
    Plug 'fszymanski/fzf-gitignore', {'do': ':UpdateRemotePlugins'}
    Plug 'justinhoward/fzf-neoyank'
endif
if count(g:spf13_bundle_groups, 'ctrlp')
    Plug 'ctrlpvim/ctrlp.vim'
    Plug 'tacahiroy/ctrlp-funky'
    Plug 'felikz/ctrlp-py-matcher'
endif
" }

" HTML {
if count(g:spf13_bundle_groups, 'html')
    " Plug 'alvan/vim-closetag'
    Plug 'hail2u/vim-css3-syntax'
    Plug 'gorodinskiy/vim-coloresque'
    Plug 'tpope/vim-haml'
    Plug 'mattn/emmet-vim'
endif
" }

" Misc {
if count(g:spf13_bundle_groups, 'misc')
    Plug 'andrewradev/splitjoin.vim'        " Better split/join lines and objects
    Plug 'dbakker/vim-projectroot'          " Function to find project root
    Plug 'derekwyatt/vim-fswitch'           " Switch source/header
    Plug 'MattesGroeger/vim-bookmarks'      " Bookmark manage (integ. CtrlP)
    Plug 'mattn/gist-vim'                   " GitHub Gist commands
    Plug 'junegunn/vim-github-dashboard', {'on': ['GHDashboard', 'GHActivity']} " Github notifications
    Plug 'rodjek/vim-puppet', {'for': 'puppet'}
endif
" }

" Writing {
if count(g:spf13_bundle_groups, 'writing')
    Plug 'reedes/vim-litecorrect'
    Plug 'reedes/vim-textobj-sentence'
    Plug 'reedes/vim-textobj-quote'
    Plug 'reedes/vim-wordy'
    Plug 'kana/vim-textobj-user'
    Plug 'michaeljsmith/vim-indent-object'  " Plugin defines a new text object, based on indentation levels
    Plug 'tpope/vim-surround'           " Surrounding features for Textobj

    Plug 'junegunn/vim-journal'             " syntax for Markdown based language to looks pretty in vim
    Plug 'junegunn/vim-easy-align'      " Align text objects
    "Plug 'godlygeek/tabular'            " Align text objects
endif
" }

