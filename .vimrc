execute pathogen#infect()
execute pathogen#helptags()
syntax on
syntax enable
filetype plugin indent on
set expandtab
set tabstop=2
set shiftwidth=2
set ignorecase
set smartcase
set hlsearch
set clipboard=unnamed
set mouse=a
set backspace=2 " allows backspace to left of insertion point
set autoindent

" this is an example to have command-t ignore certain directories
set wildignore+=tmp/**,node_modules/**
set autoread

"color stuff
colorscheme solarized
set background=dark
let &colorcolumn=join(range(100,999),",")
let g:solarized_termcolors=16

" indent guides color config v
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=93
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=8

"stop the automatic comment insertion following a comment
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

noremap - :Switch<cr>

set wildignore+=tmp

" for vim-gist plugin
let g:gist_open_browser_after_post = 1

" RSpec.vim mappings
" map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunCurrentSpecFile()<CR>
" map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>
let g:rspec_runner = "os_x_iterm2"

inoremap jk <Esc>
inoremap jj <Esc>

let g:go_fmt_command = "goimports"

set number
if has('autocmd')
augroup vimrc_linenumbering
  autocmd!
  autocmd WinLeave *
             \ if &number |
             \   set norelativenumber |
             \ endif
  autocmd BufWinEnter *
             \ if &number |
             \   set relativenumber |
             \ endif
  autocmd VimEnter *
             \ if &number |
             \   set relativenumber |
             \ endif
augroup END
endif

" when switching colorscheme in terminal vim change the profile in iTerm as well
" https://github.com/vheon/home/blob/ea91f443b33bc15d0deaa34e172a0317db63a53d/.vim/vimrc#L330-L348
if !has('gui_running')
  function! s:change_iterm2_profile()
    let dual_colorschemes = ["solarized"]
    if exists('g:colors_name')
      let profile = g:colors_name
      if index(dual_colorschemes, g:colors_name) >= 0
        let profile .= '_'.&background
      endif
      let escape = '\033]50;SetProfile='.profile.'\x7'
      if exists('$TMUX')
        let escape = '\033Ptmux;'.substitute(escape, '\\033', '\\033\\033', 'g').'\033\\'
      endif
      silent call system("printf '".escape."' > /dev/tty")
    endif
  endfunction
  function! s:undo_iterm2_profile()
    let profile = "Default"
    let escape = '\033]50;SetProfile='.profile.'\x7'
    if exists('$TMUX')
      let escape = '\033Ptmux;'.substitute(escape, '\\033', '\\033\\033', 'g').'\033\\'
    endif
    silent call system("printf '".escape."' > /dev/tty")
  endfunction

  autocmd VimEnter,ColorScheme * call s:change_iterm2_profile()
  autocmd VimLeave * call s:undo_iterm2_profile()
endif

vnoremap <leader>64d c<c-r>=system('base64 --decode', @")<esc>
vnoremap <leader>64e c<c-r>=system('openssl base64 -e -A', @")<esc>
