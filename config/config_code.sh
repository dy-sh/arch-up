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

echo -e "$HEADER Configuring VSCode $HEADER"

# todo check is code installed instead of code-oss
if ! command -v code &> /dev/null; then
    echo -e "$NOTE Code is not installed. Skipping."
    exit 0
fi



echo -e "$INFO Coonfiguting settings..."

# reset settings
# if [[ -d ~/.vscode      ]]; then rm -r ~/.vscode;      fi
# if [[ -d ~/.config/Code ]]; then rm -r ~/.config/Code; fi



echo -e "$INFO Installing extensions..."
code --install-extension bonchol.nordic-vscode

set +e
killall code &> /dev/null
sleep 2
set -e

mkdir -p ~/.config/Code/User/
cp code/config/* ~/.config/Code/User/




# Check if the .desktop file exists
# if [[ ! -f "$desktop_file" ]]; then
#     echo -e "$NOTE VSCode is not installed. Skipping."
#     exit
# fi

# echo -e "$INFO Editing code.desktop file for wayland support..."

# desktop_file="/usr/share/applications/code.desktop"

# old_text="Exec=/usr/bin/code --unity-launch %F"
# new_text="Exec=/usr/bin/code --enable-features=UseOzonePlatform,WaylandWindowDecorations --ozone-platform=wayland --unity-launch %F"
# sudo sed -i "s|$old_text|$new_text|g" "$desktop_file"

# old_text="Exec=/usr/bin/code --new-window %F"
# new_text="Exec=/usr/bin/code --enable-features=UseOzonePlatform,WaylandWindowDecorations --ozone-platform=wayland --new-window %F"
# sudo sed -i "s|$old_text|$new_text|g" "$desktop_file"


echo -e "$OK DONE"