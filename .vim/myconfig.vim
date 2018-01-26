"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"==> colorscheme
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
colorscheme ir_black
"set background=dark
"colorscheme solarized

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"==> common settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Sets how many lines of history VIM has to remember
set history=700

" display line number
set number

" enable syntax
syntax on

" Set to auto read when a file is changed from the outside
set autoread

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","

" Fast saving
nmap <leader>w :w!<cr>

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif
" Remember info about open buffers on close
set viminfo^=%

" Tab width
set tabstop=4
" shift width
set softtabstop=4
set shiftwidth=4

" no swap file
set noswapfile
" 按tab键时产生的是4个空格
"set expandtab
set autoindent

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

" Don't redraw while executing macros (good performance config)
set lazyredraw

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch

" How many tenths of a second to blink when matching brackets
set mat=2

" autoload tag files
set tags=./tags,tags,/

" colorcolumn
set colorcolumn=80

function! NumberToggle()
    if(&relativenumber == 1)
        set norelativenumber
    else
        set relativenumber
    endif
endfunc

nnoremap <leader>nt :call NumberToggle()<cr>

set pastetoggle=<F10>
