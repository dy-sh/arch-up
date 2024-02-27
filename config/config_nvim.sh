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

echo -e "$HEADER Configuring nvim $HEADER"

if ! command -v nvim &> /dev/null; then
    echo -e "$NOTE nvim is not installed. Skipping."
    exit 0
fi

# for wayland system clipboard support
if command -v pacman &>/dev/null; then
    sudo pacman -S --needed --noconfirm wl-clipboard
fi
if command -v dnf &>/dev/null; then
    sudo dnf install -y wl-clipboard
fi


# remove cache (installed plugins, etc...)
if [[ -d ~/.local/state/nvim ]]; then rm -rf ~/.local/state/nvim; fi
if [[ -d ~/.cache/nvim ]]; then rm -rf ~/.cache/nvim; fi
if [[ -d ~/.config/nvim ]]; then rm -rf ~/.config/nvim; fi
if [[ -d ~/.local/share/nvim ]]; then rm -rf ~/.local/share/nvim; fi

mkdir -p ~/.config/nvim
cp -r nvim/* ~/.config/nvim/

sudo mkdir -p /root/.config/nvim
sudo cp -r nvim/* /root/.config/nvim/

set +e
# install plugins
echo -e "$WARN Installing nvim plugins. It is automated process. Just wait!"
nvim &
sleep 20
killall nvim || echo ""
# nvim "+Lazy install"
# install nu language highlight
nvim "+TSInstall nu" &
sleep 10
killall nvim || echo ""
set -e

echo -e "$OK DONE"
