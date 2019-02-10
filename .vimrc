"vundle stuff
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'bling/vim-airline'
Plugin 'scrooloose/syntastic'
Plugin 'edkolev/tmuxline.vim'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'Valloric/YouCompleteMe'
Plugin 'alvan/vim-closetag'
Plugin 'posva/vim-vue'
Plugin 'KabbAmine/vCoolor.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/nerdtree'
Plugin 'kien/ctrlp.vim'
Plugin 'plytophogy/vim-virtualenv'
Plugin 'tpope/vim-unimpaired'
Plugin 'jceb/vim-orgmode'
Plugin 'tpope/vim-speeddating'
Plugin 'fatih/vim-go'
Plugin 'scrooloose/nerdcommenter'
Plugin 'mattn/emmet-vim'
Plugin 'pangloss/vim-javascript'

call vundle#end()

let g:airline_powerline_fonts = 1
let g:airline_theme = 'jellybeans'

let g:closetag_filenames = '*.html, *.xhtml, *.md'

set hidden

"filetype stuff
filetype plugin indent on
au Filetype haskell setlocal ts=2 sw=2 expandtab
au Filetype python setlocal sts=4 sw=4 expandtab
au Filetype yaml setlocal sts=2 sw=2 expandtab
au Filetype vue setlocal sts=2 sw=2 expandtab
au Filetype html setlocal sts=2 sw=2 expandtab
au Filetype javascript setlocal sts=2 sw=2 expandtab
au BufNewFile,BufRead *.ejs set filetype=html


"vim-js
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_flow = 1
map <leader>l :exec &conceallevel ? "set conceallevel=0" : "set conceallevel=1"<CR>

"nerd commenter
let g:NERDSpaceDelims = 1
let g:NERDTrimTrailingWhitespace = 1


"emmet
let g:user_emmet_install_global = 0
autocmd FileType html,css,php EmmetInstall
let g:user_emmet_leader_key='\'

"syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_javascript_eslint_exe='$(npm bin)/eslint'

"nerdcommenter
let g:NERDCustomDelimiters = { 'ch': { 'left': '/**','right': '*/' } }


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
colorscheme slate
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
