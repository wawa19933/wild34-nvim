" vim: set sw=4 ts=4 sts=4 et tw=78 foldmarker={,} foldlevel=0 foldmethod=marker spell:
" Plugin manager configuration {
    if has('nvim')
        if filereadable('~/.local/share/nvim/site/autoload/plug.vim')
            silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
                \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
        endif
    else
        if filereadable('~/.vim/autoload/plug.vim')
            silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
                \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
        endif
    endif

    " Automatically install missing plugins on startup
    " autocmd VimEnter *
    "         \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
    "         \|   PlugInstall --sync | q
    "         \| endif

    let g:plug_timeout = 250
    let g:plug_window = 'vertical topleft 60new'

    call plug#begin('~/.local/share/vim/plugged')

" }

" Plugins {

    if count(g:spf13_bundle_groups, '_testing')
        Plug 'arcticicestudio/nord-vim'     " default color scheme
        " Plug 'ryanoasis/vim-devicons'       " filetype icons for NERDTree
        Plug 'junegunn/fzf.vim'
        Plug 'saltstack/salt-vim'           " SaltStack syntax support
        Plug 'airblade/vim-gitgutter'       " git diff marks
        Plug 'chase/vim-ansible-yaml'       " Ansible syntax support
    endif

    " Essential {
    if count(g:spf13_bundle_groups, 'essential')
        Plug 'vim-airline/vim-airline'      " nice status line
        Plug 'scrooloose/nerdtree'          " file manager
        Plug 'tpope/vim-fugitive'           " incredible Git integration
    endif
    " }

    " General {
        if count(g:spf13_bundle_groups, 'general')
            if !executable('fzf')
                Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
            endif
            Plug 'junegunn/fzf.vim'
            Plug 'Shougo/context_filetype.vim'  " find fenced code blocks and their filetype
            Plug 'Shougo/neoyank.vim'           " yank history support
            Plug 'Shougo/neopairs.vim'          " auto close brackets/tags
            Plug 'farmergreg/vim-lastplace'     " restore cursor position
            Plug 'milkypostman/vim-togglelist'  " commands to toggle QuickFix or Location lists
            Plug 'junegunn/vim-slash'           " clears search hl
            Plug 'scrooloose/nerdtree'          " file manager
            Plug 'Xuyuanp/nerdtree-git-plugin'  " git status for NERDTree
            Plug 'tiagofumo/vim-nerdtree-syntax-highlight' " color highlight files in NERDTree
            " UI enhancement
            Plug 'terryma/vim-multiple-cursors' " Sublime-like multiple cursors
        endif
    " }

    " UI {
    if count(g:spf13_bundle_groups, 'ui')
        Plug 'arcticicestudio/nord-vim'     " default color scheme
        Plug 'jreybert/vimagit'             " easy Git workflow integration
        Plug 'mhinz/vim-startify'           " start page
        Plug 'junegunn/goyo.vim'            " distraction-free mode
        Plug 'junegunn/limelight.vim'       " paragraph highlighting for better focus
        Plug 'amix/vim-zenroom2'            " enhancement to Goyo
        Plug 'junegunn/vim-peekaboo'        " registers preview on copy/paste
    endif
    " }
    " Extended motion {
    if count(g:spf13_bundle_groups, 'motion')
        Plug 'haya14busa/incsearch.vim'     " Incremental search
        Plug 'haya14busa/incsearch-easymotion.vim' " EasyMotion for incremental search
            \ | Plug 'easymotion/vim-easymotion'
        Plug 'haya14busa/incsearch-fuzzy.vim'
        Plug 'yuttie/comfortable-motion.vim' " Smooth scrolling
        Plug 'matze/vim-move'               " Move lines up/down
        Plug 'justinmk/vim-sneak'           " Literal motion (EasyMotion)
    endif
    " }

    " Linter {
        if count(g:spf13_bundle_groups, 'linter')
            Plug 'w0rp/ale'
            " Plug 'neomake/neomake'
        endif
    " }

    " Auto-complition & Snippets {
        if count(g:spf13_bundle_groups, 'deoplete')
            if has('nvim')
                Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
            else
                Plug 'Shougo/deoplete.nvim'
                Plug 'roxma/nvim-yarp'
                Plug 'roxma/vim-hug-neovim-rpc'
            endif
            " neosnippet: "neosnippet" source
            " Plug 'Shougo/neosnippet.vim' | Plug 'Shougo/neosnippet-snippets'
            " UltiSnips source: "ultisnips" source for UltiSnips
            Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
            " Plug 'nixprime/cpsm', {'do': 'env PY3=ON bash install.sh'}
        endif
    " }

    " Syntax plugins {
        if count(g:spf13_bundle_groups, 'syntax')
            Plug 'sheerun/vim-polyglot'         " a set of different syntax for vim
            Plug 'pboettch/vim-cmake-syntax'
            Plug 'plasticboy/vim-markdown'
            Plug 'NLKNguyen/c-syntax.vim'
            Plug 'elzr/vim-json'
            Plug 'neovimhaskell/haskell-vim'
            " Plug 'docker/docker', {'rtp': 'contrib/syntax/vim/', 'frozen': 1}
        endif
    " }

    " Themes {
        if count(g:spf13_bundle_groups, 'themes')
            " Plug 'rafi/awesome-vim-colorschemes'
            Plug 'jacoborus/tender.vim'
            Plug 'blueshirts/darcula'
            Plug 'connorholyday/vim-snazzy'
            Plug 'vim-dist/PaperColor.vim'
            Plug 'morhetz/gruvbox'
            Plug 'mkarmona/colorsbox'
            Plug 'junegunn/seoul256.vim'
            Plug 'kristijanhusak/vim-hybrid-material'
        endif
    " }

    " Misc {
        if count(g:spf13_bundle_groups, 'misc')
            Plug 'junegunn/gv.vim'              " Git commit browser (log viewer)
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
            Plug 'Shougo/vinarise.vim'
        endif
    " }

    " Programming {
        if count(g:spf13_bundle_groups, 'programming')
            " Plug 'ludovicchabant/vim-gutentags' " automatic tags generation
            " Plug 'metakirby5/codi.vim', {'on': 'Codi'} " interactive scratchpad with Python support
            Plug 'majutsushi/tagbar'            " panel to display tags
            Plug 'tpope/vim-commentary'         " comment toggle
            Plug 'devjoe/vim-codequery'         " code navigation on tags
            " Plug 'vhdirk/vim-cmake'             " CMake commands to configure project
            " Plug 'jansenm/vim-cmake', {'as': 'cmake.vim'} " CMake reference and completion
            " Plug 'richq/vim-cmake-completion'   " CMake omni-completion
            " Plug 'vim-scripts/cmake.vim'        " indentation support (12 y.o.)
        endif
    " }

    " Tex {
        if count(g:spf13_bundle_groups, 'writing')
            Plug 'lervag/vimtex'
        endif
    " }

    " Rust {
        if count(g:spf13_bundle_groups, 'rust')
            Plug 'rust-lang/rust.vim', { 'for': 'rust' }
            Plug 'sebastianmarkow/deoplete-rust', { 'for': 'rust' }
            Plug 'timonv/vim-cargo'
            if !count(g:spf13_bundle_groups, 'lsp')
                Plug 'racer-rust/vim-racer'
            endif
        endif
    " }

    " LanguageClient (LSP) {
        if count(g:spf13_bundle_groups, 'lsp')
            Plug 'autozimu/LanguageClient-neovim', { 'branch': 'next', 'do': 'bash install.sh', }
        endif
    " }

" }

" Use local bundles.vim if available {
    if filereadable(g:config_root . '/bundles.local.vim')
        execute "source " . g:config_root . "/bundles.local.vim"
    endif
" }

" Initialize plugin system {
    call plug#end()
" }
