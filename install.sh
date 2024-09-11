#!/bin/bash

function yes_or_no {
    while true; do
        read -p "$* [y/n]: " yn
        case $yn in
            [Yy]*) return 0 ;;  
            [Nn]*) return 1 ;;
        esac
    done
}

function nvim_setup() {
  echo "Linking .config/nvim"
  ln -si -t "$HOME/.config/" $(readlink -f nvim)
  if ! command -v nvim >/dev/null 2>/dev/null; then
    echo -n "Would you like to install neovim from the latest appimage release?"
    if yes_or_no; then
      sudo apt install fuse libfuse2
      curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
      chmod u+x nvim.appimage
      sudo ln -si -T $(readlink -f nvim.appimage) /usr/bin/nvim
    fi
  fi
}

function zsh_setup() {
  echo "Linking .zshrc"
  mkdir -p "$HOME/.config/zsh"
  ln -si -t "$HOME/.config/zsh" $(readlink -f zsh/dependencies.zsh)
  ln -si -t ${HOME} $(readlink -f zsh/.zshrc)
}

function all_setup() {
  nvim_setup
  zsh_setup
}

declare -A targets
targets["all"]=all_setup
targets["nvim"]=nvim_setup
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
