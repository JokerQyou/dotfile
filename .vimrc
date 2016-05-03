" Very Basic Settings {{{
set encoding=utf-8
set nocompatible
filetype off
" }}}
" Leader Shortcuts {{{
let mapleader=","
" }}}
" Vundle Plugin Manager Init {{{
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" Vundle plugin
Plugin 'VundleVim/Vundle.vim'
" }}}
" Supertab Plugin {{{
Plugin 'ervandew/supertab'
" }}}
" Python Code Completion Plugin - jedi-vim {{{
if has('python')
    Plugin 'davidhalter/jedi-vim'
endif
" }}}
" Syntax checker Plugin - Syntastic {{{
let g:syntastic_auto_loc_list = 1
Plugin 'scrooloose/syntastic'
nnoremap <leader>h :SyntasticReset<CR>
"}}}
" Javascript Plugin - vim-javascript {{{
" TODO I should really try to figure out what this plugin does
Plugin 'pangloss/vim-javascript'
" }}}
" Color Scheme Plugin - oceanic-next {{{
Plugin 'mhartington/oceanic-next'
" }}}
" Snippets plugin {{{
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
" Optional:
Plugin 'honza/vim-snippets'
" }}}
" Code searcher plugin {{{
if executable('ag')
    Plugin 'rking/ag.vim'
    nnoremap <leader>f :Ag<space>
endif
if executable('pt')
    let g:unite_source_grep_command = 'pt'
    let g:unite_source_grep_default_opts = '--nogroup --nocolor'
    let g:unite_source_grep_recursive_opt = ''
    let g:unite_source_grep_encoding = 'utf-8'
    Plugin 'Shougo/vimproc.vim'
    Plugin 'Shougo/unite.vim'
    nnoremap <leader>g :<C-u>Unite grep:. -buffer-name=search-buffer<CR>
endif
" }}}
" Vundle Plugin Manager Inited {{{
call vundle#end()
" }}}
" Color {{{
set t_Co=256
colorscheme OceanicNext
set background=dark
" }}}
" Misc {{{
let python_highlight_all=1
set backspace=indent,eol,start
set modelines=1 " Modeline (allow comment contents in file set vim config)
" }}}
" Spaces & Tabs {{{
set tabstop=4 " number of visual spaces per TAB
set softtabstop=4 " number of spaces in tab when editing
set shiftwidth=4
set expandtab " TABs are spaces
set autoindent
set textwidth=80
if exists('+colorcolumn')
    set colorcolumn=+0
endif
set formatoptions-=t
" }}}
" UI Config {{{
syntax enable
set number " Line number
set ruler " Column number and row number
set showcmd " Show command in status line
set cursorline " highlight current line
filetype plugin indent on " load filetype-specific and plugin-specific indent files
set wildmenu " visual autocomplete for command menu
set lazyredraw " redraw only when we need to
set showmatch " highlight matching [({})]
" }}}
" Search {{{
set incsearch " search as we type
set hlsearch " highlight matches
" turn off search highlight by hitting `,space`
nnoremap <leader><space> :nohlsearch<CR>
" }}}
" Folding {{{
" space open/close folds
nnoremap <space> za
" }}}
" Highlight Groups {{{
highlight TrailingWhitespace ctermbg=red guibg=red
highlight ColorColumn ctermbg=25 guibg=#005faf
" }}}
" Filetype Settings {{{
augroup configgroup
    au!
    " Front-end filetypes
    au BufNewFile,BufRead *.js,*.html,*.css,*.scss setlocal tabstop=2
    au BufNewFile,BufRead *.js,*.html,*.css,*.scss setlocal softtabstop=2
    au BufNewFile,BufRead *.js,*.html,*.css,*.scss setlocal shiftwidth=2
    " Python files
    au BufNewFile,BufRead *.py,*.pyw,*.c,*.h,*.js match TrailingWhitespace /\s\+$/
augroup END
"}}}
" GUI Settings {{{
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
" }}}
" vim:foldmethod=marker:foldlevel=0
