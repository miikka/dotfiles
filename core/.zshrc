# History files

HISTSIZE=1200
SAVEHIST=1000
HISTFILE=~/.history
setopt APPEND_HISTORY
setopt HIST_EXPIRE_DUPS_FIRST
setopt EXTENDED_HISTORY
setopt HIST_IGNORE_SPACE

# Options

setopt autocd
setopt noignoreeof
setopt EXTENDED_GLOB
setopt interactivecomments
setopt AUTO_PUSHD

# Env

export PATH=${PATH}:~/bin:~/.cargo/bin
export EDITOR=vim
export VISUAL=$EDITOR
export PAGER=less

# Colors

# Set up $fg
autoload -U colors && colors

# Enable zmv

autoload -U zmv

# Prompt

if type "starship" >/dev/null; then
    eval "$(starship init zsh)"
else
    source ~/.zshrc.prompt
fi

# Vi edit mode

bindkey -v

autoload edit-command-line
zle -N edit-command-line
bindkey -M vicmd v edit-command-line

# Completion

autoload -U compinit
compinit

zstyle ':completion:*:default' list-colors ''

# Handy aliases

case `uname -s` in
	Darwin|FreeBSD)
		alias ls='ls -FG'
		alias xget='curl -O --location --remote-header-name `pbpaste`'
		;;
	*)
		alias ls='ls -F --color=auto'
		alias xget='wget `xsel`'
		;;
esac

alias ach="ack --haskell"
alias gl='git log "--pretty=format:%Cgreen%h %Cred%an %Creset%s %Cblue(%ar)"'
alias lt='ls -lhtr'
alias grep='grep --color=auto'
alias gg='noglob git g'

# Mess

hash -d mess=~/mess/current

function mess() {
	local MESSDIR=~/mess/`date +%G-%V`

	if [ ! -e $MESSDIR ]; then
		mkdir -p $MESSDIR
		ln -snf $MESSDIR ~/mess/current
	fi

	cd $MESSDIR
}

# stolen from leah
# https://leahneukirchen.org/blog/archive/2013/07/summer-of-scripts-l-and-lr.html

l() {
  local p=$argv[-1]
  [[ -d $p ]] && { argv[-1]=(); } || p='.'
  find $p ! -type d | sed 's:^./::' | egrep "${@:-.}"
}

# Local

if [ -e ~/.zshrc.local ]; then
	source ~/.zshrc.local
fi
