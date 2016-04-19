# History files

HISTSIZE=1200
SAVEHIST=1000
HISTFILE=~/.history
setopt APPEND_HISTORY
setopt HIST_EXPIRE_DUPS_FIRST
setopt EXTENDED_HISTORY

# Options

setopt autocd
setopt noignoreeof
setopt EXTENDED_GLOB
setopt interactivecomments
setopt AUTO_PUSHD

# Env

export PATH=${PATH}:~/bin:~/.cabal/bin
export EDITOR=vim
export VISUAL=$EDITOR
export PAGER=less

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

# Enable zmv

autoload -U zmv

# Prompt

setopt prompt_subst

case `hostname -f` in
	*.zenrobotics.com) HOSTCOLOR=$fg[red];;
	*.kapsi.fi) HOSTCOLOR=$fg[cyan];;
	*) HOSTCOLOR=$fg[green];;
esac


PROMPT="%(?..%{$fg[yellow]%}%? )%{$HOSTCOLOR%}%m%{$fg[green]%}:%{$fg[magenta]%}%~\${vcs_info_msg_0_} %{$fg[green]%}%#%{$reset_color%} "

case $TERM in
	(xterm|rxvt*)
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

# stolen from chris2
# http://chneukirchen.org/blog/archive/2013/07/summer-of-scripts-l-and-lr.html

l() {
  local p=$argv[-1]
  [[ -d $p ]] && { argv[-1]=(); } || p='.'
  find $p ! -type d | sed 's:^./::' | egrep "${@:-.}"
}

# Local

if [ -e ~/.zshrc.local ]; then
	source ~/.zshrc.local
fi
