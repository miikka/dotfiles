# History files

HISTSIZE=100
SAVEHIST=100
HISTFILE=~/.history
EXTENDED_HISTORY=1

# Options

setopt autocd
setopt noignoreeof

# Env

export PATH=${PATH}:~/bin:~/.cabal/bin
export EDITOR=vim
export VISUAL=$EDITOR

# Colors

# Set up $fg
autoload -U colors && colors

# VCS info

autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:git*' check-for-changes true
zstyle ':vcs_info:git*' stagedstr "%{$fg[yellow]%}"
zstyle ':vcs_info:git*' unstagedstr "%{$fg[red]%}"
zstyle ':vcs_info:git*' formats " %{$fg[green]%}%c%u[%b]"

precmd() {
  vcs_info
}

# Prompt

setopt prompt_subst

case `hostname -f` in
	*.zenrobotics.com) HOSTCOLOR=$fg[red];;
	*.kapsi.fi) HOSTCOLOR=$fg[cyan];;
	*) HOSTCOLOR=$fg[green];;
esac

PROMPT="$fg[yellow]%? $HOSTCOLOR%m$fg[green]:$fg[magenta]%~\${vcs_info_msg_0_} $fg[green]%#$reset_color "

case $TERM in
	rxvt*)
		chpwd() { print -Pn "\e]0;%n@%m: %~\a" }
		chpwd
		;;
esac

# Vi edit mode

bindkey -v

# Completion

autoload -U compinit
compinit

zstyle ':completion:*:default' list-colors ''

# Handy aliases

case `uname -s` in
	"Darwin")
		alias ls='ls -FG'
		alias xget='curl -O `pbpaste`'
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

# Mess

hash -d mess=~/mess/current

function mess() {
	MESSDIR=~/mess/`date +%G-%V`

	if [ ! -e $MESSDIR ]; then
		mkdir -p $MESSDIR
		rm ~/mess/current
		ln -s $MESSDIR ~/mess/current
	fi

	cd $MESSDIR
	unset MESSDIR
}

# Local

if [ -e ~/.zshrc.local ]; then
	source ~/.zshrc.local
fi
