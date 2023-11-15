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

echo -e "$HEADER Configuring nvidia driver $HEADER"

if [ ! -f "/etc/arch-release" ]; then
    echo -e "$NOTE Distro is not Arch. Configuring not required."
    exit
fi

if ! pacman -Qs nvidia > /dev/null; then
    echo "NVIDIA driver is not installed. Configuring not required."
fi

echo -e "$INFO Creating pacman hook for nvidia driver updates..."

cd nvidia

sudo mkdir -p /etc/pacman.d/hooks

kernel_version=$(uname -r)

if [[ $kernel_version == *lts* ]]; then
    echo "Current kernel: linux-lts"
    sudo cp linux-lts/* /etc/pacman.d/hooks
else
    echo "Current kernel: linux"
    sudo cp linux/* /etc/pacman.d/hooks
fi


echo -e "$OK DONE"