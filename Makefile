all: zsh

zsh:
	@echo("Installing starship")
	@echo("Ensure that a Nerd Font is installed and enabled in the terminal")
	@curl -sS https://starship.rs/install.sh | sh
	@echo("Installing zplug")
	@curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh
	ln -s zshrc $${HOME}/.zshrc
