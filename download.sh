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


echo -e "$HEADER Arch-Up Downloader $HEADER"


echo -e "$INFO Downloading scripts..."


GITHUB_USER="dy-sh"
BRANCH="main"
HASH=""
ARCHIVE_NAME="arch-up-${BRANCH}"

while getopts "b:h:u:" arg; do
  case ${arg} in
    b)
      BRANCH="${OPTARG}"
      ARCHIVE_NAME="arch-up-${BRANCH}"
      ;;
    h)
      HASH="${OPTARG}"
      ARCHIVE_NAME="arch-up-${HASH}"
      ;;
    u)
      GITHUB_USER=${OPTARG}
      ;;
    ?)
      echo "Invalid option: -${OPTARG}."
      exit 1
      ;;
  esac
done

# set -x
if [ -n "$HASH" ]; then
  curl -sL -o "${ARCHIVE_NAME}.zip" "https://github.com/${GITHUB_USER}/arch-up/archive/${HASH}.zip"
else
  curl -sL -o "${ARCHIVE_NAME}.zip" "https://github.com/${GITHUB_USER}/arch-up/archive/refs/heads/${BRANCH}.zip"
fi


echo -e "$OK Scripts downloaded"

echo -e "$INFO Extracting..."

bsdtar -x -f "${ARCHIVE_NAME}.zip"
cd "$ARCHIVE_NAME"

chmod +x ./*.sh
chmod +x config/*.sh

echo -e "$OK Extracted"

echo -e "$INFO Executing installer..."

./install.sh
