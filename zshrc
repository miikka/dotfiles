# History files

HISTSIZE=50
SAVEHIST=50
HISTFILE=~/.history
EXTENDED_HISTORY=1

# Options

setopt autocd

# Env

export PATH=${PATH}:~/bin
export EDITOR=vim

# Prompt

PHC=`((hostname|sum|cut -f1 -d' '); echo "6%31+d[1+]sa33<ap") | dc`
HCP=$'%{\e['${PHC}$'m%}'
PS1=$'%{\e[0;33m%}%h '$HCP$'%m%{\e[0;32m%}:%{\e[0;35m%}%~%{\e[0;32m%} %#%}%{\e[0m%} '
unset PHC HCP

# Vi edit mode

bindkey -v

# Completion

autoload -U compinit
compinit

# Handy aliases

alias ls='ls -F --color=auto'
alias gl='git log --format="%Cgreen%h %Cred%an %Creset%s %C(3)(%ar)"'

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

source ~/.zshrc.local
