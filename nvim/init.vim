" -------
" Plugins
" -------
call plug#begin('~/.config/nvim/plugged')
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'stsewd/fzf-checkout.vim'
Plug 'tpope/vim-fugitive'

Plug 'ryanoasis/vim-devicons'
Plug 'neovim/nvim-lspconfig',
Plug 'nvim-lua/completion-nvim'
Plug 'jackguo380/vim-lsp-cxx-highlight',
Plug 'm-pilia/vim-ccls',

Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-lua/telescope.nvim'

Plug 'vim-airline/vim-airline'
Plug 'kaicataldo/material.vim', { 'branch': 'main' }
call plug#end()

" --------
" Settings
" --------
let g:material_theme_style = 'darker'
colorscheme material
set background=dark
" set true colors
if (has('termguicolors'))
    set termguicolors
endif

let mapleader=" "

syntax enable
filetype plugin indent on
set ruler number relativenumber
set clipboard+=unnamedplus
set mouse=a
set expandtab shiftwidth=4 softtabstop=4 tabstop=4
set ignorecase smartcase
set wildmode=longest,list,full
set splitbelow splitright

" fzf fuzzy finder
let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8 } }
let $FZF_DEFAULT_OPTS='--reverse'

" vim fugutive
nnoremap <leader>gc :GBranches<CR>
nnoremap <leader>gp :Gpush<CR>
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>ga :Git fetch --all<CR>

" telescope
lua require('telescope').setup({defaults = {file_sorter = require('telescope.sorters').get_fzy_sorter}})

nnoremap <leader>tg :lua require('telescope.builtin').git_files()<CR>
nnoremap <leader>tf :lua require('telescope.builtin').find_files()<CR>
nnoremap <leader>tw :lua require('telescope.builtin').grep_string { search = vim.fn.expand("<cword>") }<CR>
nnoremap <leader>tb :lua require('telescope.builtin').buffers()<CR>
nnoremap <leader>th :lua require('telescope.builtin').help_tags()<CR>

" windows sizing
nnoremap <leader>+ :vertical resize +5<CR>
nnoremap <leader>- :vertical resize -5<CR>

" ========================
" Language Server Protocol
" ========================

"completion
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
set completeopt=menuone,noinsert,noselect
let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']

" ccls
lua <<EOF
require'nvim_lsp'.ccls.setup{
    init_options = {
        highlight = { lsRanges = true; }
    },
    on_attach=require'completion'.on_attach
}    
EOF

nnoremap <leader>vd :lua vim.lsp.buf.definition()<CR>
nnoremap <leader>vi :lua vim.lsp.buf.implementation()<CR>
nnoremap <leader>vsh :lua vim.lsp.buf.signature_help()<CR>
nnoremap <leader>vrr :lua vim.lsp.buf.references()<CR>
nnoremap <leader>vrn :lua vim.lsp.buf.rename()<CR>
nnoremap <leader>vh :lua vim.lsp.buf.hover()<CR>
nnoremap <leader>vca :lua vim.lsp.buf.code_action()<CR>
nnoremap <leader>vsd :lua vim.lsp.util.show_line_diagnostics(); vim.lsp.util.show_line_diagnostics()<CR>
