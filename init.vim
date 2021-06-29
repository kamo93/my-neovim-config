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
set tabstop=2 
set softtabstop=0 noexpandtab
set shiftwidth=2
set smarttab
set smartindent
set nowrap
set scrolloff=16
set noswapfile
set nobackup
exec 'set undodir='.stdpath('config').'/undodir'
set undofile
set colorcolumn=80
set spell
set spelllang=en_us
set completeopt=menuone,noselect
set mouse=a
 
" plugin manager
call plug#begin('~/.config/nvim/plugged')
	Plug 'joshdick/onedark.vim'
	Plug 'tpope/vim-fugitive'
	Plug 'itchyny/lightline.vim'
	Plug 'preservim/nerdtree'
	Plug 'tpope/vim-surround'
	Plug 'mg979/vim-visual-multi'
	Plug 'mbbill/undotree'
	Plug 'neovim/nvim-lspconfig'
	Plug 'hrsh7th/nvim-compe'
	Plug 'morhetz/gruvbox'
	Plug 'jiangmiao/auto-pairs'
call plug#end()

" mapleader to space
let mapleader = " "

nnoremap <Leader>sv :source $MYVIMRC<CR>
nnoremap <Leader> <Nop>
nnoremap <Leader>l :action NextTab<CR>
nnoremap <Leader>h :action PreviousTab<CR>
nnoremap <Leader><esc> :action CloseEditor<CR>
nnoremap <Leader>c yiwoconsole.log('<esc>pla,<esc>p
" remap for quit space q
nnoremap <Leader>q :q<CR>
" remap for save save w
nnoremap <Leader>s :w<CR>

" remap for autocomplete brackets and similars
""inoremap ( ()<Esc>i
""inoremap { {}<Esc>i
""inoremap {<CR> {<CR>}<Esc>O
""inoremap [ []<Esc>i
""inoremap < <><Esc>i
""inoremap ' ''<Esc>i
""inoremap " ""<Esc>i

" Quickly insert an empty new line without entering insert mode
nnoremap <Leader>o o<Esc>0"_D
nnoremap <Leader>O O<Esc>0"_D

" remap nerdtree
let NERDTreeShowHidden=1
nnoremap <Leader>n :NERDTreeFocus<CR>

syntax on
colorscheme gruvbox

if (has("termguicolors"))
	set termguicolors
endif

" lightline config
if !has('gui_running')
	set t_Co=256
endif

let g:lightline = { 'colorscheme': 'gruvbox', }
" end lightline config

syntax on
" LSP configuration
source ~/.config/nvim/LSP/lsp-config.vim
luafile ~/.config/nvim/LSP/compe-config.lua


inoremap <silent><expr> <C-Space> compe#complete()
inoremap <silent><expr> <CR>      compe#confirm('<CR>')
inoremap <silent><expr> <C-e>     compe#close('<C-e>')
inoremap <silent><expr> <C-f>     compe#scroll({ 'delta': +4 })
inoremap <silent><expr> <C-d>     compe#scroll({ 'delta': -4 })
