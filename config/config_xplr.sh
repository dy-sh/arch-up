#!/bin/bash
# Copyright Dmitry Savosh (d.savosh@gmail.com)

# e - stop script if error
# u - stop script if using uninitialized variable
set -eu

# set colors
NC=$(tput sgr0)
BOLD=$(tput bold)
RED="${BOLD}$(tput setaf 1)"
GREEN="${BOLD}$(tput setaf 2)"
YELLOW="${BOLD}$(tput setaf 3)"
BLUE="${BOLD}$(tput setaf 4)"
MAGENTA="${BOLD}$(tput setaf 5)"
CYAN="${BOLD}$(tput setaf 6)"
WHITE="${BOLD}$(tput setaf 7)"
# set message tags
UP="\e[1A\e[K"
INFO="[....]"
NOTE="[${WHITE}NOTE${NC}]"
OK="[${GREEN} OK ${NC}]"
ACTN="[${CYAN}ACTN${NC}]"
WARN="[${YELLOW}WARN${NC}]"
ERR="[${RED}ERR!${NC}]"
HEADER="${BLUE}\n--------------------------------------------------------------${NC}\n"

# cd to script directory
SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && pwd)
cd "$SCRIPT_DIR" || exit

# ---------------------------------------------------------------------

echo -e "$HEADER Configuring xplr $HEADER"

if ! command -v xplr &> /dev/null; then
    echo -e "$NOTE xplr is not installed. Skipping."
    exit 0
fi

# utils
sudo pacman -S --needed --noconfirm fzf sd trash-cli pipe-rename
yay -S --noconfirm --norebuild --noredownload --needed --quiet --mflags --skipinteg --answerdiff=None \
	sfz-bin

mkdir -p ~/.config/xplr
# version="$(xplr --version | awk '{print $2}')"
# echo "version = '${version:?}'" > ~/.config/xplr/init.lua
cp xplr/* ~/.config/xplr/
touch ~/.xplr-bookmarks

sudo mkdir -p /root/.config/xplr
sudo cp xplr/* /root/.config/xplr/
sudo touch /root/.xplr-bookmarks

echo -e "$OK DONE"
