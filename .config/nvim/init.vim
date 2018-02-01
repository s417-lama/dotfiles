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
set whichwrap=b,s,h,l,[,],<,>
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

inoremap <expr> <C-o> pumvisible() ? "\<C-n>" : "\<C-x><C-o>"
inoremap <expr> <C-f> pumvisible() ? "\<C-n>" : "\<C-x><C-n>"
inoremap <expr> <C-k> pumvisible() ? "\<C-p>" : "\<C-k>"

nnoremap s <Nop>
nnoremap sb :<C-u>Unite buffer<CR>
nnoremap su :<C-u>Unite file_mru buffer<CR>

colorscheme iceberg

au ColorScheme * hi Normal ctermbg=none guibg=none
au ColorScheme * hi LineNr ctermbg=none guibg=none
