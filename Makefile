CURRENT_DIR := $(shell pwd)
all: zsh

zsh:
	@if ! command -v starship >& /dev/null; then \
		echo "Installing starship"; \
		echo "Ensure that a Nerd Font is installed and enabled in the terminal"; \
		curl -sS https://starship.rs/install.sh | sh; \
	fi
	@if [ ! -d "$${HOME}/.zplug" ]; then \
		echo "Installing zplug"; \
		curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh; \
	fi
	ln -si -t $${HOME} "${CURRENT_DIR}/.zshrc"

