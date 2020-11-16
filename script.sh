echo "-- Setting up .zshrc --"

DOWNLOAD_URL="https://koon.dev/.zshrc"

curl -o "$HOME/.zshrc" -L --progress-bar $DOWNLOAD_URL

echo "-- installed .zshrc"
