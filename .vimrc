set autoindent
set tabstop=4
set shiftwidth=4
set autoindent
set grepprg=grep\ -nH\ $*
let g:tex_flavor = "latex"
syntax on

"Filetype settings
filetype plugin indent on
autocmd Filetype haskell setlocal ts=2 sw=2 expandtab
au BufNewFile,BufRead *.ejs set filetype=html

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

"commands
command W w !sudo tee % >/dev/null
command Ff FufFile
command Tn tabnext
command Tt tabnew
command Tc tabclose
