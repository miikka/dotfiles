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

# Prompt

## FIXME use zsh colors, get rid of hashed colors
PHC=`((hostname|sum|cut -f1 -d' '); echo "6%31+d[1+]sa33<ap") | dc`
HCP=$'%{\e['${PHC}$'m%}'
PS1=$'%{\e[0;33m%}%?\%{\e[0;32m%} '$HCP$'%m%{\e[0;32m%}:%{\e[0;35m%}%~%{\e[0;32m%} %#%}%{\e[0m%} '
unset PHC HCP

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

function hl() {
	awk "/${*}/ { print \"\033[31m\" \$0 \"\033[0m\" }; !/${*}/ { print \$0 }"
}

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
