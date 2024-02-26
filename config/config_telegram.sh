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

echo -e "$HEADER Configuring Telegram $HEADER"


if ! command -v telegram-desktop --help &> /dev/null
then
    echo -e "$NOTE Telegram is not installed. Skipping."
    exit 0
fi
read -rep "$ACTN Do you want to configure telegram theme? [Y/n] " confirm
if [[ ! $confirm == [nN] ]]; then
    # installing nord theme
    echo -e "$INFO Installing Nord theme"
    set +e
    xdg-open https://t.me/addtheme/nordplus
    set -e
    read -rep "$ACTN Apply theme from browser and press Enter to continue..."
fi

echo -e "$OK DONE"

## -------------- OLD ----------

# cd telegram

# # do not use apt version. is is outdated!

# # launching telegram first time will install the desktop icon

# # if command -v telegram-desktop &> /dev/null # installed from apt
# if [[ -f /opt/Telegram/Telegram ]] # installed from official binary
# then
#     # updating
#     killall Telegram &> /dev/null
#     /opt/Telegram/Updater &> /dev/null
# elif [[ -f /usr/bin/telegram-desktop ]]; then
#     /usr/bin/telegram-desktop &> /dev/null &
# elif command -v telegram-desktop &> /dev/null; then
#     telegram-desktop &> /dev/null &
# else
#     echo -e "$NOTE Telegram is not installed. Skipping."
#     exit
# fi

# # installing themes
# echo "$(pwd)/Themes" | xclip -sel clip &> /dev/null
# # xdg-open "./Themes"

# # telegram-desktop &>/dev/null & # installed from apt
# # /opt/Telegram/Telegram  # installed from official binary (started automaticaly from updater)

# echo -e "$ACTN Open Telegram and install theme manually."
# echo -e "$ACTN Themes located at: '$(pwd)/Themes'"
# echo -e "$ACTN Path stored in clipboard. Paste it in open file dialog."
# echo -e "$ACTN Go to 'Chat settings > Choose from file' and select 'theme.tdesktop-theme'"
# echo -e "$ACTN Select backgound."
# read -rep "$ACTN Press Enter to continue..."
# echo -e "$OK DONE"