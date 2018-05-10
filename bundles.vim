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

" Setup Plug Support {
filetype off
call plug#begin('~/.local/share/nvim/plugged')
" }

" Use fork bundles config if available {
if filereadable(expand("~/.config/nvim/bundles.fork.vim"))
    source ~/.config/nvim/bundles.fork.vim
endif
" }

" Use local bundles config if available {
if filereadable(expand("~/.config/nvim/bundles.local.vim"))
    source ~/.config/nvim/bundles.local.vim
endif
" }

call plug#end()
