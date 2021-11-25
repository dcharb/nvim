set nocompatible     " Configure for VIM instead of VI
let mapleader = ","  "set <leader> to ','

set fdm=marker  " Set folding type as marker. This allows vimrc to use comments for folding.

"  Vim-plug {{{
"------------------------------------------------------------------------------"

if has('win32')
   call plug#begin('$HOME\vimfiles\plugged')
elseif has('unix')
   call plug#begin('$HOME/.vim/plugged')
endif

Plug 'fatih/vim-go', {'do': ':GoUpdateBinaries' }
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
"Plug 'junegunn/gv.vim'
Plug 'junegunn/vim-easy-align'
Plug 'preservim/nerdcommenter'
Plug 'preservim/tagbar'
Plug 'tpope/vim-fugitive'

call plug#end()

" }}}

" General settings {{{
"------------------------------------------------------------------------------"
set textwidth=120    " Wrap text at this column
set autoindent       " Automatically indent
set expandtab        " Insert spaces for tabs
set shiftwidth=2     " Number of spaces for autoindent
set tabstop=2        " How many spaces a tab is

" Ignore some file extensions when opening files
set wildignore+=*/.git/*,*.swp,*.bak

" }}}

" Colours and fonts {{{
"------------------------------------------------------------------------------"
colors slate

" }}}

" Custom shortcuts {{{
"------------------------------------------------------------------------------"
" Change working directory to current file directory
nnoremap <leader>cd :cd %:p:h<CR>:pwd<CR>   

" Alternative to ESC key
inoremap ;; <ESC>

" Moving between windows easier
"nnoremap <c-h> <C-W>h
"nnoremap <c-l> <C-W>l
"nnoremap <c-k> <C-W>k
"nnoremap <c-j> <C-W>j

" Copy & Paste using clipboard
"vmap <leader>cop "+y
"nnoremap <leader>pas "+gp

" }}}

" Formatting commands {{{
"------------------------------------------------------------------------------"
nnoremap <leader>xml :%s/></>\r</g<CR>:0<CR>=:$<CR>
vmap <leader>xml :'<,'>s/></>\r</g<CR>:0<CR>=:$<CR>
nnoremap <leader>json :%!python -m json.tool<CR>

" }}}

" PLUGINS {{{

"  FZF {{{
"------------------------------------------------------------------------------"
if has('unix')
   set rtp+=/usr/local/opt/fzf
endif
let g:fzf_layout = { 'down': '90%' }
let g:fzf_preview_window = ['up:90%:hidden', 'ctrl-/']
nnoremap ;b :Buffers<CR>
nnoremap ;t :Tags<CR>
nnoremap ;m :History<CR>
nnoremap ;f :Files<CR>
nnoremap <c-f> :BLines

" }}}

"  omnicompletion {{{
"------------------------------------------------------------------------------"
set omnifunc=syntaxcomplete#Complete

" }}}

" }}}
