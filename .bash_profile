# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi


# Sourcing .bashrc so that I can put stuff there instead of here

if [ -f ~/.bashrc ]; then
   source ~/.bashrc
fi
eval "$(pyenv virtualenv-init -)"

# Added by nex: https://git.hubteam.com/HubSpot/nex
. ~/.hubspot/shellrc
