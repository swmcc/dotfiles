# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to disable command auto-correction.
# DISABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git zsh-syntax-highlighting)

# For the syntax highlighting plugin
# cd ~/.oh-my-zsh/custom/plugins
# git clone git://github.com/zsh-users/zsh-syntax-highlighting.git

source $ZSH/oh-my-zsh.sh

# User configuration

export PATH="/Users/swm/.rvm/gems/ruby-1.9.3-p362/bin:/Users/swm/.rvm/gems/ruby-1.9.3-p362@global/bin:/Users/swm/.rvm/rubies/ruby-1.9.3-p362/bin:/Users/swm/.rvm/bin:/usr/local/bin:/usr/local/sbin:/usr/local/heroku/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/local/MacGPG2/bin:/usr/local/bin/junit:/usr/local/Cellar/mysql/5.6.17/bin/:/Users/swm/.rvm/bin"
# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

alias psr='php -S localhost:1234'
alias dev='cd ~/Development/'
alias pdev='cd ~/Development/personal/'
alias wdev='cd ~/Development/work/'
alias tlf="tail -f"
alias ...='../..'
alias l='ls -altrh'
alias e="$EDITOR"
alias v="$VISUAL"

# If you aren't on a mac then use netstat -p or something
alias op="lsof -i -P | grep -i "listen" | grep 'swm'"

# tmux 
alias ts='tmux_sessions'
alias ta='tmux attach -t'
alias tm='tmux switch -t'
alias tk='tmux kill-session -t'

# python 
alias pythong='python'
alias va=". ./venv/bin/activate"
alias da="deactivate"

alias ffs="foreman start"
alias v="vim"

# FUCK SAKE
alias fgerp='fgrep'
alias grrr='find . -name "*.sw*" | xargs rm'

# MIQ stuff
alias pasdb='make heroku.staging.pulldata && make loaddata'
