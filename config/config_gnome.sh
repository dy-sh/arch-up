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

echo -e "$HEADER Configuring Gnome $HEADER"


# if ! gnome-shell --version &> /dev/null; then
if [[ $DESKTOP_SESSION != "gnome" ]]; then 
    echo -e "$NOTE Gnome is not running. Configuring not required."
    exit
fi

echo -e "$INFO Configuring settings"

# apperance - style: dark
gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'

# privacy - screen lock - blank screen delay: never
gsettings set org.gnome.desktop.session idle-delay 0

# touchpad - tap to click: true
gsettings set org.gnome.desktop.peripherals.touchpad tap-to-click true

# power - suspend - plugged in: 1 hour
gsettings set org.gnome.settings-daemon.plugins.power sleep-inactive-ac-timeout 3600

# power - show battery percentage: true
gsettings set org.gnome.desktop.interface show-battery-percentage true

# keyboard - input sources: english, russian
gsettings set org.gnome.desktop.input-sources sources "[('xkb', 'us'), ('xkb', 'ru')]"

# keyboard - input source switching: each window
gsettings set org.gnome.desktop.input-sources per-window true

# tweaks - windows - resize with secondary click
gsettings set org.gnome.desktop.wm.preferences resize-with-right-button true

# tweaks - windows - attach modal dialogs
gsettings set org.gnome.mutter attach-modal-dialogs false

# mutitasking - workspaces - fixed number of workspaces
gsettings set org.gnome.mutter dynamic-workspaces false

# mutitasking - workspaces - number of workspaces
gsettings set org.gnome.desktop.wm.preferences num-workspaces 4

# hide date on clock widget
gsettings set org.gnome.desktop.interface clock-show-date false

# text scaling
gsettings set org.gnome.desktop.interface text-scaling-factor 1.05

# interface scaling wayland 
# gsettings set org.gnome.mutter experimental-features "['scale-monitor-framebuffer']"


echo -e "$INFO Enabling fractional scaling"

# interface scaling for xorg
set +e
sudo pacman -Rdd --noconfirm mutter 2> /dev/null
set -eu 
if ! yay -S --noconfirm --norebuild --noredownload --needed --quiet --mflags --skipinteg --answerdiff=None mutter-x11-scaling; then
    sudo pacman -S --needed --noconfirm mutter
fi
gsettings set org.gnome.mutter experimental-features "['x11-randr-fractional-scaling','scale-monitor-framebuffer']" # wayland and x11


echo -e "$INFO Configuring GDM"

# disable wayland in GDM
# config_file="/etc/gdm/custom.conf"
# insert_string="WaylandEnable=false"
# if [ -f "$config_file" ]; then
#     if ! grep -qF "$insert_string" "$config_file"; then
#         sudo sed -i '/\[daemon\]/a '"$insert_string"'' "$config_file"
#         echo -e "$OK GDM configured to xorg by default"
#     else
#         echo -e "$INFO GDM already configured to xorg by default"
#     fi
# else
#     echo "$ERR /etc/gdm/custom.conf does not exist"
# fi


# echo -e "$INFO Enabling guestures"
# # enable guestures on xorg
# sudo gpasswd -a $USER input
# sudo pacman -S --needed --noconfirm wmctrl xdotool
# yay -S --noconfirm --norebuild --noredownload --needed --quiet --mflags --skipinteg --answerdiff=None libinput-gestures 
# libinput-gestures-setup autostart start

echo -e "$OK DONE"