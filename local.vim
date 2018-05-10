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
"   Configuration options for UI, Plugins and key bindings
" }

" UI config {

let python_highlight_all = 1
let g:onedark_terminal_italics = 1
let g:gruvbox_bold = 1
let g:gruvbox_italicize_strings = 1
let g:gruvbox_invert_signs = 1
let g:seoul256_background = 233
let g:seoul256_light_background = 256

" Completion menu colors 
" highlight Pmenu ctermbg=8 guibg=#606060
" highlight PmenuSel ctermbg=1 guifg=#dddd00 guibg=#1f82cd
" highlight PmenuSbar ctermbg=0 guibg=#d6d6d6

" }

" Plugins {

    " CMake {

        let g:cmake_build_type = 'Debug'
        let g:cmake_project_generator = 'Ninja'
        let g:cmake_build_shared_libs = 'NO'
        let g:cmake_export_compile_commands = 1
        let g:cmake_ycm_symlinks = 1

    " }

    " LanguageClient {
        let g:LanguageClient_serverCommands = {
                \ 'rust': ['rustup', 'run', 'nightly', 'rls'],
                \ 'cpp': ['cquery', '--log-file=/tmp/cquery.log'],
                \ 'c': ['cquery', '--log-file=/tmp/cquery.log'],
                \ 'javascript': ['javascript-typescript-stdio'],
                \ 'javascript.jsx': ['tcp://127.0.0.1:2089'],
                \ }

        let g:LanguageClient_loadSettings = 1
        let g:LanguageClient_settingsPath = $HOME.'/.config/nvim/settings.json'
        set completefunc=LanguageClient#complete
        set formatexpr=LanguageClient_textDocument_rangeFormatting()

        command! LSPDefinition call LanguageClient_textDocument_definition()
        command! LSPDocumentation call LanguageClient_textDocument_hover()
        command! LSPSymbols call LanguageClient_textDocument_documentSymbol()
        command! LSPReferences call LanguageClient_textDocument_references()
        command! LSPBase call LanguageClient#cquery_base()
        command! LSPDerived call LanguageClient#cquery_derived()
        command! LSPInstances call LanguageClient#cquery_vars()
        command! LSPHover call LanguageClient#textDocument_signatureHelp()

        " nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
        " nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
        " nnoremap <silent> gr :call LanguageClient_textDocument_references()<CR>
        " nnoremap <silent> gs :call LanguageClient_textDocument_documentSymbol()<CR>
        " nnoremap <silent> <F2> :call LanguageClient_textDocument_rename()<CR>

    " }

    " Fzf {

        " Open Fzf window in current split like Unite does
        " let g:fzf_layout = { 'window': 'enew' }
        " Fuzzy file finder
        let g:fzf_action = {
            \ 'ctrl-t': 'tab split',
            \ 'ctrl-s': 'split',
            \ 'ctrl-v': 'vsplit',
            \}
        " [Buffers] Jump to the existing window if possible
        let g:fzf_buffers_jump = 1
        " [[B]Commits] Customize the options used by 'git log':
        let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'
        " [Tags] Command to generate tags file
        let g:fzf_tags_command = 'ctags -R'
        " [Commands] --expect expression for directly executing the command
        let g:fzf_commands_expect = 'alt-enter,ctrl-x'

        nnoremap <silent> <Leader>b :Buffers<cr>
        nnoremap <silent> <Leader>o :Files<CR>
        nnoremap <silent> <Leader>p :History<cr>
        " Use fuzzy completion relative filepaths across directory
        imap <expr> <c-x><c-f> fzf#vim#complete#path('git ls-files $(git rev-parse --show-toplevel)')
        " Better command history with q:
        command! CmdHist call fzf#vim#command_history({'down': '9'})
        nnoremap q: :CmdHist<CR>
        " Better search history q/
        command! QHist call fzf#vim#search_history({'down': '10'})
        nnoremap q/ :QHist<CR>
        " Ack replacement
        command! -bang -nargs=* Ack call fzf#vim#ag(<q-args>, {'down': '40%', 'options': --no-color'})
        " Hide status line
        autocmd! FileType fzf
        autocmd  FileType fzf set laststatus=0 noshowmode noruler
            \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler
    " }

    " Tags {

        let g:easytags_cmd = '/usr/bin/ctags'
        let g:fzf_tags_command = '/usr/bin/ctags -R'

        let g:gasynctags_gtags_exe = '/usr/bin/gtags'
        let g:gasynctags_global_exe = '/usr/bin/global'
        let g:gasynctags_gtags_cscope_exe = '/usr/bin/gtags-cscope'
        let g:Gtags_Auto_Map = 0

    " }

" }


" Key mappings {

    inoremap jk <ESC>


	nnoremap <silent> <F4> :FSHere<cr>
	nnoremap <silent> <C-F4> :FSSplitRight<cr>
	nnoremap <silent> <S-F4> :FSSplitBelow<cr>

    " Copy to clipboard
    " nnoremap <C-v> "*p
    vnoremap <C-v> "*p
    vnoremap <C-c> "*y

    nnoremap <silent> <F8> :TagbarToggle<CR>
    nnoremap <silent> <leader>z :Goyo<CR>

    " Move line Up/Down
    nnoremap <A-j> :m .+1<CR>==
    nnoremap <A-k> :m .-2<CR>==
    inoremap <A-j> <Esc>:m .+1<CR>==gi
    inoremap <A-k> <Esc>:m .-2<CR>==gi
    vnoremap <A-j> :m '>+1<CR>gv=gv
    vnoremap <A-k> :m '<-2<CR>gv=gv

" }

