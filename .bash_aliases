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

# Go development
alias fresher='fresh -c fresh.conf'
alias dc="docker-compose"

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
alias serve="python3 -m http.server"

alias wba="NODE_ENV=production yb webpack -p --json > dist/webpack-stats.json && webpack-bundle-analyzer dist/webpack-stats.json dist"

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
    COMPARE="/compare/$(git rev-parse --abbrev-ref HEAD)?expand=1"

    open $GHURL$COMPARE$CWD
}

alias gh='github'

calc(){
    echo "scale=3; $@" | bc
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

atime() {
  # find the average time to run a command for n runs
  # usage: atime 5 curl https://google.com
  realtot=0
  usertot=0
  systot=0

  for ((i = 0; i < $1; i++)); do
    read real user sys <<< $({ time ${@:2}; } 2>&1 | pcregrep -o1 "\dm(\d\.\d\d\d)s")
    realtot=$(calc $realtot + $real)
    usertot=$(calc $usertot + $user)
    systot=$(calc $systot + $sys)
  done

  echo "averaging $1 runs:"
  echo "real: $(calc $realtot / $1) sec"
  echo "user: $(calc $usertot / $1) sec"
  echo "sys: $(calc $systot / $1) sec"
}

forever() {
  while "${@:1}"; do :; done
}

versions() {
  yarn info $1 --json | jq ".data.versions" -r
}

latest() {
  yarn info $1 --json | jq ".data[\"dist-tags\"].latest" -r
}

instances() {
  aws ec2 describe-instances --filter Name="tag:Name",Values="$1" | jq ".Reservations | map(.Instances[]) | map(.$2)"
}

alias xcall="/Applications/xcall.app/Contents/MacOS/xcall -url"

alias dbend=~/code/asset-bender-hubspot/packages/asset-bender-cli/bin/asset-bender
alias dev-bend=dbend

kb() {
  numfmt --format "%.2f" --to=iec --suffix=B $(stat -f%z $1)
}

cdnkb() {
  numfmt --format "%.2f" --to=iec --suffix=B $(curl "$1" --silent --write-out '%{size_download}' --output /dev/null --compressed)
}

brkb() {
  set -e
  brotli -f -o /tmp/js.br $1
  kb /tmp/js.br
}

runtimedeps () {
  bend exec mothership run runtimedep-report --parameters-file <(echo "{\"targets\": [\"$1\"]}")
}

killi () {
  docker kill `docker ps -q --filter "$1"`
}

indir () {
  pushd $1 1>/dev/null
  ${@:2}
  popd 1>/dev/null
}
