CURRENT_DIR := $(shell pwd)
all: zsh

zsh:
	@echo -n "Checking for BlexMono Nerd Font Install... "
	@if ! fc-list | grep "BlexMono Nerd Font Mono" >/dev/null 2>/dev/null; then \
		echo "Not Found, Installing BlexMono Nerd Font"; \
		wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/IBMPlexMono.zip; \
		sudo unzip IBMPlexMono.zip -d /usr/share/fonts; \
	else \
		echo "BlexMono Nerd Font Found"; \
	fi

	@echo -n "Checking for Starship Install... "
	@if ! command -v starship >/dev/null 2>/dev/null; then \
		echo "Not Found, Installing Starship"; \
		curl -sS https://starship.rs/install.sh | sh; \
	else \
		echo "Starship Install Found"; \
	fi
	@echo "    Ensure that fzf and neofetch are installed"

	@echo -n "Checking for Zplug Install..."
	@if [ ! -d "$${HOME}/.zplug" ]; then \
		echo "Not Found, Installing Zplug"; \
		curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh; \
	else \
		echo "Zplug Install Found"; \
	fi

	@echo "Linking .zshrc"
	@ln -si -t $${HOME} ${CURRENT_DIR}/.zshrc

