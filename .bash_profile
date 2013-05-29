export CLICOLOR=1

export LSCOLORS=GxFxCxDxBxegedabagaced

export PATH="/usr/local/sbin:/usr/local/mysql/bin:$PATH"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# For virtualenvwrapper
export WORKON_HOME="~/Envs"
mkdir -p $WORKON_HOME
source /usr/local/bin/virtualenvwrapper.sh

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi
