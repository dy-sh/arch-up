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

echo -e "$HEADER Configuring pacman $HEADER"

if [ ! -f "/etc/arch-release" ]; then
    echo -e "$NOTE Distro is not Arch. Configuring not required."
    exit
fi

config_file="/etc/pacman.conf"

if grep -q "#\[multilib\]" "$config_file" && grep -q "#Include = /etc/pacman.d/mirrorlist" "$config_file"; then
    sudo sed -i '/#\[[mM]ultilib\]/{n;s/^#//}' "$config_file"
    sudo sed -i '/#\[[mM]ultilib\]/s/^#//' "$config_file"
    sudo pacman -Sy
    echo -e "$OK 32 bit apps repository added."
else
    if grep -q "[multilib]" "$config_file"; then
        echo -e "$INFO 32 bit apps repository already added. Skipping."
    else
        echo -e "$ERR Failed to add 32 bit apps repository."
        exit 1
    fi
fi

echo "$config_file"

# ParallelDownloads=5
# if ! grep -q "^ParallelDownloads =" "$config_file"; then
#     sudo sed -i '/\[options\]/a ParallelDownloads = '"$ParallelDownloads"'' "$config_file"
# else
#     sudo sed -i '/\[options\]/,/^\[/ s/^ParallelDownloads = .*/ParallelDownloads = '"$ParallelDownloads"'/' "$config_file"
# fi

if grep -q "#ParallelDownloads" "$config_file"; then
    sudo sed -i 's/#ParallelDownloads/ParallelDownloads/' "$config_file"
    echo -e "$OK Parallel downloads support added."
else
    if grep -q "ParallelDownloads" "$config_file"; then
        echo -e "$INFO Parallel downloads support already added. Skipping."
    else
        echo -e "$ERR Failed to add parallel downloads support."
        exit 1
    fi
fi

if grep -q "#Color" "$config_file"; then
    sudo sed -i 's/#Color/Color/' "$config_file"
    echo -e "$OK Color support added."
else
    if grep -q "Color" "$config_file"; then
        echo -e "$INFO Color support already added. Skipping."
    else
        echo -e "$ERR Failed to add color support."
        exit 1
    fi
fi

echo -e "$OK DONE"