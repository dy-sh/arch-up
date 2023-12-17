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
sudo pacman -S --needed --noconfirm starship zoxide broot

# broot
broot --install
# fix for nushell
sed -i 's/def-env/def --env/' ~/.local/share/broot/launcher/nushell/4

# config
echo -e "$INFO Configuring nushell"
cp -rT nushell ~

# plugins
echo -e "$INFO Installing plugins"

# https://crates.io/crates/nu_plugin_net
cargo install nu_plugin_net
nu -c "register ~/.cargo/bin/nu_plugin_net"

# https://github.com/fdncred/nu_plugin_regex
# FAILED TO COMPILE !
# cd $(mktemp -d)
# git clone https://github.com/fdncred/nu_plugin_regex.git
# cd nu_plugin_regex
# cargo build --release
# nu -c "register ./target/release/nu_plugin_regex"

# https://github.com/Euphrasiologist/nu_plugin_plot
cd $(mktemp -d)
git clone https://github.com/Euphrasiologist/nu_plugin_plot
cd nu_plugin_plot
cargo build --release
nu -c "register $(pwd)/target/release/nu_plugin_plot"
# FAILED TO REGISTER:
# cargo install nu_plugin_plot
# nu -c "register ~/.cargo/bin/nu_plugin_plot"

# https://github.com/Trivernis/nu-plugin-dialog
# FAILED TO REGISTER !
# cargo install nu_plugin_dialog
# nu -c "register ~/.cargo/bin/nu_plugin_dialog"

# https://github.com/cptpiepmatz/nu-plugin-highlight
cargo install nu_plugin_highlight
nu -c "register ~/.cargo/bin/nu_plugin_highlight"

echo -e "$OK DONE"
