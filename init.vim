set fdm=marker  " Set folding type as marker. This allows vimrc to use comments for folding.

"  Vim-plug {{{
"------------------------------------------------------------------------------"

" Install vim-plug if it doesn't exist
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin(stdpath('data') . '/plugged')

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
set autoindent    " Automatically indent
set expandtab     " Insert spaces for tabs
set ignorecase    " Ignore case when searching
set shiftwidth=2  " Number of spaces for autoindent
set tabstop=2     " How many spaces a tab is
set textwidth=120 " Wrap text at this column

" Use clipboard for all yank operations
set clipboard+=unnamedplus

" Diff options
set diffopt=filler,vertical

" Ignore some file extensions when opening files
set wildignore+=*/.git/*,*.swp,*.bak

" }}}

" Colours and fonts {{{
"------------------------------------------------------------------------------"
colors slate

" }}}

" Custom shortcuts {{{
"------------------------------------------------------------------------------"
let mapleader = ","  "set <leader> to ','

" Change working directory to current file directory
nnoremap <leader>cd :cd %:p:h<CR>:pwd<CR>   

" Alternative to ESC key
inoremap ;; <ESC>

" Moving between windows easier
nnoremap <c-h> <C-W>h
nnoremap <c-l> <C-W>l
nnoremap <c-k> <C-W>k
nnoremap <c-j> <C-W>j

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
