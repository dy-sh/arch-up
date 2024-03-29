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

echo -e "$HEADER Configuring nushell $HEADER"

if ! command -v nu &> /dev/null; then
    echo -e "$NOTE Nushell is not installed. Skipping."
    exit 0
fi

# nushell config
echo -e "$INFO Configuring nushell"
cp -rT nushell/config ~


echo -e "$INFO Installing dependencies"
if command -v pacman &>/dev/null; then
    # tools
    sudo pacman -S --needed --noconfirm starship zoxide broot vivid xplr dua-cli atuin
    # yazi dependencies
    sudo pacman -S --needed --noconfirm yazi ffmpegthumbnailer unarchiver jq poppler fd ripgrep fzf zoxide ouch
    # tools from aur
    yay -S --noconfirm --norebuild --noredownload --needed --quiet --mflags --skipinteg --answerdiff=None \
        carapace-bin
fi
if command -v dnf &>/dev/null; then
    # tools
    sudo dnf install -y zoxide dua-cli
    # yazi dependencies
    sudo dnf install -y jq poppler ripgrep fzf zoxide
fi

# broot
broot --install
broot --set-install-state installed
# fix for nushell
if [[ -f ~/.local/share/broot/launcher/nushell/4 ]]; then
    sed -i 's/def-env/def --env/' ~/.local/share/broot/launcher/nushell/4;
fi
if [[ -f ~/.local/share/broot/launcher/nushell/5 ]]; then
    sed -i 's/def-env/def --env/' ~/.local/share/broot/launcher/nushell/5;
fi

# atuin
mkdir -p ~/.local/share/atuin/
# nu -c "atuin init nu | save ~/.local/share/atuin/init.nu"
atuin init nu >~/.local/share/atuin/init.nu



# plugins (already installed)
# echo -e "$INFO Installing plugins"
# nu ./nushell/install_nupm.nu
# nu ./nushell/install_plugins.nu

echo -e "$WARN WARNING! Nushell will be set as default shell!"
echo -e "$WARN You can switch it back with 'sudo chsh -s /usr/bin/bash'"
user=$(whoami)
sudo chsh -s /usr/bin/nu $user

echo -e "$OK DONE"
