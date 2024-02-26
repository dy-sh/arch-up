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

# editing snapper config
if [ $(id -u) -ne 0 ]; then
    echo "This script must be run as root."
    exec sudo "$0" "$@"
fi


echo -e "$INFO Configuring grub for btrfs snapshots"

sudo pacman -S --needed --noconfirm snapper grub-btrfs inotify-tools

# Installing snap-pac (tool for auto creating snapshots when new pacman package installed)
# sudo pacman -S --needed --noconfirm snap-pac
# yay -S --mflags --skipinteg --needed --quiet --answerdiff=None --nopgpfetch --nodiffmenu --norebuild --noredownload \
# snap-pac-grub


# Updating grub config
sudo grub-mkconfig -o /boot/grub/grub.cfg

# Enabling btrfs snapshots in GRUB menu (every snaphot will be added automatically)
sudo systemctl enable --now grub-btrfsd

# Creating snapper config
config_count=0
if [ -d "/etc/snapper/configs" ]; then
    configs_count=$(find /etc/snapper/configs -type f | wc -l)
fi

if [ "$configs_count" -eq 0 ]; then
    echo -e "$INFO Snapper configuration does not exist. Creating new one..."
    if [ -d "/.snapshots" ]; then
        sudo umount /.snapshots
        sudo rm -r /.snapshots
    fi
    sudo snapper -c root create-config /
    sudo mount -a
    echo -e "$OK Snapper configuration created"
else
    echo -e "$OK Snapper configuration already exists"
fi



# New values
NEW_TIMELINE_LIMIT_HOURLY="5"
NEW_TIMELINE_LIMIT_DAILY="7"
NEW_TIMELINE_LIMIT_WEEKLY="0"
NEW_TIMELINE_LIMIT_MONTHLY="0"
NEW_TIMELINE_LIMIT_YEARLY="0"

CONFIG_FILE="/etc/snapper/configs/root"

# Check if the file exists
if [ ! -f "$CONFIG_FILE" ]; then
    echo "File $CONFIG_FILE does not exist."
    exit 1
fi

# Update the values
sed -i "s/^TIMELINE_LIMIT_HOURLY=.*/TIMELINE_LIMIT_HOURLY=\"$NEW_TIMELINE_LIMIT_HOURLY\"/" "$CONFIG_FILE"
sed -i "s/^TIMELINE_LIMIT_DAILY=.*/TIMELINE_LIMIT_DAILY=\"$NEW_TIMELINE_LIMIT_DAILY\"/" "$CONFIG_FILE"
sed -i "s/^TIMELINE_LIMIT_WEEKLY=.*/TIMELINE_LIMIT_WEEKLY=\"$NEW_TIMELINE_LIMIT_WEEKLY\"/" "$CONFIG_FILE"
sed -i "s/^TIMELINE_LIMIT_MONTHLY=.*/TIMELINE_LIMIT_MONTHLY=\"$NEW_TIMELINE_LIMIT_MONTHLY\"/" "$CONFIG_FILE"
sed -i "s/^TIMELINE_LIMIT_YEARLY=.*/TIMELINE_LIMIT_YEARLY=\"$NEW_TIMELINE_LIMIT_YEARLY\"/" "$CONFIG_FILE"

echo "File $CONFIG_FILE updated successfully."


echo -e "$INFO Enabling snapper timers..."
sudo systemctl enable --now snapper-timeline.timer
sudo systemctl enable --now snapper-cleanup.timer

echo -e "$OK DONE"