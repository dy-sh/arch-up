#!/bin/bash
# Copyright Dmitry Savosh (d.savosh@gmail.com)


main_cli=(          # ---------- MAIN CLI TOOLS -------------
    arch-wiki-docs  # arch wifi offline (html version)
    arch-wiki-lite  # arch wifi offline (CLI version)
    aria2           # download manager (HTTP, FTP, BitTorrent)
    axel            # download manager
    bat             # display file content with colors (cat alternative)
    btop            # system monitor (htop alternative)
    ccze            # log viewver with colors
    cdrtools        # mkisofs tool for creating iso images
    cmake           # code compile and build tool
    curl            # http requests and download manager
    d-feet          # d-bus debugger (for automation)
    duf             # disk usage/dree info (df alternative)
    exa             # list files (ls alternative)
    exfat-utils     # utilities for exFAT file system
    fd              # find files (find command alternaive)
    fish            # user friendly shell (bash alternative)
    flatpak         # application distribution system (pacman alterative)
    freerdp         # remote desktop protocol (RDP)
    gcc             # c/c++ compiler
    git             # version control system
    ripgrep         # grep alternative
    gnome-keyring   # stores passwords and encryption keys
    gwakeonlan      # utility to awake machines using the Wake on LAN
    gparted         # partition manager 
    htop            # system monitor
    iftop           # network usage monitor
    inotify-tools   # watch file system changes in realtime
    inxi            # system information
    lazygit         # terminal UI for git
    lf              # file manager (ranger alternative)
    lsd             # list files (ls alternative)
    man-db          # manual for commands (man)
    micro           # text editor
    nano            # text editor
    nano-syntax-highlighting # syntax highlighting for nano
    ncdu            # disk usage monitor (du alternative)
    neofetch        # system information
    neovim          # text editor (nvim, fork of vim)
    nethogs         # network usage monitor
    ninja           # code compile and build tool
    nmap            # tool for showing open ports
    ntfs-3g         # NTFS filesystem driver and utilities
    nvtop           # GPU usage monitor
    p7zip           # archiver
    pv              # monitoring the progress of data through a pipeline
    python-pip      # tool for installing python packages
    ranger          # file manager
    rsync           # file copying and backup tool
    samba           # SMB fileserver
    tldr            # manual for commands (man alternative)
    traceroute      # network route tracking tool
    tree            # directory listing
    unrar           # archiver
    vim             # text editor
    wget            # download manager
    xbindkeys       # launch commands with keyboard/mouse (for X11)
    xclip           # tool for clipboard (for X11)
    xdotool         # automation tool (for X11)
    xsel            # tool for get/set the contents of selection (for X11)
    zsh zsh-autosuggestions zsh-completions zsh-history-substring-search zsh-syntax-highlighting zsh-theme-powerlevel10k zshdb # user friendly shell (bash alternative)
    ttf-ubuntu-font-family ttf-jetbrains-mono ttf-roboto # most used fonts
    ttf-nerd-fonts-symbols ttf-nerd-fonts-symbols-mono   # requred fonts with icons
)
main_cli_aur=(      # ---------- MAIN CLI TOOLS FROM AUR-------------
    preload         # run applications faster by prefetching binaries
    xrdp            # remote desktop protocol (RDP) server 
    wsdd            # web service discovery (WSD) daemon for SMB/Samba
)


main_apps=(         # ---------- MAIN GUI APPS -------------
    alacritty       # lightweight terminal
    gnome-terminal       # terminal
    dconf-editor    # gsettings editor (for GNOME apps)
    gnome-clocks    # timer, stopwatch, clock
    keepassxc       # password manager
    veracrypt       # encryption tool
)
main_apps_aur=(     # ---------- MAIN APPS FROM AUR -------------
    downgrade       # bash script for downgrading packages to a version in cache
    # timeshift     # GUI for disk snapshots
)


gnome=(             # ---------- GNOME TOOLS -------------
    gnome-browser-connector # browser integration with extensions.gnome.org
    gnome-tweaks            # GNOME 3 settings (Tweak Tool)
)
gnome_aur=(         # ---------- GNOME TOOLS FROM AUR -------------
    extension-manager       # GNOME 3 extension manager
)


