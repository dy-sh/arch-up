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

echo -e "$HEADER Configuring Gnome themes $HEADER"

# make temp dir
dst=$(mktemp -d)
cd $dst

# install WhiteSur Nordic Theme
git clone https://github.com/vinceliuice/WhiteSur-gtk-theme.git --depth=1
cd WhiteSur-gtk-theme
./install.sh --nord --color Dark --opacity normal --normalshowapps -t all
sudo ./tweaks.sh
dconf write /org/gnome/shell/extensions/user-theme/name "'WhiteSur-Dark-nord'"
dconf write /org/gnome/desktop/interface/gtk-theme "'WhiteSur-Dark-nord'"


# make temp dir
dst=$(mktemp -d)
cd $dst

# install Nordzy icon pack
git clone https://github.com/alvatip/Nordzy-icon
cd Nordzy-icon/
./install.sh

# install other themes
cd "$SCRIPT_DIR" || exit
7z x "gnome/gnome-themes.7z" -o"$HOME/.themes"


echo -e "$OK DONE"