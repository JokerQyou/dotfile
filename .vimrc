" Basic settings
set encoding=utf-8
set nocompatible
filetype off

" Vundle loading
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" Vundle plugin
Plugin 'VundleVim/Vundle.vim'
" Code completion plugin
if has('win32')
    " It's a disaster to use YCM on Windows, opt-out here
else
    Plugin 'Valloric/YouCompleteMe'
endif
" OceanicNext color scheme
Plugin 'mhartington/oceanic-next'
call vundle#end()
" Vundle loaded

syntax on
set t_Co=256
colorscheme OceanicNext
set background=dark

filetype plugin indent on
set backspace=indent,eol,start
set number " Line number
set ruler " Column number and row number
set incsearch " Instant search
set modeline " Modeline (allow comment contents in file set vim config)
set showcmd " Show command in status line

" Syntax differed settings
" Python: 1 tab == 4 spaces, max width == 80, \n as line ending
au BufNewFile,BufRead *.py
\ set tabstop=4           |
\ set softtabstop=4       |
\ set shiftwidth=4        |
\ set textwidth=80        |
\ set expandtab           |
\ set autoindent          |
\ set fileformat=unix
" Javascript: 1 tab == 2spaces, \n as line ending
au BufNewFile,BufRead *.js
\ set tabstop=2           |
\ set softtabstop=2       |
\ set shiftwidth=2        |
\ set expandtab           |
\ set autoindent          |
\ set fileformat=unix

" GUI settings
" TODO Maxmize vim window on all platform
if has('gui_running')
    " Hide widgets
    set guioptions-=m " menu bar
    set guioptions-=T " toolbar
    set guioptions-=r " right hand scroll bar
    set guioptions-=L " left hand scroll bar
    if has('gui_gtk2')
        set guifont=Inconsolata\ 12
    elseif has('gui_macvim')
        set guifont=Monaco:h14
    elseif has('gui_win32')
        set guifont=Source\ Code\ Pro:h14
        " Simulate a Win+UpArrow key press, to maxmize the window
        au GUIEnter * simalt ~x
    endif
endif