text=(              # ---------- TEXT EDITORS AND TOOLS -------------
    libreoffice-fresh # office apps
    obsidian        # note taking app
    espeak-ng       # text to speach (TTS)
    festival festival-us #  text to speach (TTS)
    zathura zathura-pdf-mupdf # simple pdf viewer
)
text_aur=(          # ---------- TEXT EDITORS FROM AUR -------------
    typora          # markdown editor
    festvox-ru      # text to speach (TTS)
)





internet=( # ---------- INTERNET APPS -------------
    uget            # download manager
    yt-dlp          # download video from youtube
    deluge-gtk      # bittorrent client
    qbittorrent     # bittorrent client
    firefox         # web browser
    opera           # web browser with integrated VPN
    thunderbird     # email clint
    telegram-desktop # messenger
    discord         # messenger
    krdc            # remote desktop client (RPD)
    remmina         # remote desktop client (VNC/RPD/temviewer/rustdesk and more)
    moserial        # serial terminal
    putty           # terminal for ssh/telent/serial
    cool-retro-term # terminal emulator which old cathode display
    filezilla       # ftp client
    tgpt-bin        # chat-gpt in terminal
    # moonlight-qt sunshine # fast remote desktop client/server for nvidia GPU
    # opensnitch    # firewall
    # haguichi      # hamachi client 
)
internet_aur=(      # ---------- INTERNET APPS FROM AUR -------------
    uget-integrator # integrate uget download manager with browser
    pcloud-drive    # file storage cloud
)



audio_players=(     # ---------- AUDIO PLAYERS AND TOOLS -------------
    quodlibet       # audio player
    flac            # flac audio codec
)
audio_players_aur=( # ---------- AUDIO PLAYERS AND TOOLS FROM AUR -------------
    puddletag       # audio tag editor
    spotify         # music streaming client
)


audio_editors=(     # ---------- AUDIO EDITORS -------------
    audacity        # audio editor
    reaper          # audio editor
)
audio_editors_aur=( # ---------- AUDIO EDITORS FROM AUR -------------
)


video_players=(     # ---------- VIDEO PLAYERS -------------
    mpv             # video player
    vlc             # video player
    totem           # video player
    gst-libav       # codecs for totem and gthumb
    playerctl       # CLI for players (vlc and other)
)
video_players_aur=(         # ---------- VIDEO PLAYERS FROM AUR -------------
    vlc-pause-click-plugin  # vlc plugin 
    vlc-bittorrent          # vlc plugin 
    vlc-materia-skin-git    # vlc theme
)


video_editors=(     # ---------- VIDEO EDITORS -------------
    kdenlive        # video editor
    handbrake       # video converter
    obs-studio      # screen recording (powerful)
    peek            # screen recording (simple)
)
video_editors_aur=( # ---------- VIDEO EDITORS FROM AUR -------------
    losslesscut-bin # lossless video cut
)


picture_viewers=(   # ---------- PICTURE VIEWERS -------------
    gthumb          # picture viewer
)
picture_viewers_aur=( # ---------- PICTURE VIEWERS FROM AUR -------------
    xnviewmp        # picture viewer
)

graphics_editors=(  # ---------- GRAPHICS EDITORS AND SCREENSHOTING TOOLS -------------
    flameshot       # screenshot tool
    shutter         # screenshot tool
    gimp            # graphics editor
    krita           # graphics editor
)
graphics_editors_aur=( # ---------- GRAPHICS EDITORS AND SCREENSHOTING TOOLS FROM AUR -------------

)


