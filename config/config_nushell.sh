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
SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && pwd)
cd "$SCRIPT_DIR" || exit

# ---------------------------------------------------------------------

echo -e "$HEADER Configuring nushell $HEADER"

echo -e "$INFO Installing dependencies"
sudo pacman -S --needed --noconfirm starship zoxide broot vivid xplr
yay -S --mflags --skipinteg --needed --quiet --answerdiff=None --nopgpfetch --nodiffmenu --norebuild --noredownload \
	carapace-bin walk-bin

# broot
broot --install
broot --set-install-state installed
# fix for nushell
sed -i 's/def-env/def --env/' ~/.local/share/broot/launcher/nushell/4

# cnushell onfig
echo -e "$INFO Configuring nushell"
cp -rT nushell/config ~

# plugins (already installed)
# echo -e "$INFO Installing plugins"
# nu ./nushell/install_nupm.nu
# nu ./nushell/install_plugins.nu

echo -e "$WARN WARNING! Nushell will be set as default shell!"
echo -e "$WARN You can switch it back with 'sudo chsh -s /usr/bin/bash'"
user=$(whoami)
sudo chsh -s /usr/bin/nu $user

echo -e "$OK DONE"
