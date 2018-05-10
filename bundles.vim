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



" }


" Initialize plugin system {

    call plug#end()

" }
