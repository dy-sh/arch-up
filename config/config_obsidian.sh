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

# echo -e "$HEADER Configuring Obsidian $HEADER"


# echo -e "$INFO Editing obsidian.desktop file for wayland support..."

# desktop_file="/usr/share/applications/obsidian.desktop"

# # Check if the .desktop file exists
# if [[ ! -f "$desktop_file" ]]; then
#     echo -e "$NOTE Obsidian is not installed. Skipping."
#     exit
# fi

# old_text="Exec=/usr/bin/obsidian --ozone-platform-hint=auto %U"
# new_text="Exec=/usr/bin/obsidian --enable-features=UseOzonePlatform,WaylandWindowDecorations --ozone-platform=wayland %U"
# sudo sed -i "s|$old_text|$new_text|g" "$desktop_file"

# old_text="Exec=/usr/bin/obsidian %U"
# new_text="Exec=/usr/bin/obsidian --enable-features=UseOzonePlatform,WaylandWindowDecorations --ozone-platform=wayland %U"
# sudo sed -i "s|$old_text|$new_text|g" "$desktop_file"

# echo -e "$OK DONE"