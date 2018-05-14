" vim: set sw=4 ts=4 sts=4 et tw=78 foldmarker={,} foldlevel=0 foldmethod=marker spell:

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

" Deoplete {
    function! CleverCr()
        if pumvisible()
            if neosnippet#expandable()
                let exp = "\<Plug>(neosnippet_expand)"
                return exp . deoplete#close_popup()
            else
                return deoplete#close_popup()
            endif
        else
            return "\<CR>"
        endif
    endfunction

    let g:deoplete#enable_at_startup = 1
    call deoplete#custom#option({
           \ 'auto_complete_delay': 100,
           \ 'smart_case': v:true,
           \ 'camel_case': v:true,
           \ 'keyword_patterns': {
           \     '_': '[a-zA-Z_]\k*',
           \     'tex': '\\?[a-zA-Z_]\w*',
           \     'ruby': '[a-zA-Z_]\w*[!?]?',
           \ },
           \ 'skip_chars': [')', '}'],
           \ 'max_list': 50,
           \ })
        " \ 'sources': {
        " \     '_': ['buffer'],
        " \     'cpp': ['buffer', 'tag'],
        " \ },
        " \ 'complete_method': 'completefunc',

    " Enable heavy omni completion.
    " call deoplete#custom#option('omni_patterns', {
    "     \ 'java': '[^. *\t]\.\w*',
    "     \ 'php': ['\w+|[^. \t]->\w*|\w+::\w*', '[^. \t]->\h\w*\|\h\w*::'],
    "     \ 'perl' : '\h\w*->\h\w*\|\h\w*::',
    "     \ 'c': '[^.[:digit:] *\t]\%(\.\|->\)',
    "     \ 'cpp': '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::',
    "     \ 'ruby': ['[^. *\t]\.\w*', '[^. *\t]\.\h\w*\|\h\w*::', '[a-zA-Z_]\w*::'],
    "     \ 'go': '\h\w*\.\?',
    "     \ })

    call deoplete#custom#source('_', 'matchers', ['matcher_full_fuzzy'])
    call deoplete#custom#source('_', 'sorters', [])
    call deoplete#custom#source('_', 'converters', ['converter_auto_paren', 'converter_auto_delimiter', 'converter_remove_overlap', 'converter_truncate_abbr', 'converter_truncate_menu'])
    " Do not complete too short words
    call deoplete#custom#source('dictionary', 'min_pattern_length', 4)
    call deoplete#custom#source('around', 'matchers', ['matcher_full_fuzzy', 'matcher_length'])
    call deoplete#custom#source('LanguageClient', 'min_pattern_length', 2)

    imap <C-k>     <Plug>(neosnippet_expand_or_jump)
    smap <C-k>     <Plug>(neosnippet_expand_or_jump)
    xmap <C-k>     <Plug>(neosnippet_expand_target)

    imap <silent><expr> <C-k> neosnippet#expandable() ?
                \ "\<Plug>(neosnippet_expand_or_jump)" : (pumvisible() ?
                \ "\<C-e>" : "\<Plug>(neosnippet_expand_or_jump)")
    smap <TAB> <Right><Plug>(neosnippet_jump_or_expand)

    inoremap <expr> <C-g> deoplete#close_popup()
    inoremap <expr> <C-l> deoplete#complete_common_string()
" }

" ALE {
if count(keys(g:plugs), 'ale')
    let g:ale_sign_error = '☣️'
    let g:ale_sign_warning = '🔯'
    let g:airline#extensions#ale#enabled = 1
    let g:ale_set_loclist = 1
    let g:ale_set_quickfix = 0
    " Powersave {
    " let g:ale_lint_delay = 100
    " let g:ale_lint_on_text_changed = 'never'
    " let g:ale_lint_on_enter = 0
    " }
endif
" }

" Snippets {
    " Use honza's snippets.
    let g:neosnippet#snippets_directory = get(get(g:plugs, 'vim-snippets'), 'dir') . '/snippets'
    " let g:neosnippet#snippets_directory='~/.local/share/nvim/plugged/vim-snippets/snippets'

    " Enable neosnippet snipmate compatibility mode
    let g:neosnippet#enable_snipmate_compatibility = 1

    " For snippet_complete marker.
    if !exists("g:spf13_no_conceal")
        if has('conceal')
            set conceallevel=2 concealcursor=i
        endif
    endif

    " Enable neosnippets when using go
    let g:go_snippet_engine = "neosnippet"

    " Disable the neosnippet preview candidate window
    " When enabled, there can be too much visual noise
    " especially when splits are used.
    set completeopt-=preview
" }
