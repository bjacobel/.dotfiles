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

# Dumb stuff
alias fucking='sudo'
alias yolo='git add . && git commit -am "YOLO" && git push -f origin master'

# SSH
alias shh='ssh'
alias msh='mosh'

# Only works on OSX
alias folders='du -h -d 1'
alias sub='subl'
alias atm='atom'
alias a='atom'

# Django development
alias django='./manage.py'
alias deploy='ansible-playbook ansible/deploy.yml'

# Go development
alias fresher='fresh -c fresh.conf'
alias dc="docker-compose"
alias dm="docker-machine"

# I KEEL YOU
alias origicide='find . -name "*.orig" -delete'
alias storicide='find . -name "*.DS_Store" -delete'
alias pycocide='find . -name "*.pyc" -delete'

# Django development with ghetto virtualenvs
alias activate='source ./bin/activate'
alias switchenv='deactivate && activate'

# Git shortcuts
alias st='git st'
alias commit='git commit'
alias adderall='git add --all'
alias add='git add'
alias timestamp='date +%s | pbcopy'

alias zip='zip -r9'

#Markdown editing
alias md="open -a MacDown"

# speling is hard
alias gti='git'
alias itg='git'
alias got='git'
alias fit='git'
alias tgi='git'
alias gut='git'
alias kk='ll'

# intelligent find
alias ifind='find . -name 2>/dev/null'

# command line pastes client
alias clbin="curl -F 'clbin=<-' https://clbin.com"

# Serve a folder wihtout apache
alias serve="python -m SimpleHTTPServer"

# Copy and show progress with pv
cpv () {
  tar cf - "$1" |  pv -s $(du -s "$1" | awk '{print $1*1000}' | awk '{printf("%d\n",$0+=$0<0?-0.5:0.5)}') | (cd "$2";tar xf -)
}

# COMPLETELY PURGE a file from a git repo, INCLUDING THE WORKING TREE
ungit () {
    git filter-branch --force --index-filter  'git rm --cached --ignore-unmatch "$1"' --prune-empty --tag-name-filter cat -- --all
}

google() {
    QUERY=`local IFS=" "; echo "$@";`
    open https://google.com/search?q="$QUERY"
}

go-init(){
    mkdir -p $GOPATH/src/github.com/bjacobel/$1
    ln -s $GOPATH/src/github.com/bjacobel/$1 $HOME/code/$1
    pushd $HOME/code/$1
    git init
}

github(){
    GHURL=$(git remote -v | grep "origin.*fetch" | awk '{print $2}' | sed 's/git@/http:\/\//' | sed 's/com:/com\//' | sed 's/\.git//')
    REPOROOT=$(git rev-parse --show-toplevel)
    REPOROOTESC=$(echo $REPOROOT | sed 's/\//\\\//g')
    CWD=`pwd | sed "s/$(echo $REPOROOTESC)//g"`
    TREE="/tree/$(git rev-parse --abbrev-ref HEAD)/"

    open $GHURL$TREE$CWD
}

calc(){
    bc -l <<< "$@"
}

mkcdir (){
  mkdir -p -- "$1" &&
  cd -P -- "$1"
}

nastyssh(){
  # run this after you get the infamous "IT IS POSSIBLE SOMEBODY IS DOING SOMETHING NASTY" ssh error
  sed -i "" "${1}d" /Users/bjacobel/.ssh/known_hosts
}

function title {
  echo -ne "\033]0;"$*"\007"
}