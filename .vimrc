" vim-plug
call plug#begin('~/.vim/plugged')
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
Plug 'preservim/nerdtree'
Plug '~/.fzf'
Plug 'junegunn/fzf.vim'
Plug 'rust-lang/rust.vim'
Plug 'sheerun/vim-polyglot'
Plug 'sainnhe/edge'
call plug#end()

" key binding
nnoremap <silent> <C-f> :Files<CR>
nnoremap <silent> <C-b> :Buffers<CR>
nnoremap <silent> <C-e> :NERDTreeToggle<CR>

set number
filetype plugin indent on
" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab
syntax on

set autoindent
set encoding=utf-8

" for dark version
set background=dark

" the configuration options should be placed before `colorscheme edge`
let g:edge_style = 'neon'
let g:edge_disable_italic_comment = 1

colorscheme edge
