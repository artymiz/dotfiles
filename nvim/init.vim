" -------
" Plugins
" -------
call plug#begin('~/.config/nvim/plugged')
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
call plug#end()

let g:deoplete#enable_at_startup = 1
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

" --------
" Settings
" --------
syntax enable

colorscheme gruvbox
let g:gruvbox_contrast_dark = "hard"

filetype plugin indent on
set background=dark
set termguicolors               " enable rich color support
set autoindent
set expandtab smarttab tabstop=4 shiftwidth=4
set clipboard=unnamed
set cindent                     " C syntax formatting
set ruler number relativenumber
set wildmenu                    " navigable menu for tab completion
set wildmode=longest,list,full

set ttimeout
set ttimeoutlen=0

" ---------
"  Key Maps
" ---------
map <M-n> :NERDTreeToggle<CR>
