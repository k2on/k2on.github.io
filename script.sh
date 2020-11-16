# Welcome myself!
name="$(tr '[:lower:]' '[:upper:]' <<< ${USER:0:1})${USER:1}"
echo ""
echo "🚀 Welcome $name!"
echo ""

# ZSH setup
echo "Downloading your ZSH profile"

# Set the download URL
DOWNLOAD_URL="https://koon.dev/zshrc.sh"

# Download the profile to the .zshrc file
curl -o "$HOME/.zshrc" -L --progress-bar $DOWNLOAD_URL

echo "ZSH profile set up!"

# Success
echo ""
echo "✨ All done!"

exit 0