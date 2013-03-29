call pathogen#infect('bundle')

nmap <C-F> :Ack<space>
set number
set tabstop=2 shiftwidth=2 expandtab
set wrap


set mouse=a

set nocompatible      " We're running Vim, not Vi!
syntax on             " Enable syntax highlighting
filetype on           " Enable filetype detection
filetype indent on    " Enable filetype-specific indenting
filetype plugin on    " Enable filetype-specific plugins
set clipboard=unnamed
set wrap

set laststatus=2
" Search options
set hlsearch
set incsearch
set ignorecase
set smartcase

autocmd InsertEnter * syn clear EOLWS | syn match EOLWS excludenl /\s\+\%#\@!$/
autocmd InsertLeave * syn clear EOLWS | syn match EOLWS excludenl /\s\+$/
highlight EOLWS ctermbg=red guibg=red

" Vimdiff options
set diffopt+=iwhite

" lets me clear search hiliting with spacebar in normal mode
nmap <SPACE> <SPACE>:noh<CR>

" show the 80 column mark and current cursor location
set cursorline
set cursorcolumn

" Color stuff
set textwidth=80
set colorcolumn=+1
colorscheme lucius-mj
highlight colorcolumn ctermbg=238                                    

" Powerline specific - show full paths
let g:Powerline_stl_path_style = 'full'

set backspace=2 " make backspace work like most other apps
