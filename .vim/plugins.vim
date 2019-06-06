" Install vim-plug if it's missing
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

"Vimscript help
Plug 'google/vim-maktaba'
Plug 'google/vim-codefmt'
"Fast file finding
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'mileszs/ack.vim', { 'on': 'Ack' }
Plug 'jeetsukumaran/vim-buffergator'
" python and other langs code checker
" Plugin 'vim-syntastic/syntastic'
Plug 'w0rp/ale'
Plug 'vim-scripts/a.vim'
Plug 'vim-scripts/Conque-Shell'
"Plug 'nathanaelkane/vim-indent-guides'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
"Code commenter
Plug 'scrooloose/nerdcommenter'
"python-vim
Plug 'klen/python-mode'
"Git interpretation
Plug 'tpope/vim-fugitive'
" Automatically detect indentation depth, soft-tabs, etc.
Plug 'vim-scripts/yaifa.vim'
" Scala
Plug 'derekwyatt/vim-scala'
"Indent guides
Plug 'Yggdroot/indentLine'
" Autocompletion
Plug 'Shougo/neocomplete'
" Show git status in the gutter
Plug 'airblade/vim-gitgutter'
" Vim statusline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Colorschemes package
Plug 'flazz/vim-colorschemes'

Plug 'leafgarland/typescript-vim'
Plug 'junegunn/limelight.vim'
" Explain why a character is highlighted
Plug 'vim-scripts/SyntaxAttr.vim'

" For JS
Plug 'pangloss/vim-javascript'
" Plug 'moll/vim-node'
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }

" Python
Plug 'python/black'
Plug 'integralist/vim-mypy'

call plug#end()

"Airline
let g:airline_theme='luna'
let g:airline_powerline_fonts = 1
"let g:ariline_extensions_syntastic_enabled = 0
"let g:airline#extensions#tabline#enabled = 1

" Ack.vim
if executable('rg')
  let g:ackprg = 'rg --vimgrep --no-heading'
elseif executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

"Nerdtree
 map <Tab> :NERDTreeToggle<CR>
 " open nerdtree with the current file selected
 nmap <leader>tf :NERDTreeFind<CR>
 " dont show these file types
 let NERDTreeIgnore = ['\.pyc$', '\.pyo$']

 " For ALE (async lint engine) -----------------------------
 let g:ale_python_flake8_options = '--ignore=E501'
 let g:ale_python_pylint_options = '--ignore=E501'
 let g:ale_python_black_options = '--ignore=E501'
 let g:ale_sign_error = '✘'
 let g:ale_sign_warning = '≫'
 let g:airline#extensions#ale#enabled = 1
" let g:ale_python_pylint_options = '--rcfile=/Users/davidrubinstein/.pylintrc'
 let g:ale_lint_delay = 1000
 let g:ale_c_build_dir = './build'
 " let g:ale_c_parse_compile_commands = 1
 let g:ale_cpp_build_dir = './build'
 let g:ale_cpp_parse_compile_commands = 1
 " let g:ale_lint_on_save = 1
 " let g:ale_lint_on_text_changed = 'never'
 " let g:ale_lint_on_enter = 0

" Relative line numbers
"""""""""""""""""""""""
function! NumberToggle()
  if(&relativenumber == 1)
    set number
  else
    set relativenumber
  endif
endfunc

" Ctrl+n toggles between relative and absolute line numbers
nnoremap <C-n> :call NumberToggle()<cr>

" Switch to absolute line number when vim loses focus
:au FocusLost * :set number
:au FocusGained * :set relativenumber

" Switch to absolute line numbers in edit mode
autocmd InsertEnter * :set number
autocmd InsertLeave * :set relativenumber

" Indentline settings
let g:indentLine_color_term = 239
let g:indentLine_enabled = 1
 
" FZF ------------------------------
"
" [Buffers] Jump to the existing window if possible
let g:fzf_buffers_jump = 1

nmap <C-p> :FZF<CR>
nmap <Leader>b :Buffers<CR>
nmap <Leader>a :Ag --python 

nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)

" Insert mode completion
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)

" Python-mode ------------------------------

" don't use linter, we use syntastic for that
let g:pymode_lint = 0
let g:pymode_lint_on_write = 0
let g:pymode_lint_signs = 0
let g:pymode_lint_ignore = "E501"
" don't fold python code on open
let g:pymode_folding = 0
" don't load rope by default. Change to 1 to use rope
let g:pymode_rope = 0
" open definitions on same window, and custom mappings for definitions and
" occurrences
let g:pymode_rope_goto_definition_bind = ',d'
let g:pymode_rope_goto_definition_cmd = 'e'
nmap <leader>D :tab split<CR>:PymodePython rope.goto()<CR>
nmap <leader>o :RopeFindOccurrences<CR>
" don't set breakpoints
let g:pymode_breakpoint = 0
let g:pymode_options_max_line_length = 1000

" SyntaxAttr ------------------------------
map -a :call SyntaxAttr()<CR>

" vim-javascript --------------------------
let g:javascript_plugin_flow = 1

" formatters  ----------------------------
autocmd BufWritePost *.py execute ':Black'
autocmd BufWritePost *.js,*.ts execute ':Prettier'
