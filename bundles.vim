" vim: set sw=4 ts=4 sts=4 et tw=78 foldmarker={,} foldlevel=0 foldmethod=marker spell:
" Plugin manager configuration {

    " Automatically install missing plugins on startup
    autocmd VimEnter *
            \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
            \|   PlugInstall --sync | q
            \| endif

    let g:plug_timeout = 250
    let g:plug_window = 'vertical topleft 60new'

    call plug#begin('~/.local/share/nvim/plugged')

" }

" Plugins {

    " General {
        if count(g:spf13_bundle_groups, 'general')
            if !executable('fzf')
                Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
            endif
            Plug 'junegunn/fzf.vim'
            Plug 'Shougo/context_filetype.vim'  " find fenced code blocks and their filetype
            Plug 'Shougo/neoyank.vim'
            " UI enhancement
            Plug 'arcticicestudio/nord-vim'     " default color scheme
            Plug 'vim-airline/vim-airline'      " nice status line
            Plug 'tpope/vim-fugitive'           " incredible Git integration
            Plug 'jreybert/vimagit'             " easy Git workflow integration
            Plug 'airblade/vim-gitgutter'       " git diff marks
            Plug 'mhinz/vim-startify'           " start page
            Plug 'junegunn/goyo.vim'            " distraction-free mode
            Plug 'amix/vim-zenroom2'            " enhancement to Goyo
            Plug 'junegunn/vim-peekaboo'        " registers preview on copy/paste
        endif
    " }

    " Syntax plugins {
        if count(g:spf13_bundle_groups, 'syntax')
            Plug 'sheerun/vim-polyglot'
            Plug 'pboettch/vim-cmake-syntax'
            Plug 'plasticboy/vim-markdown'
            Plug 'NLKNguyen/c-syntax.vim'
            Plug 'elzr/vim-json'
            Plug 'neovimhaskell/haskell-vim'
            Plug 'docker/docker', {'rtp': '/contrib/syntax/vim/'}
        endif
    " }

    " Themes {
        if count(g:spf13_bundle_groups, 'themes')
            " Plug 'rafi/awesome-vim-colorschemes'
            Plug 'jacoborus/tender.vim'
            Plug 'blueshirts/darcula'
            Plug 'connorholyday/vim-snazzy'
            Plug 'vim-scripts/PaperColor.vim'
            Plug 'morhetz/gruvbox'
            Plug 'mkarmona/colorsbox'
            Plug 'junegunn/seoul256.vim'
            Plug 'kristijanhusak/vim-hybrid-material'
        endif
    " }

    " Misc {
        if count(g:spf13_bundle_groups, 'misc')
            Plug 'burnettk/vim-jenkins'
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

" }

" Use local bundles.vim if available {
    if filereadable(expand("~/.config/nvim/bundles.local.vim"))
        source ~/.config/nvim/bundles.local.vim
    endif
" }

" Initialize plugin system {

    call plug#end()

" }
