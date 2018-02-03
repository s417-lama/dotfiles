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

nnoremap j gj
nnoremap k gk
noremap <S-h> ^
noremap <S-j> }
noremap <S-k> {
noremap <S-l> $
noremap m %

nnoremap d "_d
nnoremap x "_x

imap <C-j> <esc>
noremap! <C-j> <esc>

colorscheme hybrid

au ColorScheme * hi Normal ctermbg=none guibg=none
au ColorScheme * hi LineNr ctermbg=none guibg=none

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

    call dein#end()
    call dein#save_state()
endif

filetype plugin indent on
syntax enable

if dein#check_install()
    call dein#install()
endif

let g:deoplete#enable_at_startup = 1

inoremap <silent><expr> <TAB>
\ pumvisible() ? "\<C-n>" :
\ <SID>check_back_space() ? "\<TAB>" :
\ deoplete#mappings#manual_complete()
function! s:check_back_space() abort "{{{
let col = col('.') - 1
return !col || getline('.')[col - 1]  =~ '\s'
endfunction"}}}
