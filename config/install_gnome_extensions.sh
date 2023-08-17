#!/bin/bash
# Copyright Dmitry Savosh (d.savosh@gmail.com)

# e - stop script if error
# u - stop script if using uninitialized variable
# set -eu 

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

echo -e "$HEADER Installing Gnome extensions $HEADER"

if ! gnome-shell --version &> /dev/null; then
    echo -e "$OK Gnome is not installed. Configuring not required."
    exit
fi


mkdir -p gnome/extensions
cd gnome



# uninstall all extensions
# set +e
# set +u 
# echo -e "$INFO Uninstalling extensions..."
# extensions=$(gnome-extensions list --enabled)
# while IFS= read -r line; do
#   uuid=$(echo "$line" | awk '{print $1}')
#   gnome-extensions disable "$uuid"
#   gnome-extensions uninstall "$uuid"
# done <<< "$extensions"
# busctl --user call org.gnome.Shell /org/gnome/Shell org.gnome.Shell Eval s 'Meta.restart("Restarting...")'
# set -eu 

if ! command -v jq &> /dev/null; then
    echo "$INFO Installing jq tool"
    # if on ubuntu/mint
    if grep -qi "linux mint" /etc/*release || grep -qi "ubuntu" /etc/*release; then
        # todo
        echo -e "$ERR Not supported distro. Add installing jq tool to the script."
        exit 1
    # if on arch
    elif grep -qi "arch linux" /etc/*release; then
        sudo pacman -S --needed --noconfirm jq
    else
        echo "$ERR Cant recognize linux distro! Only Mint, Ubuntu, Arch supported."
        exit 1
    fi
fi

# install extensions
mapfile -t array < gnome_extensions_list.txt
cd extensions
for i in "${array[@]}"
do
    if [[ -n "$i" ]]; then
        echo "$INFO Installing extension: '$i'"
        
        if [[ -f "${i}.zip" ]];then rm ${i}.zip; fi
        VERSION_TAG=$(curl -Lfs "https://extensions.gnome.org/extension-query/?search=${i}" | jq '.extensions[0] | .shell_version_map | map(.pk) | max')
        wget -q --show-progress -O ${i}.zip "https://extensions.gnome.org/download-extension/${i}.shell-extension.zip?version_tag=$VERSION_TAG"
        
        gnome-extensions install --force ${i}.zip
        if ! gnome-extensions list | grep --quiet ${i}; then
            busctl --user call org.gnome.Shell.Extensions /org/gnome/Shell/Extensions org.gnome.Shell.Extensions InstallRemoteExtension s ${i}
        fi
        
        if gnome-extensions enable ${i}; then
            echo -e "$OK Extension '${i}' installed"
        else
            echo -e "$ERR Extension '${i}' not installed"
        fi
        
        # rm ${i}.zip
    fi
done

cd ..
if [[ -d extensions ]]; then rm -r extensions; fi

echo -e "$OK DONE"