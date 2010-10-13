# History files

HISTSIZE=50
SAVEHIST=50
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

PHC=`((hostname|sum|cut -f1 -d' '); echo "6%31+d[1+]sa33<ap") | dc`
HCP=$'%{\e['${PHC}$'m%}'
PS1=$'%{\e[0;33m%}%?\%{\e[0;32m%}:%{\e[0;33m%}%j '$HCP$'%m%{\e[0;32m%}:%{\e[0;35m%}%~%{\e[0;32m%} %#%}%{\e[0m%} '
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

# Handy aliases

case `uname -s` in
	"Darwin")	alias ls='ls -FG';;
	*)			alias ls='ls -F --color=auto';;
esac

alias st='git status'
alias gl='git log "--pretty=format:%Cgreen%h %Cred%an %Creset%s %Cblue(%ar)"'
alias lt='ls -lhtr'
alias xget='wget `xsel`'

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

# Sync

function sync() {
	if [ ! -e $SYNC_LOCAL ]; then
		mkdir -p $SYNC_LOCAL
	fi
	unison $SYNC_REPO $SYNC_LOCAL
}

SYNC_REPO="ssh://lakka.kapsi.fi/sync"
SYNC_LOCAL="$HOME/sync"

# Dotfiles env

function savedot() {
	pushd ~/code/dotfiles
	git commit -a
	git push
	popd
}


# Local

if [ -e ~/.zshrc.local ]; then
	source ~/.zshrc.local
fi
