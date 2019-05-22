
"map ; to :
nnoremap ; :
"Line numbers on
set nu
"Syntax highlighting
syntax enable
"colorscheme
colorscheme Monokai

"F-keys
 map <F3> :if exists("syntax_on") <Bar> syntax off <Bar> else <Bar> syntax on <Bar> endif <CR>
 map <F5> :set spell! spell?<CR>
 map <F6> :set list! list?<CR>
 map <F7> :set expandtab! expandtab?<CR>
 map <F9> :ConqueTermSplit matlab -nosplash -nodesktop <CR>
 map <F10> :ConqueTermSplit bash <CR> 
 map <F11> : e! <CR>
 map <F12> : %!xxd <CR>

 " changing how tabs are hilighted
set listchars=eol:$,tab:\|—,trail:⋅,nbsp:⋅

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"smarter deleting
set backspace=indent,eol,start

" Use smart indentation
set nosmartindent

" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=2
set tabstop=2

" File type specific
autocmd FileType cpp match ErrorMsg '\%>120v.\+'
autocmd FileType make setlocal noexpandtab
autocmd FileType makefile setlocal noexpandtab
autocmd FileType Make setlocal noexpandtab
autocmd FileType Makefile setlocal noexpandtab
autocmd Filetype gitcommit setlocal spell textwidth=72
autocmd FileType yaml setlocal tabstop=2 expandtab shiftwidth=2 softtabstop=2

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","

" dont show tab line
set showtabline=0

" Jsonify a file
command J :%!python -m json.tool

" Turn line wrapping on
set wrap
