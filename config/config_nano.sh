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

echo -e "$HEADER Configuring nano $HEADER"

if ! command -v nano &> /dev/null; then
    echo -e "$NOTE nano is not installed. Skipping."
    exit 0
fi

config_file="/etc/nanorc"
if ! grep -q "^include /usr/share/nano-syntax-highlighting" "$config_file"; then
    echo "include /usr/share/nano-syntax-highlighting/*.nanorc" | sudo tee -a "$config_file" > /dev/null
    echo -e "$OK nano syntax highlighting configured."
else
    if grep -q "^include /usr/share/nano-syntax-highlighting" "$config_file"; then
        echo -e "$INFO nano syntax highlighting already configured. Skipping."
    else
        echo -e "$ERR nano syntax highlighting failed to configure."
        exit 1
    fi
fi



echo -e "$OK DONE"