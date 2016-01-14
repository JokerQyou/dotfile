set encoding=utf-8
set nocompatible
filetype off

" Vundle loading
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" Vundle plugin
Plugin 'VundleVim/Vundle.vim'
Plugin 'Valloric/YouCompleteMe'
call vundle#end()
" Vundle loaded

filetype plugin indent on
set backspace=indent,eol,start
set number