disk=(              # ---------- DISK TOOLS -------------
    unison          # file synchronization and backup tool
    fdupes          # find file duplicates
    catfish         # find files
    kfind           # find files
    bleachbit       # deletes unneeded files to free disk space
    ##### THUNAR FIlE MANAGER ###########
    thunar                      # fast file manager from XFCE
    thunar-archive-plugin      
    thunar-media-tags-plugin   
    thunar-volman              
    ##### NEMO FIlE MANAGER ##############
    nemo                        # file manager from Cinnamon
    nemo-audio-tab            
    nemo-fileroller           
    nemo-image-converter      
    nemo-preview              
    nemo-seahorse             
    nemo-share                
    ##### NAUTILUS FIlE MANAGER ###########
    nautilus                    # file manager from Gnome
    nautilus-image-converter   
    nautilus-share             
    python-nautilus            
    seahorse-nautilus          
    sushi                   
)
disk_aur=(          # ---------- DISK TOOLS FROM AUR -------------
    czkawka-gui czkawka-cli # find duplicates
    freefilesync-bin        # file synchronization and backup tool
    ##### THUNAR FIlE MANAGER ###########
    # thunar-vcs-plugin
    thunar-shares-plugin
    ##### NEMO FIlE MANAGER ##############
    # nemo-media-columns   
    # nemo-mediainfo-tab   
    # nemo-meld-compare    
    # nemo-run-with-nvidia 
    # nemo-compare         
    ##### NAUTILUS FIlE MANAGER ###########
    nautilus-admin-gtk4  
    # nautilus-code      
    # nautilus-copy-path 
    # nautilus-compare   
    ##### broken nautilus plugins: nautilus-renamer nautilus-metadata-editor nautilus-empty-file nautilus-mediainfo folder-color-nautilus nautilus-columns-git archive-mount-nautilus-git

)



vm=(                # ---------- VIRTUAL MACHINES -------------
    qemu-full virt-manager virt-viewer dnsmasq net-tools # qemu
    # qemu additional packages:  vde2 bridge-utils openbsd-netcat dmidecode ebtables iptables archlinux-keyring
)


gaming=(            # ---------- GAMING -------------
# add 32 bit repo (multilib) to install steam
    steam           # steam client
    lutris          # run windows apps and games
)
gaming_aur=( # ---------- GAMING FROM AUR -------------
    protonup-qt-bin # wine fork (libs for running windows apps and games)
)


dev=(               # ---------- DEV TOOLS -------------
    blender
    glade
    httpie
    jdk-openjdk
    meld
    nodejs
    npm
    pycharm-community-edition
    qtcreator
)
dev_aur=(           # ---------- DEV TOOLS FROM AUR -------------
    visual-studio-code-bin
    clion
    gitfiend
    github-desktop-bin
    gittyup
    rider
    smartgit
    webstorm
)



hardware=(          # ---------- HARDWARE TOOLS AND DRIVERS -------------
    # intel-ucode     # microcode for Intel CPU
    # amd-ucode       # microcode for AMD CPU
    pavucontrol     # volume control mixer and audio device settings
    bluez blueman bluez-utils # bluetooth support
    joyutils        # joystick tweaking
    psensor         # graphical hardware temperature monitoring
    barrier         # share mouse between devices
    nvme-cli        # nvmi ssd tools
    smartmontools   # SMART info, SSD temperature sensors 
    ddcutil         # HDMI/DP display brightness control (not for notebooks)
    i2c-tools       # requred for ddcutil
    iperf           # benchmark network
    speedtest-cli   # benchmark internet
    kdiskmark       # benchmark disks
    mangohud        # FPS monitoring overlay
    # powertop        # power management tool (consumption monitorring and sleep tweaks)
    # cups cups-pdf print-manager # printer support
    # imwheel         # mouse wheel tuning
)
hardware_aur=(      # ---------- HARDWARE TOOLS AND DRIVERS FROM AUR -------------
    auto-cpufreq    # automatic CPU freq optimizer
    cpulimit        # limit cpu usage of a process 
    input-remapper-git # binding mouse buttons (to audio volume control for example)
    geekbench       # benchmark disks
    geekbench5      # benchmark disks
    geekbench4      # benchmark disks
)

nvidia=(            # ---------- NVIDIA GPU DRIVERS -------------
    nvidia          # nvidia drivers for linux kernel      (preinstalled by installer)
    # nvidia-lts    # nvidia drivers for linux-lts kernel  (preinstalled by installer)
    # nvidia-dkms   # nvidia drivers for all other kernels (preinstalled by installer)
    nvidia-settings # nvidia settins app

)
nvidia_aur=(        # ---------- NVIDIA GPU DRIVERS FROM AUR -------------
    gwe             # tweaking nvidia GPU
)


