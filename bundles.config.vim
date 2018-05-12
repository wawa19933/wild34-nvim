" vim: set sw=4 ts=4 sts=4 et tw=78 foldmarker={,} foldlevel=0 foldmethod=marker spell:

let g:neoyank#file = $HOME.'/.cache/vim/neoyank.hist'
let g:neoyank#save_registers = ['"', '+', '*', 'a', 'b', 'c', 'd']

let g:lastplace_open_folds = 1
let g:lastplace_ignore = "gitcommit,gitrebase,svn,hgcommit"
let g:lastplace_ignore_buftype = "quickfix,nofile,help"


" Airline {
    let g:airline#extensions#tabline#enabled = 1

" }

" Fzf {
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

" }
