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

echo -e "$HEADER Configuring dccutil $HEADER"

if [ ! -f "/etc/arch-release" ]; then
    echo -e "$NOTE Distro is not Arch. Configuring not required."
    exit
fi

sudo mkdir -p /etc/modules-load.d

config_file="/etc/modules-load.d/i2c-dev.conf"
lines_to_add=(
    "i2c-dev"
)

for line_to_add in "${lines_to_add[@]}"; do
  if sudo grep -Fxq "$line_to_add" "$config_file"; then
    echo -e "$INFO Module '$line_to_add' already added."
  else
    sudo bash -c "echo '$line_to_add' >> $config_file"
    echo -e "$OK Module '$line_to_add' added."
  fi
done



echo -e "$OK DONE"