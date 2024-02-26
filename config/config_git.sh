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

echo -e "$HEADER Configuring git $HEADER"

if ! command -v git &> /dev/null; then
    echo "$INFO Installing git..."
    sudo pacman -S --needed --noconfirm git git-lfs
fi

if ! command -v gh &> /dev/null; then
    echo "$INFO Installing github-cli..."
    sudo pacman -S --needed --noconfirm github-cli
fi

echo -e "$INFO Adding Rider as diff tool..."
git config --global difftool.rider.cmd  '/usr/bin/rider diff $LOCAL $REMOTE'
git config --global mergetool.rider.cmd  '/usr/bin/rider merge $LOCAL $REMOTE'

echo -e "$INFO Adding Clion as diff tool..."
git config --global difftool.clion.cmd  '/usr/bin/clion diff $LOCAL $REMOTE'
git config --global mergetool.clion.cmd  '/usr/bin/clion merge $LOCAL $REMOTE'

echo -e "$INFO Adding 'delta' as diff tool..."
git config --global core.pager "delta"
git config --global interactive.diffFilter "delta --color-only"
git config --global delta.navigate "true"  # use n and N to move between diff sections
git config --global delta.light "false"
git config --global merge.conflictstyle "diff3"
git config --global diff.colorMoved "default"
git config --global delta.side-by-side "true" # disable to one pagge view
git config --global difftool.delta.cmd  'delta $LOCAL $REMOTE'
git config --global mergetool.delta.cmd  'delta $MERGED'

echo -e "$INFO Adding VSCode as default diff tool..."
git config --global core.editor "code --wait"
git config --global diff.tool "vscode"
git config --global merge.tool "vscode"
git config --global difftool.vscode.cmd 'code --wait --diff $LOCAL $REMOTE'
git config --global mergetool.vscode.cmd 'code --wait $MERGED'



# ----- git config
read -rep "$ACTN Do you want to configure git user name and email? [Y/n] " confirm
if [[ ! $confirm == [nN] ]]; then
    echo -e "$INFO Configuring commit message..."
    echo -e "$NOTE Current git user name: $(git config --global user.name)"
    echo -e "$NOTE Current git email    : $(git config --global user.email)"
    read -rep "$ACTN Enter new user name (leave empty for skip): " git_username
    read -rep "$ACTN Enter new email     (leave empty for skip): " git_email
    if [[ -n "$git_username" ]]; then
        git config --global user.name "$git_username"
        echo -e "$OK User name changed"
    else
        echo -e "$INFO User name not changed"
    fi
    if [[ -n "$git_email" ]]; then
        git config --global user.email "$git_email"
        echo -e "$OK Email changed"
    else
        echo -e "$INFO Email not changed"
    fi    
    echo -e "$OK Commit message configured"
fi

read -rep "$ACTN Do you want to configure github authorization? [Y/n] " confirm
if [[ ! $confirm == [nN] ]]; then
    echo "$ACTN Authorization process started... Press Ctrl+C if not required."

    if gh auth login; then
        echo -e "$OK Authorization configured"
    fi
fi

echo -e "$OK DONE"
