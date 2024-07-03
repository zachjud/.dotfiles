#!/bin/bash

function zsh_setup() {
	echo "Linking .zshrc"
  mkdir -p "$HOME/.config/zsh"
  ln -si -t "$HOME/.config/zsh" $(readlink -f dependencies.zsh)
  ln -si -t ${HOME} $(readlink -f .zshrc)
}

declare -A targets
targets["zsh"]=zsh_setup

for target in "$@"
do
  echo $target
  if [[ -n "${targets[$target]}" ]]; then
    ${targets[$target]}
  else
    echo "$arg is not a valid target"
  fi
done
