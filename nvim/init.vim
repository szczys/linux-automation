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
Plug 'sickill/vim-monokai'
Plug 'bfrg/vim-cpp-modern'
Plug 'morhetz/gruvbox'
Plug 'altercation/vim-colors-solarized'
Plug 'jacoborus/tender.vim'
" Plug 'ycm-core/YouCompleteMe'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'edkolev/tmuxline.vim'
Plug 'tpope/vim-surround'
Plug 'SidOfc/mkdx'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'babaybus/DoxygenToolkit.vim'
Plug 'neoclide/coc.nvim'
Plug 'jiangmiao/auto-pairs'
call plug#end()

let g:python3_host_prog = '/usr/bin/python3'

" Additional install for YouCompleteMe:
" cd ~/.local/share/nvim/plugged/YouCompleteMe
" python3 install.py --all

" use <tab> for trigger completion and navigate to the next complete item
function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()

inoremap <expr> <Tab> coc#pum#visible() ? coc#pum#next(1) : "\<Tab>"
inoremap <expr> <S-Tab> coc#pum#visible() ? coc#pum#prev(1) : "\<S-Tab>"

" vim-airlines
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1

" Tmuxline
let g:tmuxline_preset = 'full'

if has("termguicolors")
	let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
	let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
	set termguicolors
endif

syntax enable

" allow mouse scrollwheel
set mouse=n

" set theme
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
"set listchars=tab:▷▷⋮
set listchars=tab:\ \ ┊,trail:●,extends:…,precedes:…

" GitGutter color fix
highlight! link SignColumn LineNr

