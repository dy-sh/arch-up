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

echo -e "$HEADER Configuring fish $HEADER"

if ! command -v fish &> /dev/null; then
    echo -e "$NOTE Fish is not installed. Skipping."
    exit 0
fi

# prompt
sudo pacman -S --needed --noconfirm starship

# plugin manager
sudo pacman -S --needed --noconfirm fisher

# lf file manager icons
fish -c "fisher install joshmedeski/fish-lf-icons"

# utils
sudo pacman -S --needed --noconfirm zoxide broot xplr atuin
yay -S --mflags --skipinteg --needed --quiet --answerdiff=None --nopgpfetch --nodiffmenu --norebuild --noredownload \
	walk-bin

mkdir -p ~/.config/fish
cp fish/* ~/.config/fish/

echo -e "$OK DONE"
