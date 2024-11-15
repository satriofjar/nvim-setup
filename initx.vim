" Install vim-plug if not found
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif

call plug#begin('~/.vim/plugged')
    Plug 'preservim/nerdtree'
    "Plug 'junegunn/vim-easy-align'
    "Plug 'sheerun/vim-polyglot'
    " Colors
    "Plug 'dracula/vim', {'as':'dracula'}
    Plug 'olimorris/onedarkpro.nvim', {'as': 'onedark'}
    " Telescope
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.6' }
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

    "Buffer line
    Plug 'nvim-tree/nvim-web-devicons' 
    Plug 'akinsho/bufferline.nvim', { 'tag': '*' }
    Plug 'numToStr/Comment.nvim'
call plug#end()


lua << EOF
local configs = require('nvim-treesitter.configs')

configs.setup({
    ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "javascript", "html", "css", "typescript", "tsx", "svelte", "go", "json", "python", "cpp" },
    sync_install = false,
    highlight = { enable = true },
    indent = { enable = true },  
    auto_install = true
})
EOF


lua << EOF
require('Comment').setup({
toggler = {line = '<leader>/', block = 'gbd'},
opleader = {line = '<leader>/', block = 'gc'}
})
EOF


let mapleader = ' '


"NERDTree setting
"autocmd VimEnter * NERDTree
"map <F2> :NERDTreeToggle<CR>

map <leader>j :NERDTreeToggle<CR>

" Map jj to normal mode
inoremap jj <Esc>

nnoremap <leader>d dd

" Map to split tab
noremap <C-w>- :split<cr>
noremap <C-w>\ :vsplit<cr>

" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>


"Bufferline 
" In your init.lua or init.vim
set termguicolors

" In your init.lua or init.vim
set termguicolors
lua << EOF
require("bufferline").setup{}
EOF

nnoremap <tab> :BufferLineCycleNext<CR>
nnoremap <s-tab> :BufferLineCyclePrev<CR>
nnoremap <leader>x :bdelete!<CR>


colorscheme onedark_dark

syntax on


filetype indent plugin on

set number
set hidden
set ai
"set mouse=a
set incsearch
set confirm
set number
"set ignorecase
set smartcase
set wildmenu
set showcmd
set hlsearch
set nomodeline
set backspace=indent,eol,start
set autoindent
set nostartofline
set ruler
set laststatus=2
set shiftwidth=4
set softtabstop=4
set expandtab
set nocompatible
set showmode
set scrolloff=10
"set termguicolors 
set signcolumn=yes
set isfname+=@-@
set updatetime=50
"set cmdheight=2
