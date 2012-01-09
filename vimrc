set nocp

syntax enable

set noexpandtab smarttab
set autoindent smartindent

set sw=4 ts=4
set ruler

autocmd FileType python set omnifunc=pythoncomplete#Complete

if has('gui_running')
	set nu list cursorline
	set listchars=tab:»\ ,eol:¬,trail:·
end
