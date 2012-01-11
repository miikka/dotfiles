set nocp

call pathogen#infect()

syntax enable
filetype plugin indent on

set noexpandtab smarttab
set autoindent smartindent

set sw=4 ts=4
set ruler

autocmd FileType python set omnifunc=pythoncomplete#Complete

if has('gui_running')
	set nu list cursorline
	set listchars=tab:»\ ,eol:¬,trail:·
end
