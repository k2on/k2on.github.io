# Path to my oh-my-zsh installation.
export ZSH="/home/$USER/.oh-my-zsh"

# Set the theme to Spaceship
# https://github.com/denysdovhan/spaceship-prompt
ZSH_THEME="spaceship"

# Set the Spaceship settings
export SPACESHIP_CHAR_SYMBOL="λ"
export SPACESHIP_CHAR_SUFFIX=" "
# Service specific settings for Spaceship
export SPACESHIP_GCLOUD_SHOW="false"

# Format for ZSH autoseggestions
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#aaaaaa,bg=grey,underline"

# Load my plugins
plugins=(
    git
	virtualenv
	httpie
	sudo
	zsh-autosuggestions
	# nix2-cli
	kubectl
	npm
)
# Setup ZSH
source $ZSH/oh-my-zsh.sh

# Set up functions

# Bash functions

# "Make & Enter"
# Create and enter a directory
mke ()
{
	mkdir -p -- "$1" &&
		cd -P -- "$1"
}

# Set up aliases

# Bash aliases
alias cls="clear"
alias ex="exit"

# Python aliases
alias py="python3"
alias python="python3"
alias pip="pip3"

# Docker aliases
alias dkr="newgrp docker"

# Node aliases
alias ys="yarn start"
# This is for developing https://github.com/nix2.io/cli
alias ddev="yarn start --dir ./serv --debug"

# Load NVM
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# Initialize the prompt
fpath=($fpath "/home/koon/.zfunctions")
  autoload -U promptinit; promptinit
  prompt spaceship
fpath=($fpath "/home/koon/.zfunctions")

# Run pFetch
pfetch