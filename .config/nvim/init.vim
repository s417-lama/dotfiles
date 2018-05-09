set number
set title
set ambiwidth=double
set tabstop=4
set expandtab
set shiftwidth=4
set smartindent
set virtualedit=onemore,block
set cursorline
set showmatch
set whichwrap=b,s,[,],<,>
set hlsearch
set incsearch
set clipboard^=unnamedplus
set background=dark
set laststatus=2
set ttimeoutlen=10
set termguicolors
set encoding=utf-8
set fileencoding=utf-8
set ignorecase
set smartcase
set completeopt-=preview

nnoremap j gj
nnoremap k gk
noremap <S-h> ^
noremap <S-j> }
noremap <S-k> {
noremap <S-l> $
noremap m %
vmap f gc

nnoremap d "_d
nnoremap x "_x

imap <C-j> <esc>
noremap! <C-j> <esc>

if &compatible
    set nocompatible
endif
set runtimepath+=~/.local/share/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.local/share/dein')
    call dein#begin('~/.local/share/dein')

    call dein#add('~/.local/share/dein/repos/github.com/Shougo/dein.vim')
    call dein#add('Shougo/deoplete.nvim')
    call dein#add('Shougo/neco-syntax')
    call dein#add('slashmili/alchemist.vim')
    call dein#add('zchee/deoplete-clang')
    call dein#add('zchee/deoplete-jedi')
    call dein#add('elixir-editors/vim-elixir')
    call dein#add('tpope/vim-commentary')
    call dein#add('vim-airline/vim-airline')
    call dein#add('vim-airline/vim-airline-themes')
    call dein#add('edkolev/tmuxline.vim')
    call dein#add('bronson/vim-trailing-whitespace')
    call dein#add('w0ng/vim-hybrid')
    call dein#add('reedes/vim-colors-pencil')

    call dein#end()
    call dein#save_state()
endif

filetype plugin indent on
syntax enable

au ColorScheme * hi Normal ctermbg=none guibg=none
au ColorScheme * hi LineNr ctermbg=none guibg=none

colorscheme hybrid

if dein#check_install()
    call dein#install()
endif

let g:deoplete#enable_at_startup = 1
let g:deoplete#auto_complete_delay = 0
let g:deoplete#auto_refresh_delay = 0

let g:deoplete#sources#clang#libclang_path = '/usr/lib/llvm-5.0/lib/libclang.so'
let g:deoplete#sources#clang#clang_header = '/usr/include/clang'

inoremap <silent><expr> <TAB>
\ pumvisible() ? "\<C-n>" :
\ <SID>check_back_space() ? "\<TAB>" :
\ deoplete#mappings#manual_complete()
function! s:check_back_space() abort "{{{
let col = col('.') - 1
return !col || getline('.')[col - 1]  =~ '\s'
endfunction"}}}

let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme = 'behelit'

let g:airline_symbols = {}
let g:airline_left_sep = '⮀'
let g:airline_left_alt_sep = '⮁'
let g:airline_right_sep = '⮂'
let g:airline_right_alt_sep = '⮃'
let g:airline_symbols.branch = '⭠'
let g:airline_symbols.readonly = '⭤'
let g:airline_symbols.linenr = '⭡'

let g:tmuxline_theme = 'behelit'
let g:airline#extensions#tmuxline#enabled = 0
let g:tmuxline_separators = {
    \ 'left' : '⮀',
    \ 'left_alt': '⮁',
    \ 'right' : '⮂',
    \ 'right_alt' : '⮃'}
