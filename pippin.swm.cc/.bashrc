# whack out my password to the VPN and copy it to the clipboard

function parse_git_branch () {
        EMAIL=`git config --global user.email`

        if [ "$EMAIL" = "me@swm.cc" ]; then EMAIL='G'; else EMAIL='W'; fi
        git branch 2> /dev/null | sed -e '/^[^*]/d ' -e 's/* \(.*\)/ (\1) ['$EMAIL']/'
}


export JAVA_HOME=`/usr/libexec/java_home  -v 1.7`

RED="\[\033[0;31m\]"
YELLOW="\[\033[0;33m\]"
GREEN="\[\033[0;32m\]"
NO_COLOUR="\[\033[0m\]"

PS1="\[${RED}\]\t \[${GREEN}\]pippin:\[ ${GREEN}\]\W\[${NC}\]\[${YELLOW}\]\$(parse_git_branch) $NO_COLOUR\$ "
alias annoyances='ghi list'
alias phs="python -m SimpleHTTPServer"
alias nhs='http-server -p $@'
alias dev='cd ~/Development/'
alias gdev='cd ~/Development/github/'
alias copy_ssh_key="cat ~/.ssh/id_rsa.pub | pbcopy | echo 'It be in your clipboard sonny!!'"

# If you aren't on a mac then use netstat -p or something
alias op="lsof -i -P | grep -i "listen" | grep 'swm'"

# tmux 
alias ts='tmux_sessions'
alias ta='tmux attach -t'
alias tm='tmux switch -t'
alias tk='tmux kill-session -t'


# ruby
alias bi='bundle install'
alias rdm='rake db:migrate'
alias rdt='rake test'

[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"
