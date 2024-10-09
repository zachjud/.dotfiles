# Check if the terminal is Kitty
if [[ $TERM == "xterm-kitty" ]]; then
    alias ssh="kitten ssh"
fi
if grep -qE 'Arch Linux' /etc/issue; then
    alias search-package="yay -Slq | fzf --multi --preview 'yay -Si {1}'"
fi
if grep -qE 'Debian' /etc/issue; then
    alias search-package="apt-cache search . | fzf --multi --preview 'apt show {1}'"
fi

