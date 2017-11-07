#!/usr/bin/env zsh 

OS=`uname`

function zsh_install {
	echo "Run the following commands if you need to."
	echo "curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh"
  	echo "chsh -s /bin/zsh"
	cp aliases/.aliases $HOME/.aliases
	cp zsh/.zshrc $HOME/.zshrc
	source ~/.zshrc
}


function brew_install {
	brew install tig
	brew install tmux
}


function os_install {
	echo "OSX"
	zsh_install
	brew_install
}

function main {
	case "$OS" in
	  Darwin)   os_install ;; 
	  linux*)   echo "LINUX" ;;
	  *)        echo "unknown: $OSTYPE" ;;
	esac
}

main

# need to install base utils.. 
