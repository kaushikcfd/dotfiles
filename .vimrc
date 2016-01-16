set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'Valloric/YouCompleteMe'
Plugin 'edsono/vim-matchit'
Plugin 'Raimondi/delimitMate'
Plugin 'flazz/vim-colorschemes'
call vundle#end() 
filetype plugin indent on


set cindent
set tabstop=4
set shiftwidth=4
set expandtab
set textwidth=120
syntax on
set background=dark
set number
set showmatch
set comments=sl:/*,mb:\ *,elx:\ */
let delimitMate_expand_cr = 1
let g:ycm_global_ycm_extra_conf = "~/.vim/.ycm_extra_conf.py"
