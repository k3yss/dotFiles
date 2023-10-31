filetype off
set shiftwidth=4
set tabstop=4
set wrap
set linebreak
set noincsearch
set ignorecase
set history=1000
set wildmenu
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx
set guifont=UbuntuMono
set cursorcolumn
set noshowmode
set hlsearch
set mouse=
set cursorline
set nobackup
set nowritebackup
set spelllang=en_us
set spell
set number

" setting the leader key to " "
let mapleader = " " " map leader to Space
" Having longer updatetime (default is 4000 ms = 4s) leads to noticeable
" delays and poor user experience
set updatetime=300
" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved
set signcolumn=yes
let g:airline_theme = "tokyonight"
let g:airline_powerline_fonts = 1



if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

let g:rainbow_active = 1
let g:airline_symbols.colnr = '  ㏇:'

call plug#begin()
Plug 'jiangmiao/auto-pairs'
Plug 'vim-airline/vim-airline'
Plug 'peterhoeg/vim-qml'
Plug 'frazrepo/vim-rainbow'
Plug 'psliwka/vim-smoothie'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'ghifarit53/tokyonight-vim'
Plug 'NLKNguyen/papercolor-theme'
Plug 'rush-rs/tree-sitter-asm'
" LSP Support
Plug 'neovim/nvim-lspconfig'             " Required
Plug 'williamboman/mason.nvim'           " Optional
Plug 'williamboman/mason-lspconfig.nvim' " Optional

" Autocompletion
Plug 'hrsh7th/nvim-cmp'         " Required
Plug 'hrsh7th/cmp-nvim-lsp'     " Required
Plug 'L3MON4D3/LuaSnip'         " Required

Plug 'VonHeikemen/lsp-zero.nvim', {'branch': 'v2.x'}

" telescope
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.2' }
Plug 'nvim-telescope/telescope-live-grep-args.nvim'
" or                                , { 'branch': '0.1.x' }
" Highlight word under cursor
Plug 'xiyaowong/nvim-cursorword'
" NerdTree
Plug 'ryanoasis/vim-devicons'

" Latex
Plug 'lervag/vimtex'
call plug#end()

" Auto format key to <F3>
" noremap <F3> :Autoformat<CR>
let g:autoformat_autoindent = 0
let g:autoformat_retab = 0
let g:autoformat_remove_trailing_spaces = 0

set background=light
colorscheme PaperColor

" Make double-<Esc> clear search highlights
nnoremap <silent> <Esc><Esc> <Esc>:nohlsearch<CR><Esc>
set t_Co=0

" Navigation keys remap

nnoremap <Down> gj
nnoremap <Up> gk
vnoremap <Down> gj
vnoremap <Up> gk
inoremap <Down> <C-o>gj
inoremap <Up> <C-o>gk

" nvim treesitter config
lua require('config/treesitter')

" nvim telescope congfig
lua require('config/telescope') 
syntax off
Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }


" nvim autoformatter path
let g:python3_host_prog="/usr/bin/python"


lua <<EOF
local lsp = require('lsp-zero').preset({})

lsp.on_attach(function(client, bufnr)
  -- see :help lsp-zero-keybindings
  -- to learn the available actions
  lsp.default_keymaps({buffer = bufnr})
end)

-- " (Optional) Configure lua language server for neovim
require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

lsp.setup()

-- Make sure you setup `cmp` after lsp-zero

local cmp = require('cmp')

cmp.setup({
  mapping = {
    ['<CR>'] = cmp.mapping.confirm({select = true}),
  }
})
EOF

" selected word underline
hi default CursorWord cterm=underline gui=underline

" move blocks of code up and down 

nnoremap <C-S-Down> :m .+1<CR>==
nnoremap <C-S-Up> :m .-2<CR>==
inoremap <C-S-Down> <Esc>:m .+1<CR>==gi
inoremap <C-S-Up> <Esc>:m .-2<CR>==gi
vnoremap <C-S-Down> :m '>+1<CR>gv=gv
vnoremap <C-S-Up> :m '<-2<CR>gv=gv

" Inverse shift tabs
" for command mode
nnoremap <S-Tab> <<
vnoremap <S-Tab> <<
nnoremap <Tab> >>
vnoremap <Tab> >>
" for insert mode
inoremap <S-Tab> <C-d>

inoremap <C-Enter> <Esc> o
nnoremap <C-Enter> o

" Syntax on using f6
"
nnoremap <F6> :if exists("g:syntax_on") <Bar>
    \   syntax off <Bar>
    \ else <Bar>
    \   syntax enable <Bar>
    \ endif <CR>

" Surround with parenthesis and ""
nnoremap <leader>( viw<esc>a)<esc>hbi(<esc>lel
nnoremap <leader>" viw<esc>a"<esc>hbi"<esc>lel

" Enable folding
set foldmethod=syntax
set foldlevel=10
set foldclose=all
