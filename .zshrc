# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path to your oh-my-zsh installation.
export ZSH="/Users/bjacobel/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"
DISABLE_AUTO_TITLE="true"

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
    git
    macos
    npm
    brew
    virtualenv
    virtualenvwrapper
)

source $ZSH/oh-my-zsh.sh

# User configuration

# Set CLICOLOR if you want Ansi Colors in iTerm2
export CLICOLOR=1

# Set colors to match iTerm2 Terminal Colors
export TERM=xterm-256color

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='nano'
else
  export EDITOR='code --no-wait'
fi

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
if [ -f ~/.shell_aliases ]; then
    . ~/.shell_aliases
fi
if [ -f ~/.shell_funcs ]; then
    . ~/.shell_funcs
fi

export $(cat ~/.env | xargs)

# Added by nex: https://git.hubteam.com/HubSpot/nex
[ -f ~/.hubspot/shellrc ] && . ~/.hubspot/shellrc

# To customize prompt, run `p10k configure` or edit ~/.dotfiles/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

bindkey "^X\\x7f" backward-kill-line

unsetopt inc_append_history
unsetopt share_history

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"


# nr1 autocomplete setup
NR1_AC_ZSH_SETUP_PATH=/Users/bjacobel/Library/Caches/newrelic-cli/autocomplete/zsh_setup && test -f $NR1_AC_ZSH_SETUP_PATH && source $NR1_AC_ZSH_SETUP_PATH;
