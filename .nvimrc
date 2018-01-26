call plug#begin('~/.vim/bundle')

" My Bundles here:
"
" original repos on github
"Plug 'andviro/flake8-vim'
Plug 'bronson/vim-trailing-whitespace'
Plug 'brookhong/cscope.vim'
"Plug 'dkasak/manpageview'
Plug 'editorconfig/editorconfig-vim'
Plug 'esukram/vim-taglist'
"Plug 'helino/vim-nasm'
Plug 'rking/ag.vim'
Plug 'scrooloose/nerdtree'
"Plug 'scrooloose/syntastic'
Plug 'tpope/vim-markdown'
"Plug 'Valloric/YouCompleteMe'
Plug 'Rip-Rip/clang_complete'
Plug 'fidian/hexmode'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-jedi'
Plug 'godlygeek/tabular'

" language support
Plug 'rust-lang/rust.vim'
Plug 'vim-perl/vim-perl'
Plug 'neovimhaskell/haskell-vim'
Plug 'Shougo/vimproc.vim'
Plug 'eagletmt/ghcmod-vim'
Plug 'eagletmt/neco-ghc'
Plug 'jvirtanen/vim-octave'
Plug 'vim-scripts/google.vim'
Plug 'HerringtonDarkholme/yats.vim'
"Plug 'kovisoft/slimv'
Plug 'Chiel92/vim-autoformat'

" colorscheme
Plug 'wesgibbs/vim-irblack'

" status line
Plug 'bling/vim-airline'

" commit message
Plug 'rhysd/committia.vim'

call plug#end()

"
" Brief help
" :PlugList          - list configured bundles
" :PlugInstall(!)    - install(update) bundles
" :PlugSearch(!) foo - search(or refresh cache first) for foo
" :PlugClean(!)      - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle command are not allowed..

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"==> load plugins_config.vim && myconfig.vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
source $HOME/.vim/plugins_config.vim
source $HOME/.vim/myconfig.vim
