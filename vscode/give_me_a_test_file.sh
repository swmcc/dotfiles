#!/usr/bin/env bash
# symbolic link

# Yeah this isn't perfect, far from it. PR's welcome ;)

[[ -z "$1" ]] && { echo "You need to pass in a type (elixir, ruby etc)" ; exit 1; }


type=$1
test_type=$2
basedir="/Users/swm/Code/dotfiles/vscode/$type"
file="tasks.json.standalone"

if [ $type == "elixir" ]; then 
  [[ $test_type == 'mix' ]] && file="tasks.json.mix"
elif [ $type == "ruby" ]; then
  [[ $test_type == 'rspec' ]] && file="tasks.json.rspec"
else
  echo "$type doesn't exist"
  exit 1;
fi

eval 'mkdir -p .vscode'
eval 'cp $basedir/$file .vscode/tasks.json' 
eval 'code .vscode/'
