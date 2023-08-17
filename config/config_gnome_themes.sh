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

echo -e "$HEADER Configuring Gnome themes $HEADER"


echo -e "$INFO Installing adw-gtk3 theme"

# adw-gtk3 GTK theme
yay -S --needed --noconfirm --answerdiff=None adw-gtk3 
flatpak install -y org.gtk.Gtk3theme.adw-gtk3 org.gtk.Gtk3theme.adw-gtk3-dark
# apply theme
# gsettings set org.gnome.desktop.interface gtk-theme 'adw-gtk3-dark' 
# gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'



echo -e "$INFO Installing Nordic theme"

# make temp dir
dst=$(mktemp -d)
cd $dst

# install WhiteSur Nordic Theme
git clone https://github.com/vinceliuice/WhiteSur-gtk-theme.git --depth=1
cd WhiteSur-gtk-theme
./install.sh --nord --color Dark --opacity normal --normalshowapps -t all -l
sudo ./tweaks.sh
# apply theme
dconf write /org/gnome/shell/extensions/user-theme/name "'WhiteSur-Dark-nord'"
dconf write /org/gnome/desktop/interface/gtk-theme "'WhiteSur-Dark-nord'"
# icons
dconf write /org/gnome/desktop/interface/icon-theme "'Nordzy-dark'"

# make temp dir
dst=$(mktemp -d)
cd $dst

# install Nordzy icon pack
git clone https://github.com/alvatip/Nordzy-icon
cd Nordzy-icon/
./install.sh




echo -e "$INFO Installing othes themes"

# install other themes
if [[ -d ~/.themes/Nordic-Folders ]]; then rm -r ~/.themes/Nordic-Folders; fi # fix overwriting issue
cd "$SCRIPT_DIR"
7z x "gnome/gnome-themes.7z" -o"$HOME/.themes" -y


echo -e "$INFO Installing cursors"

# bibata cursor theme
yay -S --needed --noconfirm --answerdiff=None bibata-cursor-theme
gsettings set org.gnome.desktop.interface cursor-theme 'Bibata-Modern-Classic'
gsettings set org.gnome.desktop.interface cursor-size 22


# fonts
echo -e "$INFO Installing fonts"
sudo pacman -S --needed --noconfirm \
ttf-ubuntu-font-family \
ttf-jetbrains-mono \
ttf-roboto \

yay -S --needed --noconfirm --answerdiff=None \
ttf-ms-fonts \


gsettings set org.gnome.desktop.interface font-name 'Ubuntu 11' # default: 'Cantarell 11'
gsettings set org.gnome.desktop.interface document-font-name 'Ubuntu 11' # default: 'Cantarell 11'
gsettings set org.gnome.desktop.interface monospace-font-name 'JetBrains Mono 11'
gsettings set org.gnome.desktop.wm.preferences titlebar-font 'Ubuntu Bold 11' # default:  'Cantarell Bold 11'
# gsettings set org.gnome.desktop.interface font-antialiasing 'rgba' # default:  'grayscale'




echo -e "$OK DONE"