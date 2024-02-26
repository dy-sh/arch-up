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

echo -e "$HEADER Configuring fish $HEADER"

if ! command -v fish &> /dev/null; then
    echo -e "$NOTE Fish is not installed. Skipping."
    exit 0
fi

if command -v pacman &>/dev/null; then
    # prompt
    sudo pacman -S --needed --noconfirm starship

    # plugin manager
    sudo pacman -S --needed --noconfirm fisher

    # utils
    sudo pacman -S --needed --noconfirm zoxide broot xplr atuin exa
    # yay -S --noconfirm --norebuild --noredownload --needed --quiet --mflags --skipinteg --answerdiff=None \
        # walk-bin
fi
if command -v dnf &>/dev/null; then
    # fisher (for fish)
    if [ -f /home/user/.config/fish/completions/fisher.fish ]; then
        rm /home/user/.config/fish/completions/fisher.fish
    fi
    cd /tmp
    curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher
    cd -
    # exa
    cargo install exa
fi

# lf file manager icons
fish -c "fisher install joshmedeski/fish-lf-icons"

mkdir -p ~/.config/fish
cp fish/* ~/.config/fish/

echo -e "$OK DONE"
