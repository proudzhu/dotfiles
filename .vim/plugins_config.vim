"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"==> airline
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
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_map = '<c-f>'
map <c-b> :CtrlPBuffer<cr>
let g:ctrlp_max_height = 20
let g:ctrlp_custom_ignore = 'node_modules\|^\.DS_Store\|^\.git\|^\.coffee'


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
let g:ycm_collect_identifiers_from_tags_files = 1

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
let g:syntastic_cpp_compiler = 'g++'
let g:syntastic_cpp_compiler_options = '-std=c++1z -fconcepts'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"==> cscope.vim
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <leader>fa :call CscopeFindInteractive(expand('<cword>'))<CR>
nnoremap <leader>l :call ToggleLocationList()<CR>
" s: Find this C symbol
nnoremap  <leader>fs :call CscopeFind('s', expand('<cword>'))<CR>
" " g: Find this definition
nnoremap  <leader>fg :call CscopeFind('g', expand('<cword>'))<CR>
" " d: Find functions called by this function
nnoremap  <leader>fd :call CscopeFind('d', expand('<cword>'))<CR>
" " c: Find functions calling this function
nnoremap  <leader>fc :call CscopeFind('c', expand('<cword>'))<CR>
" " t: Find this text string
nnoremap  <leader>ft :call CscopeFind('t', expand('<cword>'))<CR>
" " e: Find this egrep pattern
nnoremap  <leader>fe :call CscopeFind('e', expand('<cword>'))<CR>
" " f: Find this file
nnoremap  <leader>ff :call CscopeFind('f', expand('<cword>'))<CR>
" " i: Find files #including this file
nnoremap  <leader>fi :call CscopeFind('i', expand('<cword>'))<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"==> editorconfig-vim
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:EditorConfig_exec_path = '/usr/bin/editorconfig'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"==> ghcmod-vim
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <silent> tw :GhcModTypeInsert<CR>
map <silent> ts :GhcModSplitFunCase<CR>
map <silent> tq :GhcModType<CR>
map <silent> te :GhcModTypeClear<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"=> neco-ghc
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:haskellmode_completion_ghc = 1
autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"==> committia.vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" You can get the information about the windows with first argument as a dictionary.
"
"   KEY              VALUE                      AVAILABILITY
"-----------------------------------------------------------------------------------
"   vcs            : vcs type (e.g. 'git')   -> all hooks
"   edit_winnr     : winnr of edit window    -> ditto
"   edit_bufnr     : bufnr of edit window    -> ditto
"   diff_winnr     : winnr of diff window    -> ditto
"   diff_bufnr     : bufnr of diff window    -> ditto
"   status_winnr   : winnr of status window  -> all hooks except for 'diff_open' hook
"   status_bufnr   : bufnr of status window  -> ditto

let g:committia_hooks = {}
function! g:committia_hooks.edit_open(info)
    " Additional settings
    setlocal spell

    " If no commit message, start with insert mode
    if a:info.vcs ==# 'git' && getline(1) ==# ''
        startinsert
    end

    " Scroll the diff window from insert mode
    " Map <C-n> and <C-p>
    imap <buffer><C-n> <Plug>(committia-scroll-diff-down-half)
    imap <buffer><C-p> <Plug>(committia-scroll-diff-up-half)

endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"==> deoplete
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:deoplete#enable_at_startup = 1
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : deoplete#mappings#manual_complete()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"==> tabularize
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:haskell_tabular = 1
vmap a= :Tabularize /=<CR>
vmap a; :Tabularize /::<CR>
vmap a- :Tabularize /-><CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"==> clang_complete
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:clang_library_path = '/usr/lib64/libclang.so'
