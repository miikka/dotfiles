set nocp

call pathogen#infect()

syntax enable
filetype plugin indent on

set noexpandtab smarttab
set autoindent smartindent

set sw=4 ts=4
set ruler

autocmd FileType python setl ts=8 sw=4 sts=4 et
autocmd FileType coffee setl sw=2 sts=2 et

au BufRead,BufNewFile *.wiki set filetype=creole

if has('gui_running')
	set nu list cursorline
	set listchars=tab:»\ ,eol:¬,trail:·

	" Disable the toolbar
	set guioptions-=T
end

set wildignore+=*.pyc,*.rbc,.*.swp,*/.sass-cache/*,*.ibc,*.o

let g:ctrlp_custom_ignore = {
	\ 'dir': '\.git$\|dev$\|ENV$\|node_modules$',
	\ }

nmap <C-b> :CtrlPBuffer<Return>
