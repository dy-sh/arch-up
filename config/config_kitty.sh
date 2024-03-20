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

echo -e "$HEADER Configuring Kitty $HEADER"

if command -v pacman &>/dev/null; then
	sudo pacman --noconfirm --needed -S zellij ttf-cascadia-mono-nerd ttf-jetbrains-mono
fi

if [[ -d ~/.config/kitty ]]; then
	rm -r ~/.config/kitty
fi

mkdir -p ~/.config/kitty
cp -r kitty/config/* ~/.config/kitty

# Configure font size

echo -e "$INFO Confugring font size"

if [ "$XDG_SESSION_TYPE" == "x11" ]; then
	config_file="$HOME/.config/kitty/kitty.conf"
	search_string="font_size"
	new_value="11.5"

	if grep -q "$search_string" "$config_file"; then
		sed -i "s/\($search_string[[:space:]]*\)[0-9.]\+/\1$new_value/" "$config_file"
		echo -e "$OK Value '$search_string' cnahged to '$new_value'"
	else
		echo -e "$ERR Value '$search_string' not found in '$config_file'"
	fi
else
	echo -e "Not required on wayland. Skipping."
fi

echo -e "$OK DONE"
