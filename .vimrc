set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#begin()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/Vundle.vim'

" My Bundles here:
"
" original repos on github
Plugin 'andviro/flake8-vim'
Plugin 'bling/vim-airline'
Plugin 'bronson/vim-trailing-whitespace'
Plugin 'esukram/vim-taglist' 
Plugin 'helino/vim-nasm'
"Plugin 'jeaye/color_coded'
"Plugin 'kien/ctrlp.vim'
"Plugin 'Lokaltog/vim-easymotion'
"Plugin 'majutsushi/tagbar'
"Plugin 'Raimondi/delimitMate'
Plugin 'rking/ag.vim'
"Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-markdown'
Plugin 'Valloric/YouCompleteMe'
"Plugin 'xolox/vim-easytags'
"Plugin 'xolox/vim-lua-inspect'
"Plugin 'xolox/vim-misc'

" colorscheme
"Plugin 'altercation/vim-colors-solarized'
Plugin 'wesgibbs/vim-irblack'

call vundle#end()           " required
filetype plugin indent on   " required!
"
" Brief help
" :PluginList          - list configured bundles
" :PluginInstall(!)    - install(update) bundles
" :PluginSearch(!) foo - search(or refresh cache first) for foo
" :PluginClean(!)      - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle command are not allowed..

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"==> load plugins_config.vim && myconfig.vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
source $HOME/.vim/plugins_config.vim
source $HOME/.vim/myconfig.vim
