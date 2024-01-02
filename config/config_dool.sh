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

echo -e "$HEADER Configuring dool $HEADER"

if ! command -v dool &> /dev/null; then
    echo -e "$NOTE dstat is not installed. Skipping."
    exit 0
fi

# plugins
yay -S --mflags --skipinteg --needed --quiet --answerdiff=None --nopgpfetch --nodiffmenu --norebuild --noredownload \
	python-nvidia-ml-py

# make temp dir
dst=$(mktemp -d)
cd $dst

echo -e "$INFO Installing dool plugins"

wget https://raw.githubusercontent.com/datumbox/dstat/master/plugins/dstat_nvidia_gpu.py
sudo mv dstat_nvidia_gpu.py /usr/share/dool/dool_nvidia_gpu.py

wget https://raw.githubusercontent.com/xplorld/dstat_plugins/master/dstat_nvidia_gpu_mem.py
sudo mv dstat_nvidia_gpu_mem.py /usr/share/dool/dool_nvidia_gpu_mem.py

echo -e "$OK DONE"
