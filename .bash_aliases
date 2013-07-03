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

alias fucking='sudo'

alias medved='ssh orientweb@medved'

alias folders='du -h -d 1'

alias django='./manage.py'

alias st='git st'
alias commit='git commit'
alias add-all='git add .'
alias add='git add'
alias push='git push origin'
alias timestamp='date +%s | pbcopy'

alias compileflagsgcc='CFLAGS="-O3 -march=core2 -msse4.1 -w -pipe -arch x86_64" CXXFLAGS="-O3 -march=core2 -msse4.1 -w -pipe -arch x86_64" MAKEFLAGS="-j3"'

alias activate='source ./bin/activate'

alias switchenv='deactivate && activate'

alias zip='zip -r9'

# speling is hard
alias gti='git'
alias itg='git'
alias got='git'
alias fit='git'
alias tgi='git'

# technically not an alias, but god this helps my workflow
git() {
      if [[ $@ == "remind" ]];
      then
      	 command git diff-tree --no-commit-id --name-only -r HEAD | more;
      elif [[ $@ == "fixup" ]];
      then
         command git add . && git commit -m "fixup! just a quick fix" && git rebase -i HEAD~2 --autosquash
      else
      	 command git "$@";
      fi;
}