nvidia_optimus=(    # ---------- NVIDIA OPTIMUS -------------

)

nvidia_optimus_aur=( # ---------- NVIDIA OPTIMUS FROM AUR -------------
    supergfxctl
)


android=(           # ---------- ANDROID INTEGRATION TOOLS -------------
    kdeconnect      # communication between Linux and smartphone
    scrcpy          # display and control your Android device
)
android_aur=(       # ---------- ANDROID INTEGRATION TOOLS FROM AUR -------------
    
)


asus_notebooks=(    # ---------- ASUS NOTEBOOKS TOOLS -------------
    gnome-power-manager # power monitoring tool
    # tlp           # power management tool (conflicted with rog-control-center)
)
asus_notebooks_aur=( # ---------- ASUS NOTEBOOKS TOOLS FROM AUR -------------
    rog-control-center # ASUS notebooks management tool
    # tlpui         # GUI for tlp (conflicted with rog-control-center)
)


iot=(               # ---------- IOT TOOLS -------------

)
iot_aur=(           # ---------- IOT TOOLS FROM AUR -------------
    lgtv-git        # remote control LG TV
    # hypernion     # philips hue ambilight 
)




# ---------------------------------------------------------------------

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

echo -e "$HEADER Arch-Up Installer $HEADER"


# udpdate repository database
echo -e "$INFO Updating repository..."
sudo pacman -Sy
echo -e "$OK Repository updated"


echo -e "$INFO Installing dependencies..."
sudo pacman --noconfirm --needed -S dialog
echo -e "$OK Dependencies installed"


cmd=(dialog --clear --separate-output --checklist "Select software to install (use Space key):" 26 86 16)
dialog_options=(
    1 "Main CLI tools" on
    2 "Main GUI apps" on
    3 "Gnome tools" on
    4 "Text editors and office" on
    5 "Inernet and network apps" on
    6 "Audio players" on
    7 "Audio editors" on
    8 "Video players" on
    9 "Video editors" on
    10 "Picture viewers" on
    11 "Graphic editors and screenshoting tools" on
    12 "Disk utils" on
    13 "Virtual machines" on
    14 "Gaming" on
    15 "Dev utils" on
    16 "Unreal Engine" off
    17 "General hardware tools" on
    18 "NVIDIA drivers" off
    19 "NVIDIA Optimus" off
    20 "Android integration tools" off
    21 "ASUS Notebooks tools" off
    22 "IOT tools" off
    )
install_soft_choises=$("${cmd[@]}" "${dialog_options[@]}" 2>&1 >/dev/tty)
clear

cmd=(dialog --clear --separate-output --checklist "Select options:" 26 86 16)
dialog_options=(
    1 "Update all installed packages before install (recommended)" on
    2 "Install packages from Appstream (pacman)" on
    3 "Install packages from AUR (yay)" on
    4 "Enable installed services" on
    5 "Configure all apps" on
    6 "Reboot when finished (recomended)" on
    )
options_choises=$("${cmd[@]}" "${dialog_options[@]}" 2>&1 >/dev/tty)
clear

apps_to_install=() 

