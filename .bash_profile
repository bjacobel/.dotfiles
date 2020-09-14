# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.shell_aliases ]; then
    . ~/.shell_aliases
fi
if [ -f ~/.shell_funcs ]; then
    . ~/.shell_funcs
fi

# Sourcing .bashrc so that I can put stuff there instead of here

if [ -f ~/.bashrc ]; then
   source ~/.bashrc
fi
eval "$(pyenv virtualenv-init -)"

# Added by nex: https://git.hubteam.com/HubSpot/nex
. ~/.hubspot/shellrc
