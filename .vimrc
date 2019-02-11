"vim-plug stuff

call plug#begin()

Plug 'bling/vim-airline'
Plug 'edkolev/tmuxline.vim'
Plug 'vim-airline/vim-airline-themes'
Plug 'alvan/vim-closetag'
Plug 'posva/vim-vue'
Plug 'KabbAmine/vCoolor.vim'
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdtree'
Plug 'plytophogy/vim-virtualenv'
Plug 'scrooloose/nerdcommenter'
Plug 'mattn/emmet-vim'
Plug 'pangloss/vim-javascript'
Plug 'w0rp/ale'
Plug 'Valloric/YouCompleteMe'

call plug#end()

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

"ale stuff
let g:airline#extensions#ale#enabled = 1
let g:ale_lint_delay = 1500

"vim-js
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_flow = 1
map <leader>l :exec &conceallevel ? "set conceallevel=0" : "set conceallevel=1"<CR>

"nerd commenter
let g:NERDSpaceDelims = 1
let g:NERDTrimTrailingWhitespace = 1
let g:NERDCustomDelimiters = { 'ch': { 'left': '/**','right': '*/' } }

"emmet
let g:user_emmet_install_global = 0
autocmd FileType html,css,php EmmetInstall
let g:user_emmet_leader_key='\'

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
