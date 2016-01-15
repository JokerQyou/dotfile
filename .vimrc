" Basic settings
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
set number " Line number
set ruler " Column number and row number
set incsearch " Instant search
set modeline " Modeline (allow comment contents in file set vim config)
set showcmd " Show command in status line

" GUI settings
" TODO Improve GUI settings by doing platform detection
if has('gui_running')
    set guifont=Monaco:h14
endif