if echo "$options_choises" | grep -qw 2; then
    for choice in $install_soft_choises
    do
        case $choice in
            1) apps_to_install=("${apps_to_install[@]}" "${main_cli[@]}");;
            2) apps_to_install=("${apps_to_install[@]}" "${main_apps[@]}");;
            3) apps_to_install=("${apps_to_install[@]}" "${gnome[@]}");;
            4) apps_to_install=("${apps_to_install[@]}" "${text[@]}");;
            5) apps_to_install=("${apps_to_install[@]}" "${internet[@]}");;
            6) apps_to_install=("${apps_to_install[@]}" "${audio_players[@]}");;
            7) apps_to_install=("${apps_to_install[@]}" "${audio_editors[@]}");;
            8) apps_to_install=("${apps_to_install[@]}" "${video_players[@]}");;
            9) apps_to_install=("${apps_to_install[@]}" "${video_editors[@]}");;
            10) apps_to_install=("${apps_to_install[@]}" "${picture_viewers[@]}");;
            11) apps_to_install=("${apps_to_install[@]}" "${graphics_editors[@]}");;
            12) apps_to_install=("${apps_to_install[@]}" "${disk[@]}");;
            13) apps_to_install=("${apps_to_install[@]}" "${vm[@]}");;
            14) apps_to_install=("${apps_to_install[@]}" "${gaming[@]}");;
            15) apps_to_install=("${apps_to_install[@]}" "${dev[@]}");;
            # 16) UNREAL ENGINE
            17) apps_to_install=("${apps_to_install[@]}" "${hardware[@]}");;
            18) apps_to_install=("${apps_to_install[@]}" "${nvidia[@]}");;
            19) apps_to_install=("${apps_to_install[@]}" "${nvidia_optimus[@]}");;
            20) apps_to_install=("${apps_to_install[@]}" "${android[@]}");;
            21) apps_to_install=("${apps_to_install[@]}" "${asus_notebooks[@]}");;
            22) apps_to_install=("${apps_to_install[@]}" "${iot[@]}");;
        esac
    done
fi

if echo "$options_choises" | grep -qw 3; then
    for choice in $install_soft_choises
    do
        case $choice in
            1) apps_to_install=("${apps_to_install[@]}" "${main_cli_aur[@]}");;
            2) apps_to_install=("${apps_to_install[@]}" "${main_apps_aur[@]}");;
            3) apps_to_install=("${apps_to_install[@]}" "${gnome_aur[@]}");;
            4) apps_to_install=("${apps_to_install[@]}" "${text_aur[@]}");;
            5) apps_to_install=("${apps_to_install[@]}" "${internet_aur[@]}");;
            6) apps_to_install=("${apps_to_install[@]}" "${audio_players_aur[@]}");;
            7) apps_to_install=("${apps_to_install[@]}" "${audio_editors_aur[@]}");;
            8) apps_to_install=("${apps_to_install[@]}" "${video_players_aur[@]}");;
            9) apps_to_install=("${apps_to_install[@]}" "${video_editors_aur[@]}");;
            10) apps_to_install=("${apps_to_install[@]}" "${picture_viewers_aur[@]}");;
            11) apps_to_install=("${apps_to_install[@]}" "${graphics_editors_aur[@]}");;
            12) apps_to_install=("${apps_to_install[@]}" "${disk_aur[@]}");;
            13) apps_to_install=("${apps_to_install[@]}" "${vm_aur[@]}");;
            14) apps_to_install=("${apps_to_install[@]}" "${gaming_aur[@]}");;
            15) apps_to_install=("${apps_to_install[@]}" "${dev_aur[@]}");;
            # 16) UNREAL ENGINE
            17) apps_to_install=("${apps_to_install[@]}" "${hardware_aur[@]}");;
            18) apps_to_install=("${apps_to_install[@]}" "${nvidia_aur[@]}");;
            19) apps_to_install=("${apps_to_install[@]}" "${nvidia_optimus_aur[@]}");;
            20) apps_to_install=("${apps_to_install[@]}" "${android_aur[@]}");;
            21) apps_to_install=("${apps_to_install[@]}" "${asus_notebooks_aur[@]}");;
            22) apps_to_install=("${apps_to_install[@]}" "${iot_aur[@]}");;
        esac
    done
fi


if echo "$options_choises" | grep -qw 1; then
    echo -e "$INFO Updating installed packages"
    sudo pacman -Syyu
    echo -e "$OK Packages updated"
fi


echo -e "$NOTE Packages will be installed: ${apps_to_install[@]}"


# install yay
if ! command -v yay &> /dev/null; then
    echo -e "$INFO Installing yay..."
    cd ~/Downloads
    sudo pacman -S --needed git base-devel
    git clone https://aur.archlinux.org/yay.git
    cd yay
    makepkg -si --needed --noconfirm
    yay --save --answerclean None --answerdiff None # dont ask for clean build and show diff
    cd ..
    rm -rf yay
    echo -e "$OK Yay installed"
fi



