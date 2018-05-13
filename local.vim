" vim: set sw=4 ts=4 sts=4 et tw=78 foldmarker={,} foldlevel=0 foldmethod=marker spell:

let deoplete#enable_at_startup = 1

" Rust {
    if count(keys(g:plugs), 'rust.vim')
        let g:rust_clip_command = 'xclip -selection clipboard'
        let g:rust_conceal = 1
        let g:rust_conceal_mod_path = 0
        let g:rust_conceal_pub = 1
        let g:rust_recommended_style = 1
        let g:rust_fold = 2
    endif

    if count(keys(g:plugs), 'deoplete-rust')
        let g:deoplete#sources#rust#racer_binary = $HOME.'/.cargo/bin/racer'
        let g:deoplete#sources#rust#rust_source_path = $HOME.'/.rustup/toolchains/nightly-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/src'
        let g:deoplete#sources#rust#show_duplicates = 1
        let g:deoplete#sources#rust#documentation_max_height = 20
        let g:deoplete#sources#rust#disable_keymap = 1
    endif

    if count(keys(g:plugs), 'vim-racer')
        let g:racer_cmd = $HOME.'/.cargo/bin/racer'
        let g:racer_experimental_completer = 1

        au FileType rust nmap gd <Plug>(rust-def)
        au FileType rust nmap gs <Plug>(rust-def-split)
        au FileType rust nmap gx <Plug>(rust-def-vertical)
        au FileType rust nmap <leader>gd <Plug>(rust-doc)
    endif
" }

if count(keys(g:plugs), 'fzf-session.vim')
    let g:fzf_session_path = $HOME.'/.local/share/nvim/sessions'
endif

" CMake {
    if count(keys(g:plugs), 'vim-cmake')
        let g:cmake_build_type = 'Debug'
        let g:cmake_project_generator = 'Ninja'
        let g:cmake_build_shared_libs = 'NO'
        let g:cmake_export_compile_commands = 1
        let g:cmake_ycm_symlinks = 1
    endif
" }

if count(keys(g:plugs), 'LanguageClient-neovim')
    let g:LanguageClient_serverCommands = {
        \ 'rust': ['rustup', 'run', 'nightly', 'rls'],
        \ 'cpp': ['cquery', '--log-file=/tmp/cquery.log'],
        \ 'c': ['cquery', '--log-file=/tmp/cquery.log'],
        \ 'javascript': ['javascript-typescript-stdio'],
        \ 'javascript.jsx': ['tcp://127.0.0.1:2089'],
        \ }
    let g:LanguageClient_rootMarkers = {
        \ 'javascript': ['project.json'],
        \ 'rust': ['Cargo.toml'],
        \ }
    let g:LanguageClient_diagnosticsEnable = 0
    let g:LanguageClient_loadSettings = 1
    let g:LanguageClient_settingsPath = $HOME.'/.config/nvim/settings.json'
    " set formatexpr=LanguageClient_textDocument_rangeFormatting()
    command! LSPDefinition call LanguageClient_textDocument_definition()
    command! LSPDocumentation call LanguageClient_textDocument_hover()
    command! LSPSymbols call LanguageClient_textDocument_documentSymbol()
    command! LSPReferences call LanguageClient_textDocument_references()
    command! LSPBase call LanguageClient#cquery_base()
    command! LSPDerived call LanguageClient#cquery_derived()
    command! LSPInstances call LanguageClient#cquery_vars()
    command! LSPHover call LanguageClient#textDocument_signatureHelp()

    nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
    nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
    nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>
endif
