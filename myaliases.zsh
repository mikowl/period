# My aliases

# turn dark mode on for specific app
# defaults write com.insomnia.app NSRequiresAquaSystemAppearance -bool no
# to get bundle identifier for an app:
# lsappinfo | grep appname 

# Easier navigation
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

alias cl="clear"
alias c="open $1 -a \"Visual Studio Code\""

alias diff="diff --color"
alias cat="bat"
# cat for images, only works in kitty terminal
alias icat="kitty +kitten icat"

# ls stuff, most are set in lib/directories.zsh
# https://the.exa.website/docs/command-line-options
#alias ls='gls --color'

alias ll="ls -la"
alias llt="exa -1 --icons --tree --git-ignore"
alias lls="exa -F --icons --color always --color-scale"
alias l='exa -l --icons --header --color always --color-scale'
alias la='exa -a -l --icons --header --color always --color-scale'
#alias la="exa --long --header --all --git --icons"
#alias lt='ls -ltrFh'   #long list,sorted by date,show type,human readable
alias lt='exa --long --header --git --icons --sort=mod'   #long list,sorted by date,show type,human readable
alias ldot='ls -ld .*' #list dot files

# Copy current directory path to keyboard
alias cwd="pwd | pbcopy"

alias l8="lsof -i :8000"
alias l81="lsof -i :8001"
# CD Shortcuts
alias d="cd ~/Documents/Dropbox"
alias dl="cd ~/Downloads"
alias dt="cd ~/Desktop"
alias docs="cd ~/Documents"
alias sites="cd ~/Sites"
alias pics="cd ~/Pictures"
alias notes="cd ~/Documents/Notes"
#alias omz="cd ~/.oh-my-zsh"
alias omzc="cd ~/.oh-my-zsh/custom"
alias jira="cd ~/Jira"

alias reactdocs="open -a '/Applications/Brave Browser.app' https://beta.reactjs.org"
alias startvm="vmrun start ~/VM/Ubuntu_20_Gatsby.vmwarevm"
alias gre="curl -X POST http://gjs.local/__refresh"
# add in vm basha:
# ENABLE_GATSBY_REFRESH_ENDPOINT=true gatsby develop --host=0.0.0.0
#alias mountlocal="mount -t nfs -o resvport,rw,nolocks 10.0.0.178:/var/www ~/Sites/vm-www"
alias mountlocal="sudo mount -t nfs -o resvport,rw,nolocks 10.0.0.210:/var/www ~/Sites/vm-www"
alias mountlocalwork="sudo mount -t nfs -o resvport,rw,nolocks 10.14.1.235:/var/www ~/Sites/vm-www"

alias vmnotes='printf "- vim ~/.ssh/config\n- hosts\n- in vm: staticip (sudo vim /etc/netplan/10-static-ip.yaml)\n- na (sudo netplan apply)\n- four finger swipe up or f3, disconnect all\n- ssh local, gjs, gd\n- mountlocal or mountlocalwork\n " | lolcat'

# Quick edit to my aliases and zshrc config
alias zshrc="vim ~/.zshrc"
alias vimrc="vim ~/.vimrc"
alias nvimrc="nvim ~/.config/nvim/lua/user/init.lua"
alias aliases="vim ~/.oh-my-zsh/custom/myaliases.zsh"
alias valiases="cat ~/.oh-my-zsh/custom/myaliases.zsh"
alias galiases="cat ~/.oh-my-zsh/plugins/git/git.plugin.zsh | grep alias"
alias kitconfig="vim ~/.config/kitty/kitty.conf"

# Reload the shell (i.e. invoke as a login shell)
alias reload="exec ${SHELL} -l && source ~/.zshrc"

# Misc
alias kara="vim ~/.config/karabiner/karabiner.json"
alias hosts="sudo vim /etc/hosts"
alias jo="jpegoptim"
alias cal="icalBuddy -b ⚡ -iep datetime,title -f 'eventsToday'"
alias today="bash ~/.oh-my-zsh/custom/today/today.zsh"
alias cre="clear && today"
alias wordle="npx inkle"

# press and hold
# defaults write org.mozilla.firefoxdeveloperedition ApplePressAndHoldEnabled -bool false

