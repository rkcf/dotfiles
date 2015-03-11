filetype plugin indent on
set autoindent
set tabstop=4
set shiftwidth=4
set autoindent
set grepprg=grep\ -nH\ $*
let g:tex_flavor = "latex"
syntax on

"colortheme
set t_Co=256
colorscheme elflord

"folding
set foldmethod=indent
set foldnestmax=10
set nofoldenable
set foldlevel=1

"keymaps
map <Esc><Esc> :w<CR>
