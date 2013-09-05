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

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Dumb stuff
alias fucking='sudo'
alias yolo='git add . && git commit -am "YOLO" && git push -f origin master'

# Servers
alias medved='ssh orientweb@medved'
alias bearbox='ssh -p 2200 bjacobel.com'

# Only works on OSX
alias folders='du -h -d 1'

# Django development
alias django='./manage.py'
alias celery='dj celeryd --loglevel=DEBUG --concurrency=1 -n `echo $HOSTNAME` start -B'
alias pycocide="find . -name '*.pyc' -delete"
alias herokucs='heroku run python manage.py collectstatic --noinput'

# Django development with ghetto virtualenvs
alias activate='source ./bin/activate'
alias switchenv='deactivate && activate'

# Git shortcuts
alias st='git st'
alias commit='git commit'
alias add-all='git add .'
alias add='git add'
alias push='git push origin'
alias timestamp='date +%s | pbcopy'

alias zip='zip -r9'

#Markdown editing
alias mou="open -a Mou"

# speling is hard
alias gti='git'
alias itg='git'
alias got='git'
alias fit='git'
alias tgi='git'
alias kk='ll'

# intelligent find
alias ifind='find . -name 2>/dev/null'

# Copy and show progress with pv
cpv () {
  tar cf - "$1" |  pv -s $(du -s "$1" | awk '{print $1*1000}' | awk '{printf("%d\n",$0+=$0<0?-0.5:0.5)}') | (cd "$2";tar xf -)
}

# Replace word $1 with word $2 in all files in current directory 
replace () {
  find . -type f | xargs perl -pi -e 's/$1/$2/g'
}

# COMPLETELY PURGE a file from a git repo, INCLUDING THE WORKING TREE
ungit () {
    git filter-branch --force --index-filter  'git rm --cached --ignore-unmatch "$1"' --prune-empty --tag-name-filter cat -- --all
}
