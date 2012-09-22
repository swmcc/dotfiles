# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
        . /etc/bashrc
fi


RED='\e[1;31m'
CYAN='\e[1;36m'
YELLOW='\e[1;33m'
GREEN='\e[0;32m'
NC='\e[0m'
PS1="\[${RED}\]\t \[${GREEN}\]\h:\[ ${GREEN}\]\w \[${NC}\]$ "

alias mods='cd /usr/lib/perl5/site_perl/';
alias fuck='sudo tail_log old.swm.cc';
alias 'tail -n 50 -f /var/log/swmcc-api.log | ccze';