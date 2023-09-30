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

echo -e "$HEADER Configuring KDE $HEADER"

if [[ $DESKTOP_SESSION != "plasma" ]]; then
    echo -e "$NOTE KDE Plasma is not running. Configuring not required."
    exit
fi

echo -e "$INFO Installing themes..."

cp -r kde/themes/* ~/.local/share

echo -e "$INFO Unpacking icons..."

cd ~/.local/share/icons/
for f in *.tar.gz; do tar xf "$f"; done
rm *.tar.gz
cd "$SCRIPT_DIR"

echo -e "$INFO Installing cursors..."

mkdir -p ~/.icons
cp -r kde/cursors/* ~/.icons


echo -e "$INFO Configuring options..."

cp -r kde/config/* ~/.config

echo -e "$OK DONE"