" Vundle configuration

set nocp
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'kien/ctrlp.vim'
Bundle 'mileszs/ack.vim'

filetype plugin indent on
