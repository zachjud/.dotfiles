function yes_no() {
  while true; do
    printf "[y/n] "
    read yn
    case $yn in
      [Yy]* ) return 1;;
      [Nn]* ) return 0;;
      * ) echo "Please answer yes or no";;
    esac
  done
}

function check_nerd_font {
	if ! fc-list | grep "BlexMono Nerd Font Mono" >/dev/null 2>/dev/null; then
		echo -n "Not Found, Install BlexMono Nerd Font Mono? "
    yes_no
    if (( $? == 1 )); then
		  wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/IBMPlexMono.zip
		  sudo unzip IBMPlexMono.zip -d /usr/share/fonts
    fi
	fi
}

function check_starship {
	if ! command -v starship >/dev/null 2>/dev/null; then
		echo -n "Starship Not Found, Install Starship? "
    yes_no
    if (( $? == 1 )); then
		  curl -sS https://starship.rs/install.sh | sh
    fi
  fi
}

function check_zplug {
	if [ ! -d "${HOME}/.zplug" ]; then
		echo -n "Zplug Not Found, Install Zplug? "
    yes_no
    if (( $? == 1 )); then
		  curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh
    fi
  fi
}

function check_fzf {
  if ! command -v fzf >/dev/null 2>/dev/null; then
    echo -n "fzf Not Found, Install fzf? "
    yes_no
    if (( $? == 1 )); then
      git clone --depth 1 https://github.com/junegunn/fzf.git ${HOME}/.fzf
      ${HOME}/.fzf/install --bin
    fi
  fi
}

function check_neofetch {
  if ! command -v neofetch >/dev/null 2>/dev/null; then
    echo -n "Neofetch Not Found, Install Neofetch? "
    yes_no
    if (( $? == 1 )); then
      echo "TODO: Implement Neofetch install"
    fi
  fi
}

function check_ripgrep {
  if ! command -v rg >/dev/null 2>/dev/null; then
    echo -n "Ripgrep Not Found, Install Ripgrep? "
    yes_no
    if (( $? == 1 )); then
      echo "TODO: Implement Ripgrep install"
    fi
  fi
}

check_nerd_font
check_starship
check_zplug
check_fzf
check_neofetch
check_ripgrep
