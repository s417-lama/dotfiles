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
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.cache/dein')
    call dein#begin('~/.cache/dein')

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

let g:hybrid_custom_term_colors = 1
let g:hybrid_reduced_contrast = 1
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

" set color of 'base16_vim' theme for airline
let g:base16_gui00 = "2A363E"
let g:base16_gui01 = "2A363E"
let g:base16_gui02 = "425059"
let g:base16_gui03 = "585858"
let g:base16_gui04 = "b8b8b8"
let g:base16_gui05 = "C5C8C6"
let g:base16_gui06 = "e8e8e8"
let g:base16_gui07 = "f8f8f8"
let g:base16_gui08 = "CC6666"
let g:base16_gui09 = "dc9656"
let g:base16_gui0A = "f7ca88"
let g:base16_gui0B = "81A2BE"
let g:base16_gui0C = "86c1b9"
let g:base16_gui0D = "C48459"
let g:base16_gui0E = "B294BB"
let g:base16_gui0F = "a16946"
let g:base16_cterm00 = "00"  " black
let g:base16_cterm01 = "10"
let g:base16_cterm02 = "11"
let g:base16_cterm03 = "08"  " brblack
let g:base16_cterm04 = "12"
let g:base16_cterm05 = "07"  " white
let g:base16_cterm06 = "13"
let g:base16_cterm07 = "15"
let g:base16_cterm08 = "01"  " red
let g:base16_cterm09 = "09"
let g:base16_cterm0A = "02"  " green
let g:base16_cterm0B = "04"  " blue
let g:base16_cterm0C = "06"  " cyan
let g:base16_cterm0D = "03"  " yellow
let g:base16_cterm0E = "05"  " magenta
let g:base16_cterm0F = "14"

let g:airline_powerline_fonts = 1
let g:airline_theme = 'base16_vim'

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

