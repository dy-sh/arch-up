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



echo -e "$HEADER Configuring KDE $HEADER"

if [[ $DESKTOP_SESSION != "plasma" && $DESKTOP_SESSION != "plasmawayland" ]]; then
    echo -e "$NOTE KDE Plasma is not running. Configuring not required."
    exit
fi

sudo pacman -S --needed --noconfirm rsync

echo -e "$INFO Configuring env variables"

config_file="/etc/environment"
# GTK_USE_PORTAL=1 - native filepicker
lines_to_add=(
    "GTK_USE_PORTAL=1"
)

for line_to_add in "${lines_to_add[@]}"; do
  if sudo grep -Fxq "$line_to_add" "$config_file"; then
    echo -e "$INFO Module '$line_to_add' already added."
  else
    sudo bash -c "echo '$line_to_add' >> $config_file"
    echo -e "$OK Module '$line_to_add' added."
  fi
done


echo -e "$INFO Installing plasmoids..."

rsync -a kde/plasmoids/home/ ~/



echo -e "$INFO Installing themes..."

rsync -a kde/themes/home/ ~/
dconf write /org/gnome/desktop/interface/gtk-theme "'Nordic-bluish-accent-standard-buttons'"




echo -e "$INFO Unpacking icons..."

cd ~/.local/share/icons/
for f in *.tar.gz; do tar xf "$f"; done
rm *.tar.gz
cd "$SCRIPT_DIR"

sleep 3



echo -e "$INFO Configuring settings..."
# mimeapps, keyboard layout
rsync -a kde/settings/home/ ~/
# context menu (open with vscode)
rsync -a kde/contex-menu/home/ ~/


read -rep "$ACTN Do you want to configure KDE bottom Panel? [Y/n] " confirm
if [[ ! $confirm == [nN] ]]; then
    rsync -a kde/panel/home/ ~/
fi


echo -e "$INFO Configuring KDE theme settings..."

config_file="$HOME/.config/kwinrc"

BorderSize=None
BorderSizeAuto=false
ButtonsOnLeft=M
ButtonsOnRight=IAX
library=org.kde.kwin.aurorae
theme=__aurorae__svg__Lavanda-Dark


if [ ! -f "$config_file" ]; then
    echo -e "$INFO $config_file does not exist"
fi

if ! grep -q "\[org.kde.kdecoration2\]" "$config_file"; then
    echo "[org.kde.kdecoration2]" >> "$config_file"
fi


if ! grep -q "^theme=" "$config_file"; then
    sed -i '/\[org.kde.kdecoration2\]/a theme='"$theme"'' "$config_file"
else
    sed -i '/\[org.kde.kdecoration2\]/,/^\[/ s/^theme=.*/theme='"$theme"'/' "$config_file"
fi

if ! grep -q "^library=" "$config_file"; then
    sed -i '/\[org.kde.kdecoration2\]/a library='"$library"'' "$config_file"
else
    sed -i '/\[org.kde.kdecoration2\]/,/^\[/ s/^library=.*/library='"$library"'/' "$config_file"
fi

if ! grep -q "^ButtonsOnRight=" "$config_file"; then
    sed -i '/\[org.kde.kdecoration2\]/a ButtonsOnRight='"$ButtonsOnRight"'' "$config_file"
else
    sed -i '/\[org.kde.kdecoration2\]/,/^\[/ s/^ButtonsOnRight=.*/ButtonsOnRight='"$ButtonsOnRight"'/' "$config_file"
fi

if ! grep -q "^ButtonsOnLeft=" "$config_file"; then
    sed -i '/\[org.kde.kdecoration2\]/a ButtonsOnLeft='"$ButtonsOnLeft"'' "$config_file"
else
    sed -i '/\[org.kde.kdecoration2\]/,/^\[/ s/^ButtonsOnLeft=.*/ButtonsOnLeft='"$ButtonsOnLeft"'/' "$config_file"
fi

if ! grep -q "^BorderSizeAuto=" "$config_file"; then
    sed -i '/\[org.kde.kdecoration2\]/a BorderSizeAuto='"$BorderSizeAuto"'' "$config_file"
else
    sed -i '/\[org.kde.kdecoration2\]/,/^\[/ s/^BorderSizeAuto=.*/BorderSizeAuto='"$BorderSizeAuto"'/' "$config_file"
fi

if ! grep -q "^BorderSize=" "$config_file"; then
    sed -i '/\[org.kde.kdecoration2\]/a BorderSize='"$BorderSize"'' "$config_file"
else
    sed -i '/\[org.kde.kdecoration2\]/,/^\[/ s/^BorderSize=.*/BorderSize='"$BorderSize"'/' "$config_file"
fi



echo -e "$INFO Restarting KDE..."

kquitapp5 plasmashell || killall plasmashell
kstart5 plasmashell > /dev/null 2>&1 &

echo -e "$OK DONE"
