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
set shortmess+=c " Avoid showing message extra message when using completion
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
set completeopt=menuone,noinsert,noselect
set mouse=a
set signcolumn=yes
 
" plugin manager
call plug#begin('~/.config/nvim/plugged')
" general plugins
	Plug 'itchyny/lightline.vim'
	Plug 'preservim/nerdtree'
	Plug 'tpope/vim-surround'
	Plug 'mg979/vim-visual-multi'
	Plug 'mbbill/undotree'
	Plug 'jiangmiao/auto-pairs'
	Plug 'alvan/vim-closetag'

" git 
	Plug 'tpope/vim-fugitive'
	Plug 'airblade/vim-gitgutter'

" Neovim LSP
	Plug 'neovim/nvim-lspconfig'
	Plug 'nvim-lua/completion-nvim'

" Telescope
	Plug 'nvim-lua/popup.nvim'
	Plug 'nvim-lua/plenary.nvim'
	Plug 'nvim-telescope/telescope.nvim' 

" color theme
	Plug 'morhetz/gruvbox'

" Javascript
	Plug 'maxmellon/vim-jsx-pretty'
	Plug 'yuezk/vim-js'
call plug#end()

" vim'gitguitter configure
let g:gitgutter_terminal_reports_focus=0

" autoclose tag configure
let g:closetag_xhtml_filenames = '*.jsx, *.js'
let g:closetag_xhtml_filetypes = 'xhtml,jsx'

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

" Quickly insert an empty new line without entering insert mode
nnoremap <Leader>o o<Esc>0"_D
nnoremap <Leader>O O<Esc>0"_D

" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" remap nerdtree
let NERDTreeShowHidden=1
nnoremap <Leader>n :NERDTreeFocus<CR>

if exists('+termguicolors')
	let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum]"
	let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum]"
endif

if (has("termguicolors"))
	set termguicolors
endif

syntax on
colorscheme gruvbox

" lightline config
if !has('gui_running')
	set t_Co=256
endif

let g:lightline = { 'colorscheme': 'gruvbox', }
" end lightline config
let g:gruvbox_invert_selection = '0'
let g:gruvbox_contrast_dark    = 'hard'
highlight Normal guibg=none

" LSP configuration
source ~/.config/nvim/LSP/lsp-config.vim

" Use completion-nvim in every buffer
autocmd BufEnter * lua require'completion'.on_attach()

source ~/.config/nvim/telescope.vim
