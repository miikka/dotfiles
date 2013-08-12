source ~/code/dotfiles/bundles.vim
syntax enable

set expandtab smarttab
set autoindent smartindent

set sw=4 ts=4
set ruler
set laststatus=2
set wildmenu
set showcmd
set autoread
set incsearch
set showmatch

autocmd FileType python setl ts=8 sw=4 sts=4 et
autocmd FileType coffee setl sw=2 sts=2 et
autocmd FileType haskell nmap <Leader>s :%!stylish-haskell<Return>

au BufRead,BufNewFile *.wiki set filetype=creole

if has('gui_running')
	set nu list cursorline
	set listchars=tab:»\ ,eol:¬,trail:·

	" Disable the toolbar
	set guioptions-=T
end

set wildignore+=*.pyc,*.rbc,.*.swp,*/.sass-cache/*,*.ibc,*.o

let g:ctrlp_custom_ignore = {
	\ 'dir': '\.git$\|dev$\|ENV$\|node_modules$\|dist$\|cabal-dev$\|_build$\|_cache$\|_site$',
	\ }

nmap <C-b> :CtrlPBuffer<Return>
