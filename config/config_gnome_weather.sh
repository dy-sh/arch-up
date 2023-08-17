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

echo -e "$HEADER Configuring Gnome Weather $HEADER"

if ! gnome-shell --version &> /dev/null; then
    echo -e "$OK Gnome is not installed. Configuring not required."
    exit
fi

gsettings set org.gnome.Weather locations "[<(uint32 2, <('Minsk', 'UMMM', false, [(0.94012160158674551, 0.48069277063786908)], @a(dd) [])>)>]"
gsettings set org.gnome.shell.weather locations "[<(uint32 2, <('Minsk', 'UMMM', false, [(0.94012160158674551, 0.48069277063786908)], @a(dd) [])>)>]"
gsettings set org.gnome.GWeather4 temperature-unit 'centigrade'

echo -e "$OK DONE"