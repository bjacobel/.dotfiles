alias bearbox='ssh -p 2200 bjacobel.com'

alias yolo='git add -u && git commit -m "fuck it, we`ll do it live" && git push origin master'

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

alias webdev='sudo php-fpm && sudo nginx'

alias fucking='sudo'

alias medved='ssh orientweb@medved'

alias sizes='du -h -d 1'

alias django='./manage.py'

alias st='git st'
alias commit='git commit -m'
alias addall='git add .'
alias push='git push origin'