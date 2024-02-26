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


./install_gnome_extensions.sh

echo -e "$HEADER Configuring Gnome extensions $HEADER"

if [[ $DESKTOP_SESSION != "gnome" ]]; then
    echo -e "$NOTE Gnome is not running. Configuring not required."
    exit
fi

if ! gnome-shell --version &> /dev/null; then
    echo -e "$OK Gnome is not installed. Configuring not required."
    exit
fi

cd gnome

# load extensions settings
input_dir="extension_settings"
dump_files=("$input_dir"/*.ini)
for dump_file in "${dump_files[@]}"; do
    extension_key=$(basename "$dump_file" | sed 's/\(.*\)\.ini/\1/') 
    dconf load "/org/gnome/shell/extensions/$extension_key/" < "$dump_file"
    echo -e "$OK Extension '$extension_key' settings loaded"
done

# load all
# dconf load /org/gnome/shell/extensions/ < gnome_extensions_settings.ini

# enable extensions
dconf write /org/gnome/shell/enabled-extensions "$(cat gnome_extensions_enabled.ini)"
dconf write /org/gnome/shell/disabled-extensions "$(cat gnome_extensions_disabled.ini)"
dconf write /org/gnome/shell/disable-user-extensions false


echo -e "$OK DONE"


# tune switcher theme
cd "$SCRIPT_DIR"
./fix_gnome_extension_switcher.sh
