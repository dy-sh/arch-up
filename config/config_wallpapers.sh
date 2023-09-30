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

echo -e "$HEADER Configuring wallpapers $HEADER"

mkdir -p ~/.wallpapers
cp wallpapers/* ~/.wallpapers

# set wallpaper
if [[ $DESKTOP_SESSION == "gnome" ]]; then 
    gsettings set org.gnome.desktop.background picture-uri "'file://$HOME/.wallpapers/plane_sunset.png'"
    gsettings set org.gnome.desktop.background picture-uri-dark "'file://$HOME/.wallpapers/plane_sunset.png'"
    gsettings set org.gnome.desktop.background picture-options "'stretched'"
    gsettings set org.gnome.desktop.screensaver picture-uri "'file://$HOME/.wallpapers/plane_sunset.png'"
    gsettings set org.gnome.desktop.screensaver picture-options "'stretched'"
# elif [[ $DESKTOP_SESSION != "plasma" && $DESKTOP_SESSION != "plasmawayland" ]]; then
#     # todo
fi


echo -e "$OK DONE"