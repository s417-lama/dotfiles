set number
set title
" set ambiwidth=double
set tabstop=2
set expandtab
set shiftwidth=2
set smartindent
set virtualedit=onemore,block
set cursorline
set showmatch
set whichwrap=b,s,[,],<,>
set hlsearch
set incsearch
set clipboard+=unnamed,unnamedplus
set laststatus=2
set ttimeoutlen=10
" set termguicolors
set encoding=utf-8
set fileencoding=utf-8
set ignorecase
set smartcase
set completeopt-=preview
set wildmenu
set wildmode=list:longest,list:full

noremap j gj
noremap k gk
noremap <S-h> ^
noremap <S-j> }
noremap <S-k> {
noremap <S-l> $
noremap m %

nnoremap d "_d
vnoremap d "_d
nnoremap D "_D
vnoremap D "_D
nnoremap c "_c
vnoremap c "_c
nnoremap C "_C
vnoremap C "_C
nnoremap s "_s
vnoremap s "_s
nnoremap S "_S
vnoremap S "_S
nnoremap x "_x
vnoremap p "_dP

noremap! <C-j> <esc>

nnoremap <C-]> g<C-]>

let mapleader = "\<space>"

" gdb
packadd termdebug
tnoremap <C-j> <C-\><C-n>

" dein
let s:dein_base_path = '~/.cache/dein'
let s:dein_path = '~/.cache/dein/repos/github.com/Shougo/dein.vim'
let s:toml_dir = '~/.config/nvim'

if &compatible
  set nocompatible
endif
let &runtimepath = s:dein_path .",". &runtimepath

if dein#load_state(s:dein_base_path)
  call dein#begin(s:dein_base_path)
  call dein#add(s:dein_path)
  call dein#load_toml(s:toml_dir . '/dein.toml'     , {'lazy': 0})
  call dein#load_toml(s:toml_dir . '/dein_lazy.toml', {'lazy': 1})
  call dein#end()
  call dein#save_state()
endif

if dein#check_install()
  call dein#install()
endif

filetype plugin indent on
syntax enable

" colorscheme
set background=dark
colorscheme hybrid
hi CursorLineNr ctermbg=8 ctermfg=5 " bg=DarkGrey fg=Magenta
hi clear SignColumn

" spell
autocmd FileType plaintex,tex,latex setlocal spell
set spelllang=en,cjk
hi clear SpellBad
hi SpellBad cterm=underline,bold ctermbg=8 " bg=DarkGrey
hi clear SpellCap
hi SpellCap cterm=underline,bold

" .vimrc.local
augroup vimrc-local
  autocmd!
  autocmd BufNewFile,BufReadPost * call s:vimrc_local(expand('<afile>:p:h'))
augroup END

function! s:vimrc_local(loc)
  let files = findfile('.vimrc.local', escape(a:loc, ' ') . ';', -1)
  for i in reverse(filter(files, 'filereadable(v:val)'))
    source `=i`
  endfor
endfunction

" LaTeX
let s:error_msg = {}
function! s:show_latex_compilation_record_message(job_id, data, _event)
  if !has_key(s:error_msg, a:job_id)
    let s:error_msg[a:job_id] = ['']
  endif
  let s:error_msg[a:job_id][-1] .= a:data[0]
  call extend(s:error_msg[a:job_id], a:data[1:])
endfunction

function! s:show_latex_compilation_complete_message(job_id, data, _event)
  if a:data == 0
    echo "LaTeX compilation completed!"
  else
    echo join(s:error_msg[a:job_id], "\n")
  endif
  call remove(s:error_msg, a:job_id)
endfunction

autocmd BufWritePost *.tex call jobstart('docker run --rm -v $HOME:$HOME -w $PWD gitlab-registry.eidos.ic.i.u-tokyo.ac.jp/shiina/docker-latex/fonts make', {
\ 'on_stdout': function('s:show_latex_compilation_record_message'),
\ 'on_stderr': function('s:show_latex_compilation_record_message'),
\ 'on_exit':   function('s:show_latex_compilation_complete_message')
\ })
