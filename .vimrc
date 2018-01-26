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
Plugin 'bronson/vim-trailing-whitespace'
Plugin 'brookhong/cscope.vim'
"Plugin 'dkasak/manpageview'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'esukram/vim-taglist'
Plugin 'helino/vim-nasm'
Plugin 'rking/ag.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-markdown'
Plugin 'Valloric/YouCompleteMe'
Plugin 'fidian/hexmode'
Plugin 'ctrlpvim/ctrlp.vim'

" language support
Plugin 'rust-lang/rust.vim'
Plugin 'vim-perl/vim-perl'
" Plugin 'neovimhaskell/haskell-vim'
Plugin 'Shougo/vimproc.vim'
Plugin 'eagletmt/ghcmod-vim'
Plugin 'eagletmt/neco-ghc'
Plugin 'jvirtanen/vim-octave'

" colorscheme
Plugin 'wesgibbs/vim-irblack'

" status line
Plugin 'bling/vim-airline'

" commit message
Plugin 'rhysd/committia.vim'

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
