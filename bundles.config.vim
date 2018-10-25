" vim: set sw=2 ts=2 sts=2 et tw=78 foldmarker={,} foldlevel=0 foldmethod=marker spell:

if has_key(g:plugs, 'neoyank')
  let g:neoyank#file = g:spf13_consolidated_directory . '/neoyank.hist'
  let g:neoyank#save_registers = ['"', '+', '*', 'a', 'b', 'c', 'd']
endif

let g:lastplace_open_folds = 1
let g:lastplace_ignore = "gitcommit,gitrebase,svn,hgcommit"
let g:lastplace_ignore_buftype = "quickfix,nofile,help"

" Deoplete {
if has_key(g:plugs, 'deoplete')
  let g:deoplete#enable_at_startup = 1
endif
" }

" YouCompleteMe {
if has_key(g:plugs, 'youcompleteme') || filereadable(expand("/usr/share/vim/vimfiles/autoload/youcompleteme.vim"))
  " let g:ycm_server_python_interpreter = '/usr/bin/python3'
  let g:ycm_global_ycm_extra_conf = '/usr/share/vim/vimfiles/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
endif
" }

" Airline {
if has_key(g:plugs, 'vim-airline')
  " let g:airline#extensions#tabline#enabled = 1
endif
" }

" XTabline {
  if has_key(g:plugs, 'vim-xtabline')
    let g:xtabline_settings = {}
    let g:xtabline_settings.sessions_path = g:spf13_consolidated_directory . "session"
    let g:xtabline_settings.bookmarks_file = g:spf13_consolidated_directory . "bookmarks.xtabline"
    let g:xtabline_settings.sessions_data = g:spf13_consolidated_directory . "sessions.xtabline"
    " let g:xtabline_settings.extra_icons = 1
    " let g:xtabline_settings.superscript_unicode_nrs = 1
    " let g:xtabline_settings.sort_buffers_by_last_open = 1
    let g:xtabline_settings.bufline_indicators = {
        \ 'modified': '[+]',
        \ 'readonly': '[🔒]',
        \ 'scratch': '[!]',
        \ 'pinned': '[📌]',
        \}
  endif
" }

" comfortable-motion {
if has_key(g:plugs, 'comfortable-motion.vim')
  noremap <silent> <ScrollWheelDown> :call comfortable_motion#flick(40)<CR>
  noremap <silent> <ScrollWheelUp>   :call comfortable_motion#flick(-40)<CR>
endif
" }

" vim-move {
if has_key(g:plugs, 'vim-move')
  let g:move_key_modifier = 'C-S'
endif
" }

" Sneak {
if has_key(g:plugs, 'vim-sneak')
  let g:sneak#label = 1
  map f <Plug>Sneak_f
  map F <Plug>Sneak_F
  map t <Plug>Sneak_t
  map T <Plug>Sneak_T
endif
" }

" Incsearch {
if has_key(g:plugs, 'incsearch.vim')
  let g:incsearch#auto_nohlsearch = 1
  map /  <Plug>(incsearch-forward)
  map ?  <Plug>(incsearch-backward)
  map g/ <Plug>(incsearch-stay)
endif

if has_key(g:plugs, 'incsearch-easymotion.vim')
  call incsearch#call(incsearch#config#easymotion#make())
  map z/ <Plug>(incsearch-easymotion-/)
  map z? <Plug>(incsearch-easymotion-?)
  map zg/ <Plug>(incsearch-easymotion-stay)
endif

if has_key(g:plugs, "incsearch-easymotion.vim") && has_key(g:plugs, "incsearch-fuzzy.vim")
  function! s:config_easyfuzzymotion(...) abort
    return extend(copy({
    \   'converters': [incsearch#config#fuzzy#converter()],
    \   'modules': [incsearch#config#easymotion#module()],
    \   'keymap': {"\<CR>": '<Over>(easymotion)'},
    \   'is_expr': 0,
    \   'is_stay': 1
    \ }), get(a:, 1, {}))
  endfunction

  noremap <silent><expr> <Space>/ incsearch#go(<SID>config_easyfuzzymotion())
endif
" }

" GitGutter {
if has_key(g:plugs, 'vim-gitgutter')
  let g:gitgutter_override_sign_column_highlight = 0
  " let g:gitgutter_sign_added = 'xx'
  " let g:gitgutter_sign_modified = 'yy'
  " let g:gitgutter_sign_removed = 'zz'
  " let g:gitgutter_sign_removed_first_line = '^^'
  " let g:gitgutter_sign_modified_removed = 'ww'
endif

" Twiggly {
if has_key(g:plugs, 'vim-twiggly')
  " let g:twiggy_group_locals_by_slash = 0
  let g:twiggy_local_branch_sort = 'mru'
  let g:twiggy_remote_branch_sort = 'date'
endif

" Chosewin {
if has_key(g:plugs, 'vim-choosewin')
  map - <Plug>(choosewin)
  let g:choosewin_overlay_enable = 1
endif

" Fzf {
if has_key(g:plugs, 'fzf.vim')
    let g:fzf_buffers_jump = 1      " [Buffers] Jump to the existing window if possible
    " [[B]Commits] Customize the options used by 'git log':
    let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'
    " [Tags] Command to generate tags file
    let g:fzf_tags_command = 'ctags -R'
    " [Commands] --expect expression for directly executing the command
    let g:fzf_commands_expect = 'alt-enter,ctrl-x'

    command! -bang Colors
      \ call fzf#vim#colors({'left': '10%', 'options': '--reverse --margin 10%,0'}, <bang>0)

    nnoremap <leader>y :FZFNeoyank<cr>
    nnoremap <leader>Y :FZFNeoyank " P<cr>
    vnoremap <leader>y :FZFNeoyankSelection<cr>

    nnoremap <Leader>: :Commands<CR>
    nnoremap <Leader>b :Buffers<CR>
endif
" }
