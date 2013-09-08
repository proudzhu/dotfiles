""""""""""""""""""""""""""""""""""""
"==>CtrlP 
""""""""""""""""""""""""""""""""""""
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
" Exclude files and directories using Vim's wildignore and CtrlP's own g:ctrlp_custom_ignore:
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux

let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
" Use a custom file listing command:
let g:ctrlp_user_command = 'find %s -type f'

"""""""""""""""""""""""""""""""""""""
"==>NERDTree
"""""""""""""""""""""""""""""""""""""
map <C-n> :NERDTreeToggle<CR>

"""""""""""""""""""""""""""""""""""""
"==>YouCompleteme
"""""""""""""""""""""""""""""""""""""
" use the GCC Syntastic checkers
let g:ycm_register_as_syntastic_checker = 0
let g:ycm_confirm_extra_conf = 0
let g:ycm_global_ycm_extra_conf = '/home/proudzhu/.vim/bundle/YouCompleteMe/cpp/ycm/.ycm_extra_conf.py'

"""""""""""""""""""""""""""""""""""""
"==>vim-powerline
"""""""""""""""""""""""""""""""""""""
set laststatus=2

"""""""""""""""""""""""""""""""""""""
"==>vim-flake8
"""""""""""""""""""""""""""""""""""""
autocmd BufWritePost *.py call Flake8()
