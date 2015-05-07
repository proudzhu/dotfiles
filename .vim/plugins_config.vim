"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"==> powerline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible " Disable vi-compatibility
set laststatus=2 " Always show the statusline
set encoding=utf-8 " Necessary to show Unicode glyphs
set t_Co=256 " Explicitly tell Vim that the terminal supports 256 colors


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"==> YankRing
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"let g:yankring_history_dir = '~/.vim/temp_dirs'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"==> Nerd Tree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader = ","
nnoremap <silent> <F3> :NERDTreeToggle<CR>
map <leader>nn :NERDTreeToggle<cr>
map <leader>nb :NERDTreeFromBookmark
map <leader>nf :NERDTreeFind<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"==> CTRL-P
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"let g:ctrlp_working_path_mode = 0
"let g:ctrlp_map = '<c-f>'
"map <c-b> :CtrlPBuffer<cr>
"let g:ctrlp_max_height = 20
"let g:ctrlp_custom_ignore = 'node_modules\|^\.DS_Store\|^\.git\|^\.coffee'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"==> folding settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"set foldmethod=indent   "fold based on indent
"set foldnestmax=10      "deepest fold is 10 levels
"set nofoldenable        "dont fold by default
"set foldlevel=1         "this is just what i use


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"==> Taglist
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <silent> <F8> :TlistToggle<CR>
let Tlist_Use_Right_Window = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"==> Tagbar
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"nmap <F8> :TagbarToggle<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"==> flake8-vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:PyFlakeOnWrite = 1
let g:PyFlakeCheckers = 'pep8,mccabe,pyflakes'
let g:PyFlakeDefaultComplexity=10
let g:PyFlakeDisabledMessages = 'E501'
let g:PyFlakeCWindow = 6
let g:PyFlakeSigns = 1
let g:PyFlakeMaxLineLength = 100
let g:PyFlakeRangeCommand = 'Q'


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"==> YouCompleteMe
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/cpp/ycm/.ycm_extra_conf.py'
let g:ycm_confirm_extra_conf = 0

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"==> mru.vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"let MRU_File = '/home/proudzhu/.vim/.vim_mru_files'
"let MRU_Max_Entries = 1000
"let MRU_Exclude_Files = '^/tmp/.*\|^/var/tmp/.*'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"==> EasyMotion
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"let g:EasyMotion_leader_key = ','

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"==> ag.vim
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ackprg = 'ag --nogroup --nocolor --column'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"==> airline
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:airline#extensions#tabline#enabled = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"==> vim-easytag
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"let g:easytags_auto_update = 0

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"==> syntastic
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_cpp_compiler = 'clang++'
let g:syntastic_cpp_compiler_options = '-std=c++11'
