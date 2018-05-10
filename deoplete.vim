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
"   This file contains plugins for Deoplete completion (mainly sources for
"   auto completion).
" }

" Deoplete sources {

    " neco-vim: "vim" source for Vim script
    Plug 'Shougo/neco-vim', { 'for': 'vim' }

    " neosnippet: "neosnippet" source
    Plug 'Shougo/neosnippet.vim' | Plug 'Shougo/neosnippet-snippets'

    " neco-syntax: "syntax" source
    Plug 'Shougo/neco-syntax'

    " vimshell: "vimshell" source for vimshell
    Plug 'Shougo/vimshell.vim'

    " neco-ghc: "ghc" source for Haskell
    Plug 'eagletmt/neco-ghc', { 'for': 'haskell' }

    " neco-look: "look" source to suggest words from sorted dictionary
    Plug 'ujihisa/neco-look'

    " vim-racer: "racer" source for Rust
    Plug 'racer-rust/vim-racer', { 'for': 'rust' }

    " rust source "rust"
    Plug 'sebastianmarkow/deoplete-rust', { 'for': 'rust' }

    " UltiSnips source: "ultisnips" source for UltiSnips
    Plug 'SirVer/ultisnips'

    " clang-complete: "clang_complete" source for C/C++/Objective-C
    Plug 'Rip-Rip/clang_complete', { 'for': ['c', 'cpp', 'objc', 'objcpp'] }

    " deoplete-go: "go" source for Go
    Plug 'zchee/deoplete-go', { 'for': 'go' }

    " elixir.nvim: "elixir" source for Elixir
    Plug 'awetzel/elixir.nvim', { 'for': 'elixir' }
    Plug 'slashmili/alchemist.vim', { 'for': 'elixir' }

    " deoplete-jedi: "jedi" source for Python
    Plug 'zchee/deoplete-jedi', { 'for': 'python' }

    " perlomni.vim: "PerlOmni" source for Perl
    Plug 'c9s/perlomni.vim', { 'for': 'perl' }

    " nvim-typescript: "typescript" source for typescript
    Plug 'mhartington/nvim-typescript', { 'for': 'typescript' }

    " deoplete-clang: "clang" source for C/C++/ObjC
    Plug 'zchee/deoplete-clang', { 'for': ['c', 'cpp', 'objc', 'objcpp'] }

    " deoplete-clang2: "clang2" source for C/C++/ObjC
    " It is faster than deoplete-clang
    Plug 'tweekmonster/deoplete-clang2', { 'for': ['c', 'cpp', 'objc', 'objcpp'] }

    " async-clj-omni: "async_clj" source for Clojure
    Plug 'SevereOverfl0w/async-clj-omni', { 'for': 'closure' }

    " deoplete-ternjs: "ternjs" source for JavaScript
    Plug 'carlitux/deoplete-ternjs', { 'for': 'javascript' }

    " deoplete-swift: "swift" source for Swift
    Plug 'landaire/deoplete-swift', { 'for': 'swift' }

    " neovim-intellij-complete-deoplete: "intellij" source for Intellij IDE
    Plug 'vhakulinen/neovim-intellij-complete-deoplete'

    " tmux-complete: "tmuxcomplete" source for tmux panes
    Plug 'wellle/tmux-complete.vim'

    " deoplete-github: "github" source for "gitcommit" filetype
    Plug 'SevereOverfl0w/deoplete-github', { 'for': 'gitcommit' }

    " deoplete-flow: "flow" source for JavaScript
    Plug 'steelsojka/deoplete-flow', { 'for': 'javascript' }

    " deoplete-d: "d" source for D language
    Plug 'landaire/deoplete-d', { 'for': 'd' }

    " deoplete-rtags: "rtags" source for "c", "cpp", "objc" and "objcpp" filetypes
    Plug 'LuXuryPro/deoplete-rtags', { 'for': ['c', 'cpp', 'objc', 'objcpp'] }

    " deoplete-solargraph "solargraph" source for Ruby language
    Plug 'uplus/deoplete-solargraph', { 'for': 'ruby' }

    " deoplete-padawan: "padawan" source for padawan.php
    Plug 'pbogut/deoplete-padawan', { 'for': 'php' }

    " webcomplete.vim: "webcomplete" source for browser opened pages
    Plug 'thalesmello/webcomplete.vim'

    " deoplete-julia: "julia" source for Julia
    Plug 'JuliaEditorSupport/deoplete-julia', { 'for': 'julia' }

    " acid.nvim: "acid" source for Clojure
    Plug 'hkupty/acid.nvim', { 'for': 'closure' }

    " deoplete-omnisharp: "cs" source for C#
    "Plug 'Robzz/deoplete-omnisharp/'

    " deoplete-omnisharp: Improved version of deoplete-omnisharp
    Plug 'dimixar/deoplete-omnisharp/', { 'for': 'cs' }

    " deoplete-omnisharp: Embeded omnisharp server version of deoplete-omnisharp
    "Plug 'cyansprite/deoplete-omnisharp'

    " deoplete-hack: "hack" source for Hack and PHP
    Plug 'zefei/deoplete-hack', { 'for': ['php', 'hack'] }

    " deoplete-laravel-plugin: "laravel-plugin" source for "php" and "blade" filetypes
    Plug 'rafaelndev/deoplete-laravel-plugin', { 'for': ['php', 'blade'] }

    " deoplete-zsh: "zsh" source for Zsh
    Plug 'zchee/deoplete-zsh', { 'for': 'zsh' }

    " deoplete-fish: "fish" source for fish shell
    Plug 'ponko2/deoplete-fish', { 'for': 'fish' }

    " deoplete-fsharp: "fsharp" source for F#
    "Plug 'callmekohei/deoplete-fsharp'

    " autocomplete-flow: "flow" source for JavaScript
    Plug 'wokalski/autocomplete-flow', { 'for': 'javascript' }

    " deoplete-asm: "asm" source for Assembly Language
    Plug 'zchee/deoplete-asm', { 'for': ['asm', 'c', 'cpp', 'rust', 'go'] }

    " deoplete-abook: "abook" source for abook contacts
    Plug 'fszymanski/deoplete-abook', { 'for': 'abook' }

    " deoplete-emoji: "emoji" source for emoji codes
    Plug 'fszymanski/deoplete-emoji'

    " LanguageClient-neovim: use Language Server Protocol(LSP) for sources
    Plug 'autozimu/LanguageClient-neovim', {'branch': 'next', 'do': 'bash install.sh'}

" }


" OmniCompletion sources {

    " phpcd.vim: another PHP omnifunc. Faster.
    Plug 'php-vim/phpcd.vim', { 'for': 'php' }

" }


" Useful plugins {

    " For 'matcher_cpsm'
    Plug 'nixprime/cpsm', { 'do': 'env PY3=ON ./install.sh' }

    " To display doc in deoplete instead of preview
    Plug 'Shougo/echodoc.vim'

    " context_filetype.vim:
    " It adds the context filetype feature.
    Plug 'Shougo/context_filetype.vim'

    " neopairs.vim:
    " It inserts the parentheses pairs automatically.
    Plug 'Shougo/neopairs.vim'

    " echodoc.vim:
    " It prints the documentation you have completed.
    Plug 'Shougo/echodoc.vim'

    " neoinclude.vim:
    " You can completes the candidates from the included files and included path.
    " neoinclude: "include" and "file/include" sources
    Plug 'Shougo/neoinclude.vim'

    " FastFold:
    " Speed up the updating folds when you use auto completion plugins.
    Plug 'Konfekt/FastFold'

" 

