"misc
set autoindent
set tabstop=4
set shiftwidth=4
set autoindent
set grepprg=grep\ -nH\ $*
set exrc
set secure
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

"commands
command W w !sudo tee % >/dev/null
command Tt tabnew
command Tc tabclose

"vundle stuff
set nocompatible 
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'ervandew/supertab'
Plugin 'bling/vim-airline'

call vundle#end()

"filetype stuff
filetype plugin indent on
autocmd Filetype haskell setlocal ts=2 sw=2 expandtab
au BufNewFile,BufRead *.ejs set filetype=html
