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

echo -e "$HEADER Configuring btrfs $HEADER"



echo -e "$INFO Configuring grub for btrfs snapshots"

sudo pacman -S --needed --noconfirm grub-btrfs snapper snap-pac
yay -S --needed --noconfirm snap-pac-grub

# Updating grub config
sudo grub-mkconfig -o /boot/grub/grub.cfg

# Enabling btrfs snapshots in GRUB menu (every snaphot will be added automatically)
sudo systemctl enable --now grub-btrfsd

# Creating snapper config
# umount /.snapshots
# rm /.snapshots
sudo snapper -c root create-config /



echo -e "$OK DONE"