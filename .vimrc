set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

" My Bundles here:
Bundle "kien/ctrlp.vim"
Bundle "scrooloose/nerdtree"
Bundle "scrooloose/syntastic"
Bundle "nvie/vim-flake8"
Bundle "wesgibbs/vim-irblack"
Bundle "Lokaltog/vim-powerline"
Bundle "Valloric/YouCompleteMe"
Bundle "honza/vim-snippets"
Bundle "sjl/gundo.vim"
Bundle "mtth/taglist.vim"
Bundle "tpope/vim-markdown"
Bundle "vim-perl/vim-perl"
Bundle "terryma/vim-multiple-cursors"

filetype plugin indent on     " required!
"
" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle command are not allowed..
"
source $HOME/.vim/plugin_config.vim
source $HOME/.vim/my_config.vim

