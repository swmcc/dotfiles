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

[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"
