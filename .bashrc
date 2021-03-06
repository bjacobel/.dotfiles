# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

# If this is an xterm set the title to user@host:dir
#case "$TERM" in
#xterm*|rxvt*)
#    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
#    ;;
#*)
#    ;;
#esac

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

############
# Most things above this line were already here / Darwin defaults.
# Most things below are custom.
############

# Make ~/Library browsable in Finder
chflags nohidden ~/Library/

# Colorize output of `ls`
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

# Pretty PS1
function _update_ps1() {
    export PYTHONIOENCODING='utf8'
    export PS1="$(powerline-shell.py --colorize-hostname $?)"
}
export PROMPT_COMMAND="_update_ps1"

# Golang
export GOPATH="$HOME/.go"

# Postgres.app
export PGHOST=/var/pgsql_socket

# Just the PATH
export PATH="/usr/local/sbin:/usr/local/bin:/usr/local/opt/curl/bin:$PATH:$HOME/.yarn/bin:$GOPATH/bin:~/code/scripts:$HOME/.jsvu"

# Git, AWS CLI, and bash completion
if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi
test -f ~/.git-completion.bash && . $_
complete -C aws_completer aws

# Add machine-specific env vars to .env file
export $(cat ~/.env | xargs)


# Put NPM_TOKEN into environment
export NPM_TOKEN=`cut -d "=" -f 2 < ~/.npmrc`

# Added by nex: https://git.hubteam.com/HubSpot/nex
. ~/.hubspot/shellrc

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
