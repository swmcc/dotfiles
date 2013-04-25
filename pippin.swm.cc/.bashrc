# whack out my password to the VPN and copy it to the clipboard
alias vpn='boom secret repknightvpn'

function parse_git_branch () {
       git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

export JAVA_HOME=`/usr/libexec/java_home  -v 1.7`

RED="\[\033[0;31m\]"
YELLOW="\[\033[0;33m\]"
GREEN="\[\033[0;32m\]"
NO_COLOUR="\[\033[0m\]"

PS1="\[${RED}\]\t \[${GREEN}\]pippin:\[ ${GREEN}\]\w\[${NC}\]\[${YELLOW}\]\$(parse_git_branch) $NO_COLOUR\$ "

