#!/usr/bin/env bash

OS=`uname`

function os_install {
	echo "OSX"
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
# aliases
