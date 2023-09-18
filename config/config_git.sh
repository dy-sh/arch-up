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
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
cd "$SCRIPT_DIR" || exit

# ---------------------------------------------------------------------

echo -e "$HEADER Configuring git $HEADER"

if ! command -v git &> /dev/null; then
    echo "$INFO Installing git"
    sudo pacman -S --needed --noconfirm git git-lfs
fi

# ----- git config
echo -e "$INFO Configuring commit message..."
echo -e "$NOTE Current git user name: $(git config --global user.name)"
echo -e "$NOTE Current git email    : $(git config --global user.email)"
read -rep "$ACTN Enter new user name (leave empty for skip): " git_username
read -rep "$ACTN Enter new email     (leave empty for skip): " git_email
if [[ -n "$git_username" ]]; then
    git config --global user.name "$git_username"
    echo -e "$OK User name changed"
else
    echo -e "$INFO User name not changed"
fi
if [[ -n "$git_email" ]]; then
    git config --global user.email "$git_email"
    echo -e "$OK Email changed"
else
    echo -e "$INFO Email not changed"
fi    
echo -e "$OK Commit message configured"

if ! command -v gh &> /dev/null; then
    echo "$INFO Installing github-cli"
    sudo pacman -S --needed --noconfirm github-cli
fi


echo "$ACTN Authorizing. Press Ctrl+C if not required."

if gh auth login; then
    echo -e "$OK DONE"
fi

