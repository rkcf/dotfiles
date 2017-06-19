"vundle stuff
set nocompatible 
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'ervandew/supertab'
Plugin 'bling/vim-airline'
Plugin 'scrooloose/syntastic'
Plugin 'altercation/vim-colors-solarized'
Plugin 'morhetz/gruvbox'
Plugin 'edkolev/tmuxline.vim'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'Valloric/YouCompleteMe'
Plugin 'rdnetto/YCM-Generator'
Plugin 'racer-rust/vim-racer'
Plugin 'davidhalter/jedi-vim'
Plugin 'tomlion/vim-solidity'

call vundle#end()

let g:airline_powerline_fonts = 1
let g:airline_theme = 'jellybeans'

set hidden
let g:racer_cmd = "/usr/bin/racer"
let g:racer_experimental_completer = 1

"filetype stuff
filetype plugin indent on
au Filetype haskell setlocal ts=2 sw=2 expandtab
au Filetype python setlocal sts=4 sw=4 expandtab
au BufNewFile,BufRead *.ejs set filetype=html

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
set background=dark
colorscheme delek 
set laststatus=2


"folding
set foldmethod=indent
set foldnestmax=10
set nofoldenable
set foldlevel=1

"keymaps
map <Esc><Esc> :w<CR>
iabbrev </ </<C-X><C-O>

"commands
command W w !sudo tee % >/dev/null
command Tt tabnew
command Tc tabclose

