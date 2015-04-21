#!/usr/bin/env bash

OS=`uname`

function os_install {
	echo "OSX"
	echo "Run the following commands if you need to."
	echo "curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh"
  	echo "chsh -s /bin/zsh"
	cp aliases/.aliases $HOME/.aliases
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
