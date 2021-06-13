syntax on
filetype off
" neovim config https://neovim.io/doc/user/nvim.html
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath

" my set config
set nocompatible
set number
set autoindent
set relativenumber
if exists(":ideajoin")
	set ideajoin
endif
if exists(":idearefactormode=keep")
	set idearefactormode=keep
endif
set nohls
set ignorecase
set incsearch " incremental search that show partial matches
set smartcase
set shortmess-=S
set noshowmode " hide --INSERT-- 
set tabstop=2 softtabstop=2
set smarttab
set nowrap
set scrolloff=16
set noswapfile
set nobackup
exec 'set undodir='.stdpath('config').'/undodir'
set undofile
" plugin manager
call plug#begin('~/.config/nvim/plugged')
	Plug 'joshdick/onedark.vim'
	Plug 'tpope/vim-fugitive'
	Plug 'itchyny/lightline.vim'
	Plug 'preservim/nerdtree'
	Plug 'tpope/vim-surround'
	Plug 'terryma/vim-multiple-cursors'
	Plug 'mbbill/undotree'
call plug#end()

" mapleader to space
let mapleader = " "

nnoremap <Leader>sv :source $MYVIMRC<CR>
nnoremap <Leader> <Nop>
nnoremap <Leader>l :action NextTab<CR>
nnoremap <Leader>h :action PreviousTab<CR>
nnoremap <Leader><esc> :action CloseEditor<CR>
nnoremap <Leader>c yiwoconsole.log('<esc>pla,<esc>p

" Quickly insert an empty new line without entering insert mode
nnoremap <Leader>o o<Esc>0"_D
nnoremap <Leader>O O<Esc>0"_D

" remap nerdtree
nnoremap <Leader>n :NERDTreeFocus<CR>

" one dark vim theme config
let g:onedarf_termina_italics = 1
colorscheme onedark
if (has("nvim"))
"For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
	let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif
"For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
"Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
" < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
if (has("termguicolors"))
	set termguicolors
endif
" end one dark theme config

" lightline config
if !has('gui_running')
	set t_Co=256
endif

let g:lightline = {
  \ 'colorscheme': 'onedark',
  \ }
" end lightline config
