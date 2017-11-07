# VIM CONFIGURATION

## Quick Installation

`git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle`

Then in your `.vimrc`

```vimscript
set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
```

`source` the `.vimrc` file and then `:PluginInstall` inside vim

`ln -s dotfiles/vim/.vimrc .vimrc`

Good to go
