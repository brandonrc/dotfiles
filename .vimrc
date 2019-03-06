set nocompatible              " be iMproved, required
filetype off                  " required

"set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
set rtp+=~/.fzf
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/nerdtree'
Plugin 'joshdick/onedark.vim'
Plugin 'junegunn/fzf'
Plugin 'rakr/vim-one'
Plugin 'tpope/vim-surround'
Plugin 'scrooloose/syntastic'
Plugin 'vim-airline/vim-airline'
Plugin 'tpope/vim-commentary'
Plugin 'yggdroot/indentline'

" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
"Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just
" :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to
" auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
let mapleader = ","
set clipboard=unnamed

" turn relative line numbers on
set relativenumber
set rnu
set tabstop=4
set shiftwidth=4
set expandtab

map <C-t> :NERDTreeToggle<CR>
"FZF stuff"
" If installed using git

"Visual Mappings"
vnoremap <Leader>y "+y
vnoremap <Leader>p "+p

"Buffers"
nnoremap <C-b> :buffers<CR>:buffer<Space>
"Insert Mappings"
imap jk <Esc>

"Terminal Mode Mappings
tnoremap jk <C-\><C-n>

"Non Recursive Mappings"
nnoremap <C-N> :bnext<CR>
nnoremap <C-M> :bprev<CR>
"Show all buffers
let g:airline#extensions#tabline#enabled = 1

" FZF stuff
nnoremap <C-P> :FZF<CR>
" Mapping selecting mappings
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)

" Save last buffer position
autocmd BufReadPost * if @% !~# '\.git[\/\\]COMMIT_EDITMSG$' && line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif 

"Neovim stuff
let g:python3_host_prog = '/.pyenv/versions/3.6.6/bin/python'

let g:lightline = {
  \ 'colorscheme': 'onedark',
  \ }
syntax on
colorscheme onedark
set background=dark " for the dark version
