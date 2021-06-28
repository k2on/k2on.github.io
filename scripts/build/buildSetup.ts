import { getSettingsInstructions } from './settings';

export const buildSetup = (): string => {
    let file = 'echo "Setting up computer..."\n';

    const setupInstructions = getSettingsInstructions();

    file += `
# Install Homebrew
if ! command -v brew &> /dev/null
then
    echo "Installing Homebrew"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
    echo "Homebrew already installed"
fi

# Clone dotfiles repo
if [ ! -f $HOME/.cfg ]; then
    echo "Installing dotfiles"
    # Clone dotfiles repo
    git clone --bare git@github.com:k2on/dotfiles.git $HOME/.cfg
    # Install Brewfile
    echo "Installing Brewfile"
    brew bundle install --file=.config/koon/Brewfile
else
    echo "Dotfiles already installed"
fi

# Install CLI
install

# clear
printf "\${GREEN}Setup Complete!$RESET"

`;

    return file;
};
