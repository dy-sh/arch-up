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
SCRIPT_DIR="$(dirname "$(realpath "$0")")"
cd "$SCRIPT_DIR" || exit 1

# ---------------------------------------------------------------------

echo -e "$HEADER Configuring yazi $HEADER"

if ! command -v yazi &> /dev/null; then
    echo -e "$NOTE yazi is not installed. Skipping."
    exit 0
fi

# utils
if command -v pacman &> /dev/null; then
    sudo pacman -S --needed --noconfirm ffmpegthumbnailer unarchiver jq poppler fd ripgrep fzf zoxide dua-cli
fi
if command -v dnf &> /dev/null; then
    sudo dnf install -y jq poppler fd-find ripgrep fzf zoxide dua-cli
fi

mkdir -p ~/.config/yazi
cp yazi/* ~/.config/yazi/

echo -e "$OK DONE"
