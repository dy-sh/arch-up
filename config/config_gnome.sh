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

if ! gnome-shell --version &> /dev/null; then
    echo -e "$OK Gnome is not installed. Configuring not required."
    exit
fi

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

# GTK theme
yay -S --needed --noconfirm --answerdiff=None adw-gtk3 
flatpak install -y org.gtk.Gtk3theme.adw-gtk3 org.gtk.Gtk3theme.adw-gtk3-dark
# Change the theme to adw-gtk3-dark
gsettings set org.gnome.desktop.interface gtk-theme 'adw-gtk3-dark' && gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'


# bibata cursor theme
# bug in wayland: huge cursor size in telegram
yay -S --needed --noconfirm --answerdiff=None bibata-cursor-theme
gsettings set org.gnome.desktop.interface cursor-theme 'Bibata-Modern-Classic'
gsettings set org.gnome.desktop.interface cursor-size 22

# fonts
sudo pacman -S --needed --noconfirm \
ttf-ubuntu-font-family \
ttf-jetbrains-mono \
ttf-roboto \


gsettings set org.gnome.desktop.interface font-name 'Ubuntu 11' # default: 'Cantarell 11'
gsettings set org.gnome.desktop.interface document-font-name 'Ubuntu 11' # default: 'Cantarell 11'
gsettings set org.gnome.desktop.interface monospace-font-name 'JetBrains Mono 11'
gsettings set org.gnome.desktop.wm.preferences titlebar-font 'Ubuntu Bold 11' # default:  'Cantarell Bold 11'
# gsettings set org.gnome.desktop.interface font-antialiasing 'rgba' # default:  'grayscale'

# interface scaling for xorg
sudo pacman -Rdd --noconfirm mutter
if ! yay -S --needed --noconfirm --answerdiff=None mutter-x11-scaling; then
    sudo pacman -S --needed --noconfirm mutter
fi
# interface scaling wayland 
gsettings set org.gnome.mutter experimental-features "['x11-randr-fractional-scaling','scale-monitor-framebuffer']"

# text scaling
gsettings set org.gnome.desktop.interface text-scaling-factor 1.05

echo -e "$OK DONE"