set nocp

call pathogen#infect()

syntax enable
filetype plugin indent on

set noexpandtab smarttab
set autoindent smartindent

set sw=4 ts=4
set ruler

autocmd FileType python setl sw=4 sts=4 et
autocmd FileType coffee setl sw=2 sts=2 et

if has('gui_running')
	set nu list cursorline
	set listchars=tab:»\ ,eol:¬,trail:·

	" Disable the toolbar
	set guioptions-=T
end
