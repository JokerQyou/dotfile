" Very Basic Settings {{{
set encoding=utf-8
set nocompatible
filetype off
" }}}
" Leader Shortcuts {{{
let mapleader=","
nnoremap t<Right> :tabn<CR>
nnoremap t<Left> :tabp<CR>
nnoremap te :tabe<CR>
" }}}
" fzf plugin {{{
if isdirectory(expand("~/.fzf"))
    set rtp+=~/.fzf
    nnoremap <leader>p :FZF<CR>
endif
" }}}
" Vim Plug init {{{
call plug#begin('~/.vim/plugged')
" Vundle plugin
Plug 'VundleVim/Vundle.vim'
" }}}
" Supertab Plugin {{{
Plug 'ervandew/supertab'
" }}}
" Python Code Completion Plugin - jedi-vim / completor {{{
if has('python')
    if version >= 800
        Plug 'maralla/completor.vim'
    else
        Plug 'davidhalter/jedi-vim'
    endif
endif
" }}}
" Syntax checker Plugin - Syntastic or ale {{{
if version >= 800 || has('nvim')
    Plug 'w0rp/ale'
    let g:ale_set_highlights = 0
    let g:ale_sign_error = '•'
    let g:ale_sign_warning = '•'
    let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
    let g:ale_statusline_format = ['E•%d', 'W•%d', 'OK']
    " For a more fancy ale statusline
    function! ALEGetError()
        let l:res = ale#statusline#Status()
        if l:res ==# 'OK'
            return ''
        else
            let l:e_w = split(l:res)
            if len(l:e_w) == 2 || match(l:e_w, 'E') > -1
                return ' •' . matchstr(l:e_w[0], '\d\+') .' '
            endif
        endif
    endfunction

    function! ALEGetWarning()
        let l:res = ale#statusline#Status()
        if l:res ==# 'OK'
            return ''
        else
            let l:e_w = split(l:res)
            if len(l:e_w) == 2
                return ' •' . matchstr(l:e_w[1], '\d\+')
            elseif match(l:e_w, 'W') > -1
                return ' •' . matchstr(l:e_w[0], '\d\+')
            endif
        endif
    endfunction

    let g:ale_echo_msg_error_str = 'Error'
    let g:ale_echo_msg_warning_str = 'Warning'

    nmap <C-k> <Plug>(ale_next)
    nmap <C-j> <Plug>(ale_previous)

else
    " let g:syntastic_auto_loc_list = 1
    Plug 'scrooloose/syntastic'
    nnoremap <leader>h :SyntasticReset<CR>
endif
" }}}
" Javascript Plugin - vim-javascript {{{
" TODO I should really try to figure out what this plugin does
" Plug 'pangloss/vim-javascript'
" }}}
" Color Scheme Plugins {{{
Plug 'mhartington/oceanic-next'
Plug 'jacoborus/tender.vim'
" Plug 'itchyny/lightline.vim'
Plug 'vim-airline/vim-airline'
" }}}
" Snippets plugin {{{
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'garbas/vim-snipmate'
" Optional:
Plug 'honza/vim-snippets'
" }}}
" Code searcher plugin {{{
if executable('ag')
    Plug 'rking/ag.vim'
    nnoremap <leader>f :Ag<space>
endif
if executable('pt')
    let g:unite_source_grep_command = 'pt'
    let g:unite_source_grep_default_opts = '--nogroup --nocolor'
    let g:unite_source_grep_recursive_opt = ''
    let g:unite_source_grep_encoding = 'utf-8'
    Plug 'Shougo/vimproc.vim'
    Plug 'Shougo/unite.vim'
    nnoremap <leader>g :<C-u>Unite grep:. -buffer-name=search-buffer<CR>
endif
" }}}
" Python indentation plugin {{{
Plug 'Vimjas/vim-python-pep8-indent'
" }}}
" Misc plugins {{{
Plug 'tpope/vim-fugitive'
" }}}
" History tree plugin {{{
if has("persistent_undo")
    set undodir=~/.vim/.undodir/
    set undofile
endif
Plug 'mbbill/undotree'
nnoremap <leader>u :UndotreeToggle<CR>
" }}}
" Vundle Plugin Manager Inited {{{
call plug#end()
" }}}
" Misc {{{
let python_highlight_all=1
set backspace=indent,eol,start
set modelines=1 " Modeline (allow comment contents in file set vim config)
" }}}
" UI Config {{{
syntax enable
set number " Line number
set ruler " Column number and row number
set showcmd " Show command in status line
set noshowmode
set cursorline " highlight current line
filetype plugin indent on " load filetype-specific and plugin-specific indent files
set wildmenu " visual autocomplete for command menu
set lazyredraw " redraw only when we need to
set showmatch " highlight matching [({})]
" }}}
" Color {{{
set t_Co=256
set background=dark
if (has("termguicolors"))
  set termguicolors
endif
set laststatus=2
colorscheme OceanicNext
" colorscheme tender
" }}}
" Statusline plugin {{{
let g:airline_powerline_fonts = 1
let g:airline_theme = 'tender'
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#buffer_nr_format = '%s:'
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#fnamecollapse = 1
let g:airline#extensions#tabline#fnametruncate = 0
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
let g:airline#extensions#default#section_truncate_width = {
            \ 'b': 79,
            \ 'x': 60,
            \ 'y': 88,
            \ 'z': 45,
            \ 'warning': 80,
            \ 'error': 80,
            \ }
let g:airline#extensions#default#layout = [
            \ [ 'a', 'error', 'warning', 'b', 'c' ],
            \ [ 'x', 'y', 'z' ]
            \ ]

" Distinct background color is enough to discriminate the warning and
" error information.
let g:airline#extensions#ale#error_symbol = '•'
let g:airline#extensions#ale#warning_symbol = '•'
" }}}
" Spaces & Tabs {{{
set tabstop=4 " number of visual spaces per TAB
set softtabstop=4 " number of spaces in tab when editing
set shiftwidth=4
set expandtab " TABs are spaces
" set autoindent
set textwidth=80
if exists('+colorcolumn')
    set colorcolumn=+0
endif
set wrap
set linebreak
set nolist
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
highlight CursorLine ctermbg=235
highlight ALEErrorSign ctermfg=red guifg=red ctermbg=237 guibg=#343d46 cterm=bold
" }}}
" Filetype Settings {{{
augroup configgroup
    au!
    " All files
    au BufNewFile,BufRead * setlocal formatoptions-=t
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
        set guifont=UbuntuMonoDerivativePowerline\ N:h16
    elseif has('gui_win32')
        set guifont=UbuntuMonoDerivativePowerline\ N:h16
        " Simulate a Win+UpArrow key press, to maxmize the window
        au GUIEnter * simalt ~x
    endif
endif
" }}}
" vim:foldmethod=marker:foldlevel=0
