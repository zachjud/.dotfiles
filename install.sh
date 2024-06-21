#!/bin/bash

function yes_no() {
  while true; do
    read -p "[y/n]" yn
    case $yn in
      [Yy]* ) return 1;;
      [Nn]* ) return 0;;
      * ) echo "Please answer yes or no";;
    esac
  done
}

function zsh_setup() {
	echo -n "Checking for BlexMono Nerd Font Install... "
	if ! fc-list | grep "BlexMono Nerd Font Mono" >/dev/null 2>/dev/null; then
		echo -n "Not Found, Install BlexMono Nerd Font Mono? "
    yes_no
    if (( $? == 1 )); then
		  wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/IBMPlexMono.zip
		  sudo unzip IBMPlexMono.zip -d /usr/share/fonts
    fi
	else
		echo "BlexMono Nerd Font Found"
	fi

	echo -n "Checking for Starship Install... "
	if ! command -v starship >/dev/null 2>/dev/null; then
		echo -n "Not Found, Install Starship? "
    yes_no
    if (( $? == 1 )); then
		  curl -sS https://starship.rs/install.sh | sh
    fi
	else
		echo "Starship Install Found"
	fi

	echo -n "Checking for Zplug Install... "
	if [ ! -d "${HOME}/.zplug" ]; then
		echo -n "Not Found, Install Zplug? "
    yes_no
    if (( $? == 1 )); then
		  curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh
    fi
	else
		echo "Zplug Install Found"
	fi

  echo -n "Checking for fzf Install... "
  if ! command -v fzf >/dev/null 2>/dev/null; then
    echo -n "Not Found, Install fzf? "
    yes_no
    if (( $? == 1 )); then
      echo "TODO: Implement fzf install"
    fi
  else
    echo "fzf Install Found"
  fi

  echo -n "Checking for neofetch Install... "
  if ! command -v neofetch >/dev/null 2>/dev/null; then
    echo -n "Not Found, Install neofetch? "
    yes_no
    if (( $? == 1 )); then
      echo "TODO: Implement neofetch install"
    fi
  else
    echo "neofetch Install Found"
  fi

  echo -n "Checking for ripgrep Install... "
  if ! command -v ripgrep >/dev/null 2>/dev/null; then
    echo -n "Not Found, Install ripgrep? "
    yes_no
    if (( $? == 1 )); then
      echo "TODO: Implement ripgrep install"
    fi
  else
    echo "ripgrep Install Found"
  fi

	echo "Linking .zshrc"
	ln -si -t ${HOME} ${CURRENT_DIR}/.zshrc
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