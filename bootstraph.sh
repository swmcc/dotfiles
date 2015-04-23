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

function vim_plugins_install {
	cp vim/.vimrc $HOME/.vimrc 
	rm -fr ~/.vim/bundle/
	mkdir -p ~/.vim/autoload ~/.vim/bundle
	curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
	cd ~/.vim
	git clone https://github.com/kien/ctrlp.vim.git bundle/ctrlp.vim
	git clone https://github.com/tomtom/tlib_vim.git
 	git clone https://github.com/MarcWeber/vim-addon-mw-utils.git
	git clone https://github.com/garbas/vim-snipmate.git
	git clone https://github.com/honza/vim-snippets.git
	git clone https://github.com/bling/vim-airline ~/.vim/bundle/vim-airline
}

function brew_install {
	brew install tig
	brew install tmux
}


function os_install {
	echo "OSX"
	zsh_install
	vim_plugins_install
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

# need to install vim and my .vimrc
# need to install base utils.. 
