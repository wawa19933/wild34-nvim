" vim: set sw=2 ts=4 sts=4 et tw=80 foldmarker={,} foldlevel=0 foldmethod=marker spell:
" Plugin manager configuration {
  " Auto install {
    if has('nvim')
      if !filereadable(expand('~/.local/share/nvim/site/autoload/plug.vim'))
        silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
              \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
      endif
    else
      if !filereadable(expand('~/.vim/autoload/plug.vim'))
        silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
              \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
      endif
    endif

    " Automatically install missing plugins on startup
    " autocmd VimEnter *
    "         \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
    "         \|   PlugInstall --sync | q
    "         \| endif
  " }
  let g:plug_timeout = 250
  let g:plug_window = 'vertical topleft 60new'
  filetype off
  syntax off

  call plug#begin('~/.local/share/vim/plugged')

" }

" Plugins {

if !executable('fzf')
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
endif
Plug 'junegunn/fzf.vim'             " fuzzy finder
Plug 'scrooloose/nerdtree'          " file manager
Plug 'vim-airline/vim-airline'      " nice status line
Plug 'tpope/vim-fugitive'           " incredible Git integration
Plug 'tpope/vim-commentary'
Plug 'majutsushi/tagbar'

" Themes {
  Plug 'rakr/vim-one'
  Plug 'rakr/vim-two-firewatch'
  Plug 'JBakamovic/yaflandia'
  Plug 'arcticicestudio/nord-vim'     " default color scheme
" }

Plug 'luochen1990/rainbow'          " colored parentheses
Plug 'bfrg/vim-cpp-modern'          " better C++ syntax highlight
Plug 'ap/vim-css-color'

Plug 'chrisbra/vim-diff-enhanced'   " better diff algorithms
Plug 'whiteinge/diffconflicts'      " comfortable git merge

Plug 'hashivim/vim-vagrant'         " Vagrant syntax, commands support
Plug 'uarun/vim-protobuf'           " Google protobuf syntax support

" }

" Use local bundles.vim if available {
  if filereadable(g:config_root . '/bundles.local.vim')
    execute "source " . g:config_root . "/bundles.local.vim"
  endif
" }

" Initialize plugin system {
  call plug#end()
" }
