call plug#begin()
Plug 'preservim/nerdtree'
Plug 'gerardbm/vim-atomic'
Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
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

:set number
