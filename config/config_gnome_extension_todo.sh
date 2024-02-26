
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

echo -e "$HEADER Configuring gnome extension 'Todo' $HEADER"

if [[ $DESKTOP_SESSION != "gnome" ]]; then
    echo -e "$NOTE Gnome is not running. Configuring not required."
    exit
fi

mkdir -p ~/Documents/Todo
touch ~/Documents/Todo/todo_done.txt
touch ~/Documents/Todo/todo_tasks.txt
dconf write /org/gnome/shell/extensions/TodoTxt/donetxt-location "'${HOME}/Documents/Todo/todo_done.txt'"
dconf write /org/gnome/shell/extensions/TodoTxt/todotxt-location "'${HOME}/Documents/Todo/todo_tasks.txt'"

echo -e "$OK DONE"