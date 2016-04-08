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
    if v:version >= 703
        " Or shall we detect path 7.3.874 instead? (see https://git.io/vz4Li )
	" See https://git.io/vz4LP about this patch number
        if has("patch-7.3.598")
	    "let g:ycm_path_to_python_interpreter='python2'
            "Plugin 'Valloric/YouCompleteMe'
        endif
    endif
endif
if has('python')
    Plugin 'davidhalter/jedi-vim'
endif
Plugin 'nvie/vim-flake8'
au BufWritePost *.py call Flake8()
let g:flake8_show_in_gutter=1
let g:flake8_show_in_file=1
let g:flake8_warning_marker=1
let g:flake8_complexity_marker=1
let g:flake8_naming_marker=1
let python_highlight_all=1

" Javascript plugin
Plugin 'pangloss/vim-javascript'
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
set expandtab
set autoindent

" TODO: Is this necessary since we have plugin for Python now?
" General: 1 tab == 4 spaces, max width == 80, \n as line ending
au BufNewFile,BufRead *.* call SetupAllFileTypes()
au BufNewFile,BufRead *.js, *.html, *.css, *.scss call SetupFEFileTypes()

function! SetupAllFileTypes()
    " Setup general tab => spaces conversion and tabstop
    set tabstop=4
    set softtabstop=4
    set shiftwidth=4
    set textwidth=80
    set fileformat=unix
endfunction

function! SetupFEFileTypes()
    " Frontend: they always prefer 1tab == 2 spaces conversion, dunno why
    " Maybe because years of struggling in callback hell?
    set tabstop=2
    set softtabstop=2
    set shiftwidth=2
endfunction

" Highlight trailing whitespaces
highlight TrailingWhitespace ctermbg=red guibg=red
au BufNewFile,BufRead *.py,*.pyw,*.c,*.h,*.js match TrailingWhitespace /\s\+$/

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
