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

echo -e "$HEADER Configuring gnome terminal $HEADER"

if ! command -v gnome-terminal &> /dev/null; then
    echo -e "$NOTE gnome-terminal is not installed. Skipping."
    exit 0
fi

THEME_PROFILE_NAME="Nord"
DCONF_PROFILE_BASE_PATH=/org/gnome/terminal/legacy/profiles:
GSETTINGS_PROFILELIST_PATH=org.gnome.Terminal.ProfilesList
profile_name=
profile_uuid=





apply() {
  local \
    nord_bg="#242933" \
    nord_cursor_bg="#3B4252" \
    nord_cursor_fg="#D8DEE9" \
    nord_cyan_bright="#8FBCBB" \
    nord_black="#191D24" \
    nord_red="#BF616A" \
    nord_green="#A3BE8C" \
    nord_yellow="#EBCB8B" \
    nord_blue="#81A1C1" \
    nord_magenta="#B48EAD" \
    nord_cyan="#88C0D0" \
    nord_white="#D8DEE9" \
    nord_black_brigth="#3B4252" \
    nord_red_bright="#D06F79" \
    nord_green_bright="#B1D196" \
    nord_yellow_bright="#F0D399" \
    nord_blue_bright="#88C0D0" \
    nord_magenta_bright="#C895BF" \
    nord_cyan_bright="#93CCDC" \
    nord_white_bright="#E5E9F0" \
    nord_bg_rgb="rgb(46,52,64)" \
    nord_black_rgb="rgb(59,66,82)" \
    nord_cyan_rgb="rgb(136,192,208)" \
    nord_cursor_bg_rgb="rgb(216,222,233)" \
    nord_cursor_fg_rgb="rgb(59,66,82)" \
    nord_selection_fg_rgb="rgb(216,222,233)" \
    nord_selection_bg_rgb="rgb(111,154,167)" # 6F9AA7 OLD: nord_selection_bg_rgb="rgb(46,52,64)"

  _write palette "['$nord_black', '$nord_red', '$nord_green', '$nord_yellow', '$nord_blue', '$nord_magenta', '$nord_cyan', '$nord_white', '$nord_black_brigth', '$nord_red_bright', '$nord_green_bright', '$nord_yellow_bright', '$nord_blue_bright', '$nord_magenta_bright', '$nord_cyan_bright', '$nord_white_bright']"
  _write background-color "'$nord_bg'"
  _write foreground-color "'$nord_cursor_fg'"
  _write use-transparent-background "false"
  _write bold-color "'$nord_cursor_fg'"
  _write bold-color-same-as-fg "true"
  _write use-theme-colors "false"
  _write use-theme-background "false"
  _write use-theme-transparency "false"
  _write cursor-colors-set "true"
  _write cursor-foreground-color "'$nord_cursor_fg_rgb'"
  _write cursor-background-color "'$nord_cursor_bg_rgb'"
  _write highlight-colors-set "true"
  _write highlight-foreground-color "'$nord_selection_fg_rgb'"
  _write highlight-background-color "'$nord_selection_bg_rgb'"
}


append_profile_uuid_to_list() {
  local uuid list
  uuid="$1"
  list=$(gsettings get "$GSETTINGS_PROFILELIST_PATH" list)
  gsettings set "$GSETTINGS_PROFILELIST_PATH" list "${list%]*}, '$uuid']"
}


clone_default_profile() {
  local uuid
  uuid="$(gsettings get "$GSETTINGS_PROFILELIST_PATH" default | tr -d \')"
  profile_uuid="$(uuidgen)"
  dconf dump "$DCONF_PROFILE_BASE_PATH"/:"$uuid"/ | dconf load "$DCONF_PROFILE_BASE_PATH"/:"$profile_uuid"/
  dconf write "$DCONF_PROFILE_BASE_PATH"/:"$profile_uuid"/visible-name "'$THEME_PROFILE_NAME'"
  append_profile_uuid_to_list "$profile_uuid"
  echo -e "${OK} Default profile copied"
}


get_profiles() {
  profiles=($(gsettings get "$GSETTINGS_PROFILELIST_PATH" list | tr -d "[]\',"))
#   echo -e "${INFO} Available profile UUIDs: ${profiles[*]}"
}



get_profile_uuid_by_name() {
  local name=$1
  for idx in "${!profiles[@]}"; do
    if [[ "$(dconf read "$DCONF_PROFILE_BASE_PATH"/:"${profiles[idx]}"/visible-name)" == "'$name'" ]]; then
      printf "%s" "${profiles[idx]}"
      return 0
    fi
  done
}


_write() {
  local key="$1"
  local value="$2"
  dconf write "$DCONF_PROFILE_BASE_PATH/:$profile_uuid/$key" "$value"
}


get_profiles
if [[ ${#profiles[*]} -eq 0 ]]; then
    echo -e "${WARN} No profiles found!"
    echo -e "${ERR} There must be at least one default profile!"
    exit 1
fi


profile_uuid="$(get_profile_uuid_by_name $THEME_PROFILE_NAME)"
if [[ -n $profile_uuid ]]; then
    profile_name="$THEME_PROFILE_NAME"
    echo -e "${INFO} Updating already existing '$THEME_PROFILE_NAME' profile"
else
    clone_default_profile
fi

# apply theme
apply
dconf write /org/gnome/terminal/legacy/profiles:/default "'$profile_uuid'"

echo -e "${OK} Theme applied"

echo -e "$OK DONE"
