" Vundle configuration

set nocp
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'kien/ctrlp.vim'
Bundle 'mileszs/ack.vim'
Bundle 'klen/python-mode'
Bundle 'tpope/vim-surround'
Bundle 'guns/vim-clojure-static'

" Color schemes
Bundle 'altercation/vim-colors-solarized'
Bundle 'nanotech/jellybeans.vim'
Bundle 'Zenburn'

filetype plugin indent on
