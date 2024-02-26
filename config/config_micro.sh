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

echo -e "$HEADER Configuring micro $HEADER"

if ! command -v micro &> /dev/null; then
    echo -e "$NOTE micro is not installed. Skipping."
    exit 0
fi

micro -plugin install fish

mkdir -p ~/.config/micro/syntax/

export user_home=$HOME
 
sudo sh -c "cat > $user_home/.config/micro/syntax/conf.yaml << EOF
filetype: conf

detect:
    filename: '(\\.(conf)$|\\.(cfg)$)'

rules:
    - constant.string:
        start: '\"'
        end: '\"'
        skip: '\\\\.'
        rules:
            - constant.specialChar: '\\\\.'

    - comment:
        start: '#'
        end: '$'
        rules:
            - todo: '(TODO|XXX|FIXME):?'
EOF"

echo -e "$OK DONE"