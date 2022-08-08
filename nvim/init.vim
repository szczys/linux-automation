call plug#begin()
Plug 'preservim/nerdtree'
Plug 'gerardbm/vim-atomic'
Plug 'martinsione/darkplus.nvim'
Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'
Plug 'tpope/vim-sleuth'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }
Plug 'editorconfig/editorconfig-vim'
Plug 'airblade/vim-gitgutter'
Plug 'KarimElghamry/vim-auto-comment'
Plug 'vim-scripts/ZoomWin'
call plug#end()

if has("termguicolors")
	let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
	let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
	set termguicolors
endif

syntax enable

let g:atomic_italic = 0
colorscheme atomic
AtomicDarkBlueHard

" Show line numbers and column 80
:set number
:set colorcolumn=80

" esc in insert & vsual mode
inoremap kj <Esc>
vnoremap kj <Esc>

" remap nerdtree toggle
nmap <C-n> :NERDTreeToggle<CR>

" remap pane navigation
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

set tabstop=4
set list
set listchars=tab:▷▷⋮