# Git
# Other git commands are available from the git plugin 
# See ~/.oh-my-zsh/plugins/git/git.plugin.zsh for the full list
alias gs='git status'
alias gl="git log --pretty=format:'%C(magenta)%h %C(cyan)%ad %C(yellow)%an%Cgreen%d %Creset%s' --date=short -n 25"
alias gl1="git log -1 --pretty=format:'%C(magenta)%B' | lolcat -F 0.017"
alias gl2="git log -2 --pretty=format:'%C(magenta)%B' | lolcat -F 0.017"
alias gl3="git log -3 --pretty=format:'%C(magenta)%B' | lolcat -F 0.017"
alias gdf='git --no-pager diff master... --name-only | lolcat -F 0.015'
# Opens changed files from last
alias fix="git diff --name-only | uniq | xargs code"
alias fix2="git diff --name-only | uniq | grep -v '\.jsx\.snap' | grep -v '\.lock' | xargs code"

# Theme Kit
alias tw='theme watch'

alias scratch='vim ~/Documents/Notes/scratch.md'


alias ag='ag --ignore-dir={node_modules,.git}'


# macos
dock-disable() {
  defaults write com.apple.dock autohide-delay -float 1000
  defaults write com.apple.dock no-bouncing -bool TRUE
  defaults write com.apple.dock orientation -string left
  killall Dock
}

dock-enable() {
  defaults delete com.apple.dock autohide-delay
  defaults write com.apple.dock no-bouncing -bool FALSE
  defaults write com.apple.dock orientation -string bottom
  killall Dock
}
function grepi() {
  grep -rli --exclude-dir={node_modules,.git} $1 .
}

# Make nested directories and file
mktouch() { 
  mkdir -p $(dirname $1) && touch $1; 
}

# Encode an svg to base64 and copy to clipboard, ex: b64 path/to/image.svg
function b64() {
  echo "data:image/svg+xml;base64," && openssl base64 < $1 | tr -d '\n' | cat $1 | openssl base64 | tr -d '\n' | pbcopy
}

function whatschanged() {
  git --no-pager diff $1... --name-only | lolcat -F 0.015
}

# Search for a word in a file, ex) peep searchterm file.php
function peep() {
  grep -B 1 -A 5 $1 $2 | pygmentize -l bash -O style=dracula
}
function srch() {
  grep -B 5 -A 5 $1 $2
}

