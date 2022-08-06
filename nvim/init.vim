call plug#begin()
Plug 'preservim/nerdtree'
Plug 'gerardbm/vim-atomic'
Plug 'martinsione/darkplus.nvim'
Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'
Plug 'tpope/vim-sleuth'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }
Plug 'editorconfig/editorconfig-vim'
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
" nmap <C-l> <C-w>l
" nmap <C-h> <C-w>h

set tabstop=4
set list
set listchars=tab:▷▷⋮