# for installing czkawka
if [[ " ${apps_to_install[*]} " == *" czkawka-gui "* ]]; then
    echo -e "$INFO Importing czkawka key..."
    curl -sS https://github.com/web-flow.gpg | gpg --import - 
    echo -e "$OK Czkawka key imported"
fi



# install apps
echo -e "$INFO Installing apps..."
yay -S --needed --noconfirm --answerdiff=None --quiet --norebuild --noredownload ${apps_to_install[@]}



# nano-syntax-highlighting
if [[ " ${apps_to_install[*]} " == *" nano-syntax-highlighting "* ]]; then
    echo -e "$INFO Configuring nano-syntax-highlighting..."
    sudo sh -c 'echo "include /usr/share/nano-syntax-highlighting/*.nanorc" >> /etc/nanorc'
    echo -e "$OK nano-syntax-highlighting configured"
fi

if echo "$options_choises" | grep -qw 4; then
    echo -e "$INFO Enabling services..."

    # quemu
    if [[ " ${apps_to_install[*]} " == *" qemu-full "* ]]; then
        echo -e "$INFO Enabling libvirtd (QEMU)..."
        sudo systemctl enable --now libvirtd
        echo -e "$OK libvirtd enabled"
    fi

    # preload
    if [[ " ${apps_to_install[*]} " == *" preload "* ]]; then
        echo -e "$INFO Enabling preload..."
        sudo systemctl enable --now preload
        echo -e "$OK preload enabled"
    fi

    # supergfxctl (nvidia optimus)
    if [[ " ${apps_to_install[*]} " == *" supergfxctl "* ]]; then
        echo -e "$INFO Enabling supergfxd (nvidia optimus)..."
        sudo systemctl enable --now supergfxd
        echo -e "$OK supergfxd enabled"
    fi

    # bluetooth support
    if [[ " ${apps_to_install[*]} " == *" hardware "* ]]; then
        echo -e "$INFO Enabling bluetooth support..."
        sudo modprobe btusb
        sudo systemctl enable --now bluetooth
        echo -e "$OK Bluetooth support enabled"
    fi

    echo -e "$OK Services enabled"
fi


if echo "$options_choises" | grep -qw 5; then
    echo -e "$INFO Congfiguring all apps..."
    cd "$SCRIPT_DIR" 
    ./config.sh
fi


# davinci-resolve
# qt5-webkit taking too long to compile
# to download and install compiled version:
# wget https://archive.archlinux.org/packages/q/qt5-webkit/qt5-webkit-5.212.0alpha4-18-x86_64.pkg.tar.zst && sudo pacman -U --noconfirm qt5-webkit-5.212.0alpha4-18-x86_64.pkg.tar.zst
# yay -S --needed --noconfirm --answerdiff=None  davinci-resolve-studio  # video editor




# epic games launcher and unreal engine
if [[ " ${apps_to_install[*]} " == *" unreal-engine-bin "* ]]; then
    echo -e "$INFO Installing Epic Games Launcher..."
    set +e  # disabling flags to compile UE
    set +u  

    yay -S --needed --noconfirm --answerdiff=None eam-git

    echo -e "$OK Epic Games Launcher installed"

    echo -e "$ACTN Installing Unreal Engine..."
    echo -e "$ACTN Download unreal engine from https://www.unrealengine.com/en-US/linux"
    echo -e "$ACTN and place it to '~/.cache/yay/unreal-engine-bin'"

    # xdg-open https://www.unrealengine.com/en-US/linux
    # mkdir -p ~/.cache/yay/unreal-engine-bin
    # xdg-open ~/.cache/yay/unreal-engine-bin
    # echo "then press Enter..."
    # read TEMP

    yay -S --needed --noconfirm --answerdiff=None unreal-engine-bin

    echo -e "$OK Unreal Engine installed"
    set -eu # enabling flags back
fi


echo -e "$OK ---------------- COMPLETE ----------------"

if echo "$options_choises" | grep -qw 6; then
    read -rep "$ACTN Reboot? [Y/n] " confirm
    if [[ ! $confirm == [nN] ]]; then
        reboot
    fi
fi