function serve() {
  if [ $# -eq 0 ]
    then
      python -m SimpleHTTPServer 8000
  fi
  python -m SimpleHTTPServer $1
}

# misc
function wttrin() {
  curl http://wttr.in/$1
}
alias weather="curl http://wttr.in/Salinas"
alias wttr="curl -s http://wttr.in/\?format\=3"

function lastmod() {
  curl -s -I $1 | grep '^last-modified:'
}

alias ghd='open /Applications/GitHub\ Desktop.app'

# Spotify
# it's occasionally convenient to control spotify in the terminal ¯\_(ツ)_/¯
alias sp="spotify"
alias sps="spotify status | lolcat"
alias spp="spotify play"
alias sppa="spotify pause"
alias spn="spotify next"
alias sppr="spotify prev"
alias spv="spotify vol"
alias spvu="spotify vol up"
alias spvd="spotify vol down"


alias td="awk '(p+=/^\* Notes/)>1{exit} p' ~/Documents/Notes/work-notes.org | pygmentize -l lua -O style=material -f console256 -g"
#alias td2="awk '(p+=/^\* Notes/)>1{exit} p' ~/Documents/Notes/work-notes.org | highlight --syntax javascript --out-format xterm256 --force -s moria --no-trailing-nl"
alias todo="echo '🦄 org-mode notes C-x n s' && sleep 2 && emacs -nw ~/Documents/Notes/work-notes.org"
alias em="open /usr/local/Cellar/emacs-plus/26.2/Emacs.app"

#set default pygmentize style
alias pygmentize='pygmentize -O style=dracula -f console256 -g'

# Colored up cat
# pip3 install pygments (you'll need python installed, I brew install python and python 3)
# and pigments material theme: https://github.com/horosgrisa/pygments-style-material
# style located at /usr/local/lib/python2.7/site-packages/Pygments-2.3.1-py2.7.egg/pygments/styles
alias ccat='pygmentize -O style=dracula -f console256 -g'

# Pipe Highlight to less
export LESSOPEN="| $(which highlight) %s --out-format xterm256 -l --force -s moria --no-trailing-nl"
export LESS=" -R"
alias less='less -m -N -g -i -J --line-numbers --underline-special'
alias more='less'

# Always enable colored `grep` output
# Note: `GREP_OPTIONS="--color=auto"` is deprecated, hence the alias usage.
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias sgrep='grep -R -n -H -C 5 --exclude-dir={.git,.svn,CVS} '

# Enable aliases to be sudo’ed
alias sudo='sudo '

# Get week number
alias week='date +%V'

# Get macOS Software Updates, and update installed Ruby gems, Homebrew, npm, and their installed packages
alias update='sudo softwareupdate -i -a; brew update; brew upgrade; brew cleanup; npm install npm -g; npm update -g; sudo gem update --system; sudo gem update; sudo gem cleanup'

# Google Chrome
alias chrome='/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome'
alias canary='/Applications/Google\ Chrome\ Canary.app/Contents/MacOS/Google\ Chrome\ Canary'

# IP addresses
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias localip="ipconfig getifaddr en0"
alias ips="ifconfig -a | grep -o 'inet6\? \(addr:\)\?\s\?\(\(\([0-9]\+\.\)\{3\}[0-9]\+\)\|[a-fA-F0-9:]\+\)' | awk '{ sub(/inet6? (addr:)? ?/, \"\"); print }'"
alias ipv6="curl -6 -s -m 5 icanhazip.com | pbcopy && curl -6 -s -m 5 icanhazip.com | lolcat -F 0.25"

# Show active network interfaces
alias ifactive="ifconfig | pcregrep -M -o '^[^\t:]+:([^\n]|\n\t)*status: active'"

# Flush Directory Service cache
alias flush="dscacheutil -flushcache && killall -HUP mDNSResponder"
alias flushit="sudo killall -HUP mDNSResponder; sleep 2;"

# macOS has no `md5sum`, so use `md5` as a fallback
command -v md5sum > /dev/null || alias md5sum="md5"

# macOS has no `sha1sum`, so use `shasum` as a fallback
command -v sha1sum > /dev/null || alias sha1sum="shasum"

# Recursively delete `.DS_Store` files
alias cleanup="find . -type f -name '*.DS_Store' -ls -delete"

# Empty the Trash on all mounted volumes and the main HDD.
# Also, clear Apple’s System Logs to improve shell startup speed.
# Finally, clear download history from quarantine. https://mths.be/bum
alias emptytrash="sudo rm -rfv /Volumes/*/.Trashes; sudo rm -rfv ~/.Trash; sudo rm -rfv /private/var/log/asl/*.asl; sqlite3 ~/Library/Preferences/com.apple.LaunchServices.QuarantineEventsV* 'delete from LSQuarantineEvent'"

# Hide/show all desktop icons (useful when presenting)
alias hidedesktop="defaults write com.apple.finder CreateDesktop -bool false && killall Finder"
alias showdesktop="defaults write com.apple.finder CreateDesktop -bool true && killall Finder"

# URL-encode strings
#alias urlencode='python -c "import sys, urllib as ul; print ul.quote_plus(sys.argv[1]);"'
alias urldecode='python -c "import sys, urllib as ul; \
    print ul.unquote_plus(sys.argv[1])"'

alias urlencode='python -c "import sys, urllib as ul; \
    print ul.quote_plus(sys.argv[1])"'

# Merge PDF files
# Usage: `mergepdf -o output.pdf input{1,2,3}.pdf`
alias mergepdf='/System/Library/Automator/Combine\ PDF\ Pages.action/Contents/Resources/join.py'

# Intuitive map function
# For example, to list all directories that contain a certain file:
# find . -name .gitattributes | map dirname
alias map="xargs -n1"


# Print each PATH entry on a separate line
alias path='echo -e ${PATH//:/\\n}'

alias dj="curl -H 'Accept: text/plain' https://icanhazdadjoke.com/ | lolcat -F 0.017"

