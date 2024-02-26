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

echo -e "$HEADER Backuping Gnome extensions $HEADER"

# do not include this extensions in backup list
ignore_extensions=(
  # "hue-lights@chlumskyvaclav.gmail.com"
)

# do not backup this extensions config
ignore_extension_settings=(
  "gsconnect"
  "another-window-session-manager"
  "hue-lights"
)

# remove personalized strings
ignore_strings=(
  "recently-installed-apps="
  "pinned-app-list="
  "donetxt-location"
  "todotxt-location"
  "saved-windows="
  "launcher-stats="
)

mkdir -p gnome
cd gnome


echo -e "$INFO Saving settings"

output_dir="extension_settings"
if [[ -d $output_dir ]]; then rm -r $output_dir; fi
mkdir -p "$output_dir"
extension_list=$(dconf list /org/gnome/shell/extensions/)

for extension_key in $extension_list; do
  extension_key="${extension_key%/}" # remove / from the end of key

  if [[ " ${ignore_extension_settings[*]} " == *" $extension_key "* ]]; then
    echo -e "$INFO Extension '$extension_key' skipped (exist in ignore list)"
    continue
  fi

  # dump extension settings
  extension_dump_file="$output_dir/${extension_key}.ini" 
  dconf dump "/org/gnome/shell/extensions/$extension_key/" > "$extension_dump_file"

  # remove ignored strings
  while IFS= read -r line; do
    for ignore_string in "${ignore_strings[@]}"; do
      if [[ $line == "$ignore_string"* ]]; then
        sed -i "/^$ignore_string/d" "$extension_dump_file"
      fi
    done
  done < "$extension_dump_file"

  echo -e "$OK Extension '$extension_key' settings saved"
done

# dconf dump /org/gnome/shell/extensions/ > gnome_extensions_settings.ini

dconf read /org/gnome/shell/enabled-extensions > gnome_extensions_enabled.ini
dconf read /org/gnome/shell/disabled-extensions > gnome_extensions_disabled.ini
ls ~/.local/share/gnome-shell/extensions > gnome_extensions_list.txt

# remove ignored extensions
while IFS= read -r line; do
  for ignore_string in "${ignore_extensions[@]}"; do
    if [[ $line == "$ignore_string"* ]]; then
      sed -i "/^$ignore_string/d" "gnome_extensions_list.txt"
    fi
  done
done < "gnome_extensions_list.txt"

echo -e "$INFO Archiving extensions"
if [[ -f gnome_extensions_backup.zip ]]; then rm gnome_extensions_backup.zip; fi
7z a gnome_extensions_backup.7z ~/.local/share/gnome-shell/extensions
if [[ -d extensions ]]; then rm -r extensions; fi


echo -e "$OK DONE"

