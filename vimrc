" ----------
" Vim Config
" ----------
"
"
" How this works:
"
" This file is minimal.  Most of the vim settings and initialization is in
" several files in .vim/init.  This makes it easier to find things and to
" merge between branches and repos.
"
" Please do not add configuration to this file, unless it *really* needs to
" come first or last, like Vundle and sourcing the machine-local config.
" Instead, add it to one of the files in .vim/init, or create a new one.

set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'

"
" Colorschemes
"
Bundle 'tpope/vim-vividchalk'
Bundle 'molokai'
Bundle 'altercation/vim-colors-solarized'
Bundle 'wgibbs/vim-irblack'
Bundle 'chriskempson/vim-tomorrow-theme'
Bundle 'candycode.vim'
Bundle 'Color-Sampler-Pack'
Bundle 'flazz/vim-colorschemes'
Bundle 'nelstrom/vim-blackboard'

"
" Rails
"
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-endwise'
Bundle 'nelstrom/vim-textobj-rubyblock'

"
" General Editing
"
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-surround'
"Bundle 'scrooloose/nerdcommenter'
Bundle 'kana/vim-textobj-user'
Bundle 'tpope/vim-unimpaired'
Bundle 'sjl/gundo.vim'
Bundle 'scrooloose/syntastic'
Bundle 'Lokaltog/vim-powerline'
Bundle 'ervandew/supertab'
Bundle 'mgamba/j-split'
Bundle 'camelcasemotion'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'vim-scripts/snipMate'
"Bundle 'vim-scripts/L9'

"
" Searching
"
Bundle 'mileszs/ack.vim'
"Bundle 'tpope/vim-abolish'
"Bundle 'henrik/vim-qargs'
Bundle 'kien/ctrlp.vim'

"
" Navigation
"
Bundle 'scrooloose/nerdtree'
Bundle 'majutsushi/tagbar'

"
" Languages
"
Bundle 'vim-ruby/vim-ruby'
Bundle 'pangloss/vim-javascript'
Bundle 'plasticboy/vim-markdown'
Bundle 'slim-template/vim-slim'
Bundle 'nono/vim-handlebars'
Bundle 'kchmck/vim-coffee-script'
Bundle 'tpope/vim-haml'
"Bundle 'tpope/vim-cucumber'
Bundle 'juvenn/mustache.vim'
"Bundle 'jnwhiteh/vim-golang'
"Bundle 'rosstimson/scala-vim-support'
"Bundle 'guns/vim-clojure-static'
Bundle 'chrisbra/csv.vim'

"
" Development Tool Integration
"
Bundle 'tpope/vim-fugitive'
" This plugin is slow
Bundle 'airblade/vim-gitgutter'
"Bundle 'carlobaldassi/ConqueTerm'

syntax on
filetype plugin indent on

runtime macros/matchit.vim

if filereadable($HOME . "/.vimrc.local")
  source ~/.vimrc.local
endif

au BufRead,BufNewFile *.hamlc set ft=haml

""""""""""""""
" Al's Stuff "
""""""""""""""

colorscheme blackboard
set spell
set gfn=Monaco:h13
set linespace=3
set number

" Tab sizes
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

" Visible whitespace characters
set listchars=""                  " Reset the listchars
set listchars=eol:$,tab:>-,trail:.,extends:>,precedes:<
set list

" Nerdtree Tabs
map <Leader>n :NERDTreeToggle<CR>

" remove gui in macvim
" http://jonatkinson.co.uk/removing-toolbar-macvim/
if has("gui_running")
  set guioptions=egmrt
endif

" Map command-[ and command-] to indenting or outdenting
" while keeping the original selection in visual mode
" From: https://github.com/carlhuda/janus/blob/master/janus/vim/core/before/plugin/mappings.vim
if has("gui_macvim") && has("gui_running")
  vmap <D-]> >gv
  vmap <D-[> <gv

  nmap <D-]> >>
  nmap <D-[> <<

  omap <D-]> >>
  omap <D-[> <<

  imap <D-]> <Esc>>>i
  imap <D-[> <Esc><<i

  " Bubble single lines
  nmap <D-Up> [e
  nmap <D-Down> ]e
  nmap <D-k> [e
  nmap <D-j> ]e

  " Bubble multiple lines
  vmap <D-Up> [egv
  vmap <D-Down> ]egv
  vmap <D-k> [egv
  vmap <D-j> ]egv

  " Map Command-# to switch tabs
  map  <D-0> 0gt
  imap <D-0> <Esc>0gt
  map  <D-1> 1gt
  imap <D-1> <Esc>1gt
  map  <D-2> 2gt
  imap <D-2> <Esc>2gt
  map  <D-3> 3gt
  imap <D-3> <Esc>3gt
  map  <D-4> 4gt
  imap <D-4> <Esc>4gt
  map  <D-5> 5gt
  imap <D-5> <Esc>5gt
  map  <D-6> 6gt
  imap <D-6> <Esc>6gt
  map  <D-7> 7gt
  imap <D-7> <Esc>7gt
  map  <D-8> 8gt
  imap <D-8> <Esc>8gt
  map  <D-9> 9gt
  imap <D-9> <Esc>9gt
else
  " Map command-[ and command-] to indenting or outdenting
  " while keeping the original selection in visual mode
  vmap <A-]> >gv
  vmap <A-[> <gv

  nmap <A-]> >>
  nmap <A-[> <<

  omap <A-]> >>
  omap <A-[> <<

  imap <A-]> <Esc>>>i
  imap <A-[> <Esc><<i

  " Bubble single lines
  nmap <C-Up> [e
  nmap <C-Down> ]e
  nmap <C-k> [e
  nmap <C-j> ]e

  " Bubble multiple lines
  vmap <C-Up> [egv
  vmap <C-Down> ]egv
  vmap <C-k> [egv
  vmap <C-j> ]egv

  " Make shift-insert work like in Xterm
  map <S-Insert> <MiddleMouse>
  map! <S-Insert> <MiddleMouse>

  " Map Control-# to switch tabs
  map  <C-0> 0gt
  imap <C-0> <Esc>0gt
  map  <C-1> 1gt
  imap <C-1> <Esc>1gt
  map  <C-2> 2gt
  imap <C-2> <Esc>2gt
  map  <C-3> 3gt
  imap <C-3> <Esc>3gt
  map  <C-4> 4gt
  imap <C-4> <Esc>4gt
  map  <C-5> 5gt
  imap <C-5> <Esc>5gt
  map  <C-6> 6gt
  imap <C-6> <Esc>6gt
  map  <C-7> 7gt
  imap <C-7> <Esc>7gt
  map  <C-8> 8gt
  imap <C-8> <Esc>8gt
  map  <C-9> 9gt
  imap <C-9> <Esc>9gt
endif


set laststatus=2  " always show the status bar

" Start the status line
set statusline=%f\ %m\ %r
set statusline+=Line:%l/%L[%p%%]
set statusline+=Col:%v
set statusline+=Buf:#%n
set statusline+=[%b][0x%B]
