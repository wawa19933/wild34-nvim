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
"   Initial definitions.
"
" }

" Basics {
    if (has("termguicolors"))
        set termguicolors
    endif


    set nocompatible        " Must be first line
    set background=dark     " Assume a dark background
" }

" Windows Compatible {
    " On Windows, also use '.vim' instead of 'vimfiles'; this makes synchronization
    " across (heterogeneous) systems easier.
    if has('win32') || has('win64')
        set runtimepath=$HOME/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,$HOME/.vim/after

        " Be nice and check for multi_byte even if the config requires
        " multi_byte support most of the time
        if has("multi_byte")
            " Windows cmd.exe still uses cp850. If Windows ever moved to
            " Powershell as the primary terminal, this would be utf-8
            set termencoding=cp850
            " Let Vim use utf-8 internally, because many scripts require this
            set encoding=utf-8
            setglobal fileencoding=utf-8
            " Windows has traditionally used cp1252, so it's probably wise to
            " fallback into cp1252 instead of eg. iso-8859-15.
            " Newer Windows files might contain utf-8 or utf-16 LE so we might
            " want to try them first.
            set fileencodings=ucs-bom,utf-8,utf-16le,cp1252,iso-8859-15
        endif
    endif
" }


if !exists('g:spf13_bundle_groups')
    let g:spf13_bundle_groups=['general', 'writing', 'deoplete', 'programming', 'php', 'ruby', 'python', 'javascript', 'html', 'misc', 'fzf', 'rust', 'go']
endif

