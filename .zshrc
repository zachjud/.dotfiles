# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=100000
SAVEHIST=100000
setopt autocd extendedglob
unsetopt beep nomatch notify
bindkey -v
# End of lines configured by zsh-newuser-install

# Environmental Variables
mkdir -p $HOME/.local/bin
export PATH=$HOME/.local/bin:$PATH
export EDITOR="nvim"
export VISUAL="nvim"

# Install dependencies
source ~/.config/zsh/dependencies.zsh

# Use Neovim as man pager
export MANPAGER='nvim +Man!'
export MANWIDTH=999

# Use general colorizer when available
[[ -s "/etc/grc.zsh" ]] && source /etc/grc.zsh

# Keybindings
bindkey -M viins 'jj' vi-cmd-mode

# Fancy Visual Stuff
if [ $TERM == "xterm-kitty" ] || [ $TERM == "xterm-256color" ];
then
  eval "$(starship init zsh)"
  neofetch
fi

export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# Load plugins
source ~/.zplug/init.zsh
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-history-substring-search"
zplug "zsh-users/zsh-completions"
zplug "zpm-zsh/clipboard"
zplug "zsh-users/zsh-syntax-highlighting", defer:2

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# Then, source plugins and add commands to $PATH
zplug load

# Autosuggestion plugins
ENHANCD_FILTER=fzy
ENHANCD_DISABLE_DOT=1

# Fzf integration
export FZF_DEFAULT_COMMAND='rg --hidden -l ""'
export FZF_DEFAULT_OPTS="-m --bind ctrl-a:select-all,ctrl-d:deselect-all --color=16"
source <(fzf --zsh)

# Aliases
alias fzf-preview="fzf --preview 'bat -n --color=always {}'"
alias search-package="yay -Slq | fzf --multi --preview 'yay -Si {1}' | xargs -ro sudo pacman -S"
