call plug#begin('~/.config/nvim/.local/share/nvim/plugged')
Plug 'nightsense/vim-crunchbang'
Plug 'flazz/vim-colorschemes'
Plug 'w0rp/ale'
Plug 'godlygeek/tabular'
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'junegunn/goyo.vim'
Plug 'roxma/vim-tmux-clipboard'
Plug 'iCyMind/NeoSolarized'
Plug 'jez/vim-ispc'
call plug#end()

colorscheme onedark
set termguicolors
let $NVIM_TUI_ENABLE_TRUE_COLOR=1

set cindent
set tabstop=4
set shiftwidth=4
set expandtab
syntax on
set number
set showmatch
set comments=sl:/*,mb:\ *,elx:\ */
let delimitMate_expand_cr = 1
set tw=79

let g:ale_linters = {'python': ['flake8', 'pep8'], 'cpp': ['clang', 'gcc']}
let g:ale_type_map = {'flake8': {'ES': 'E', 'WS': 'W'}}
let g:ale_python_flake8_args = '--ignore=E126,E127,E128,E123,E226,E241,E242,E265,N802,W503,E402,N814 --max-line-length=85'
let ale_cpp_gcc_executable = 'mpicxx'
let g:ale_cpp_clang_options = '-std=c++11 -Wall -I$PETSC_DIR/include -I$PETSC_DIR/$PETSC_ARCH/include -I/usr/include -I/usr/include/x86_64-linux-gnu/mpi'
let g:ale_cpp_clangcheck_options = ''

autocmd FileType markdown,python setlocal spell
