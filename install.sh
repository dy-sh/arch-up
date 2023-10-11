#!/bin/bash
# Copyright Dmitry Savosh (d.savosh@gmail.com)


manuals=(           
    arch-wiki-docs  # arch wifi offline (html version)
    arch-wiki-lite  # arch wifi offline (CLI version)
    man-db          # manual for commands (man)
    tldr            # manual for commands (man alternative)
)

shell=(             
    # alacritty     # lightweight terminal
    fish            # user friendly shell (bash alternative)
    zsh zsh-autosuggestions zsh-completions zsh-history-substring-search zsh-syntax-highlighting zsh-theme-powerlevel10k zshdb # user friendly shell (bash alternative)
)

cli_tools=(    
    bat             # display file content with colors (cat alternative)
    exa             # list files (ls alternative)
    ripgrep         # grep alternative
    lsd             # list files (ls alternative)
    tree            # directory listing
    pv              # monitoring the progress of data through a pipeline
)

cli_file_managers=(          
    ranger          # file manager
    lf              # file manager (ranger alternative)
)

cli_text_editors=(          
    micro           # text editor
    vim             # text editor
    neovim          # text editor (nvim, fork of vim)
    nano            # text editor
    nano-syntax-highlighting # syntax highlighting for nano
)


cli_system_monitoring=(         
    htop            # system monitor
    btop            # system monitor (htop alternative)
    s-tui           # system monitor
    zenith          # system monitor
    bottom          # system monitor (btm)
    iftop           # network usage monitor
    duf             # disk usage/free info (df alternative)
    ncdu            # disk usage monitor (du alternative)
    nethogs         # network usage monitor
    nmap            # tool for showing open ports
    nvtop           # GPU usage monitor
    traceroute      # network route tracking tool
)

cli_system_monitoring_aur=(         
    gotop           # system monitor
)

cli_system_info=(          
    neofetch        # system information
    ccze            # log viewver with colors
    inxi            # system information
)

archivers=(          
    zip unzip       # archiver
    unrar           # archiver
    cdrtools        # mkisofs tool for creating iso images
)

code_compiling=(         
    cmake           # code compile and build tool
    gcc             # c/c++ compiler
    git git-lfs     # version control system
    lazygit         # terminal UI for git
    ninja           # code compile and build tool
    python-pip      # tool for installing python packages
)

file_systems=(          
    exfat-utils     # utilities for exFAT file system
    ntfs-3g         # NTFS filesystem driver and utilities
)

backup=(          
    unison          # file synchronization and backup tool
    rsync           # file copying and backup tool
)
backup_aur=(      
    freefilesync-bin  # file synchronization and backup tool
    # timeshift     # GUI for disk snapshots
    downgrade       # bash script for downgrading packages to a version in cache
)

find_files=(
    fd              # find files cli tool (find command alternaive)
    # fdupes          # find file duplicates
    catfish         # find files
    kfind           # find files (KDE)
    bleachbit       # deletes unneeded files to free disk space
)

find_files_aur=(
    czkawka-gui czkawka-cli # find duplicates
)

file_managers=(     
    # ##### DOLPHIN FIlE MANAGER (KDE) ###########         
    dolphin   
    # ##### THUNAR FIlE MANAGER (XFCE) ###########
    # thunar           
    # thunar-archive-plugin      
    # thunar-media-tags-plugin   
    # thunar-volman              
    # ##### NEMO FIlE MANAGER (CINNAMON) ##############
    # nemo           
    # nemo-audio-tab            
    # nemo-fileroller           
    # nemo-image-converter      
    # nemo-preview              
    # nemo-seahorse             
    # nemo-share                                 
)
file_managers_aur=(         
    # ##### THUNAR FIlE MANAGER ###########
    # # thunar-vcs-plugin
    # thunar-shares-plugin
    # ##### NEMO FIlE MANAGER ##############
    # # nemo-media-columns   
    # # nemo-mediainfo-tab   
    # # nemo-meld-compare    
    # # nemo-run-with-nvidia 
    # # nemo-compare         
)


encryption=(        
    keepassxc       # password manager
    veracrypt       # encryption tool
)


text=(             
    # libreoffice-fresh # office apps
    obsidian        # note taking app
    # espeak-ng       # text to speach (TTS)
    # festival festival-us #  text to speach (TTS)
    # zathura zathura-pdf-mupdf # simple pdf viewer
)
text_aur=(          
    typora          # markdown editor
    # festvox-ru      # text to speach (TTS)
)


network=(         
    curl            # http requests and download manager
    aria2           # download manager (HTTP, FTP, BitTorrent)
    wget            # download manager
    axel            # download manager
    samba           # SMB fileserver
    freerdp         # remote desktop protocol (RDP)
    krdc            # remote desktop client (RPD) (KDE)
    remmina         # remote desktop client (VNC/RPD/temviewer/rustdesk and more)
    # moonlight-qt sunshine # fast remote desktop client/server for nvidia GPU
    gwakeonlan      # utility to awake machines using the Wake on LAN
)
network_aur=(      
    xrdp            # remote desktop protocol (RDP) server 
    wsdd            # web service discovery (WSD) daemon for SMB/Samba
)




internet=( 
    uget            # download manager
    kget            # download manager (KDE)
    yt-dlp          # download video from youtube
    deluge-gtk      # bittorrent client
    qbittorrent     # bittorrent client
    firefox         # web browser
    opera           # web browser with integrated VPN
    thunderbird     # email clint
    telegram-desktop # messenger
    discord         # messenger
    moserial        # serial terminal
    putty           # terminal for ssh/telent/serial
    cool-retro-term # terminal emulator which old cathode display
    filezilla       # ftp client
    tgpt-bin        # chat-gpt in terminal
    # opensnitch    # firewall
    # haguichi      # hamachi client 
)
internet_aur=(     
    uget-integrator         # uget download manager integration for browsers
    kget-integrator-firefox # kget download manager integration for firefox
    pcloud-drive    # file storage cloud
)



audio_players=(    
    quodlibet       # audio player
    flac            # flac audio codec
)
audio_players_aur=( 
    puddletag       # audio tag editor
    spotify         # music streaming client
)


audio_editors=(     
    audacity        # audio editor
    reaper          # audio editor
)



video_players=(     
    mpv             # video player
    vlc             # video player
    totem           # video player
    gst-libav       # codecs for totem and gthumb
    playerctl       # CLI for players (vlc and other)
)
video_players_aur=(      
    vlc-pause-click-plugin  # vlc plugin 
    vlc-bittorrent          # vlc plugin 
    # vlc-materia-skin-git    # vlc theme
)


video_editors=(     
    kdenlive        # video editor (KDE)
    handbrake       # video converter
    obs-studio      # screen recording (powerful)
    peek            # screen recording (simple)
)
video_editors_aur=( 
    losslesscut-bin # lossless video cut
)


picture_viewers=(   
    gwenview        # picture viewer (KDE)
    gthumb          # picture viewer
    kimageformats   # HEIC support for Qt picture viewvers
)
picture_viewers_aur=( 
    xnviewmp        # picture viewer
)

graphics_editors=(  
    spectacle       # screenshot tool (KDE)
    # flameshot       # screenshot tool
    # shutter         # screenshot tool
    gimp            # graphics editor
    krita           # graphics editor
)





vm=(               
    qemu-full virt-manager virt-viewer dnsmasq net-tools # qemu
    # qemu additional packages:  vde2 bridge-utils openbsd-netcat dmidecode ebtables iptables archlinux-keyring
)



fonts=(         
    ttf-ubuntu-font-family ttf-jetbrains-mono ttf-roboto # most used fonts
    ttf-nerd-fonts-symbols ttf-nerd-fonts-symbols-mono   # requred fonts with icons
)



gnome=(             
    gnome-browser-connector # browser integration with extensions.gnome.org
    gnome-tweaks            # GNOME 3 settings (Tweak Tool)
    gnome-keyring   # stores passwords and encryption keys
    gparted         # partition manager 
    gnome-clocks    # timer, stopwatch, clock
    gnome-terminal       # terminal
    gnome-power-manager # power monitoring tool
    ##### NAUTILUS FIlE MANAGER ###########
    nautilus                    # file manager from Gnome
    nautilus-image-converter   
    nautilus-share             
    python-nautilus            
    seahorse-nautilus          
    sushi  
)
gnome_aur=(         
    extension-manager       # GNOME 3 extension manager
    ##### NAUTILUS FIlE MANAGER ###########
    nautilus-admin-gtk4  
    # nautilus-code      
    # nautilus-copy-path 
    # nautilus-compare   
    ##### broken nautilus plugins: nautilus-renamer nautilus-metadata-editor nautilus-empty-file nautilus-mediainfo folder-color-nautilus nautilus-columns-git archive-mount-nautilus-git
)



gaming=(            
    # add 32 bit repo (multilib) to install steam
    steam           # steam client
    lutris          # run windows apps and games
)
gaming_aur=( 
    protonup-qt-bin # wine fork (libs for running windows apps and games)
)



automation=(            
    inotify-tools   # watch file system changes in realtime
    dconf-editor    # gsettings editor (for GNOME apps)
    d-spy           # d-bus debugger (for automation)
    xbindkeys       # launch commands with keyboard/mouse (for X11)
    xdotool         # automation tool (for X11)
    xclip           # tool for clipboard (for X11)
    xsel            # tool for clipboard and contents of selectet text (for X11)
)




dev=(              
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
dev_aur=(          
    visual-studio-code-bin
    clion
    gitfiend
    github-desktop-bin
    # gittyup # not compiled
    rider
    smartgit
    webstorm
)



hardware=(         
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
    # preload         # run applications faster by prefetching binaries
)
hardware_aur=(     
    auto-cpufreq    # automatic CPU freq optimizer
    cpulimit        # limit cpu usage of a process 
    input-remapper-git # binding mouse buttons to any scripts
    geekbench       # benchmark disks
    geekbench5      # benchmark disks
    geekbench4      # benchmark disks
)

nvidia=(           
    nvidia          # nvidia drivers for linux kernel      (preinstalled by installer)
    # nvidia-lts    # nvidia drivers for linux-lts kernel  (preinstalled by installer)
    # nvidia-dkms   # nvidia drivers for all other kernels (preinstalled by installer)
    nvidia-settings # nvidia settins app

)
nvidia_aur=(       
    gwe             # tweaking nvidia GPU
)


nvidia_optimus=(    

)

nvidia_optimus_aur=( 
    supergfxctl
)


android=(          
    kdeconnect      # Android/iPhone integration (KDE)
    scrcpy          # display and control your Android device
)



asus_notebooks=(   
    # tlp           # power management tool (conflicted with rog-control-center)
)
asus_notebooks_aur=( 
    rog-control-center # ASUS notebooks management tool
    # tlpui         # GUI for tlp (conflicted with rog-control-center)
)


iot=(              

)
iot_aur=(          
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

if [[ $DESKTOP_SESSION == "gnome" ]]; then
    gnome_installed="on"
else
    gnome_installed="off"
fi

cmd=(dialog --clear --separate-output --checklist "Select software to install (use Space key):" 26 86 16)
dialog_options=(
    1 "Manuals and docs" on
    2 "Shell and terminal apps" on
    3 "Main CLI tools (bash commands alternative)" on
    4 "CLI file managers" on
    5 "CLI text editors" on
    6 "CLI system monitoring tools" on
    7 "CLI System info tools" on
    8 "Archivers and file images tools" on
    9 "Main code compiling tools" on
    10 "File systems support" on
    11 "System backup tools" on
    12 "Find files tools" on
    13 "File managers" on
    14 "Encryption tools" on
    15 "Text editors and office" on
    16 "Network administration and remote control" on
    17 "Inernet apps (messengers, browsers, downloaders...)" on
    18 "Audio players" on
    19 "Audio editors" on
    20 "Video players" on
    21 "Video editors" on
    22 "Picture viewers" on
    23 "Graphic editors and screenshoting tools" on
    24 "Virtual machines" on
    25 "System fonts (required by apps)" on
    26 "Gnome tools" "$gnome_installed"
    27 "Gaming utils" on
    28 "Automation and tweek tools" on
    29 "Dev utils" on
    30 "Unreal Engine" off
    31 "Hardware tools" on
    32 "NVIDIA drivers" off
    33 "NVIDIA Optimus support (for notebooks)" off
    34 "Android integration tools" on
    35 "ASUS Notebooks tools" off
    36 "IOT tools" off
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
            1) apps_to_install=("${apps_to_install[@]}" "${manuals[@]}");;
            2) apps_to_install=("${apps_to_install[@]}" "${shell[@]}");;
            3) apps_to_install=("${apps_to_install[@]}" "${cli_tools[@]}");;
            4) apps_to_install=("${apps_to_install[@]}" "${cli_file_managers[@]}");;
            5) apps_to_install=("${apps_to_install[@]}" "${cli_text_editors[@]}");;
            6) apps_to_install=("${apps_to_install[@]}" "${cli_system_monitoring[@]}");;
            7) apps_to_install=("${apps_to_install[@]}" "${cli_system_info[@]}");;
            8) apps_to_install=("${apps_to_install[@]}" "${archivers[@]}");;
            9) apps_to_install=("${apps_to_install[@]}" "${code_compiling[@]}");;
            10) apps_to_install=("${apps_to_install[@]}" "${file_systems[@]}");;
            11) apps_to_install=("${apps_to_install[@]}" "${backup[@]}");;
            12) apps_to_install=("${apps_to_install[@]}" "${find_files[@]}");;
            13) apps_to_install=("${apps_to_install[@]}" "${file_managers[@]}");;
            14) apps_to_install=("${apps_to_install[@]}" "${encryption[@]}");;   
            15) apps_to_install=("${apps_to_install[@]}" "${text[@]}");;
            16) apps_to_install=("${apps_to_install[@]}" "${network[@]}");;
            17) apps_to_install=("${apps_to_install[@]}" "${internet[@]}");;
            18) apps_to_install=("${apps_to_install[@]}" "${audio_players[@]}");;
            19) apps_to_install=("${apps_to_install[@]}" "${audio_editors[@]}");;
            20) apps_to_install=("${apps_to_install[@]}" "${video_players[@]}");;
            21) apps_to_install=("${apps_to_install[@]}" "${video_editors[@]}");;
            22) apps_to_install=("${apps_to_install[@]}" "${picture_viewers[@]}");;
            23) apps_to_install=("${apps_to_install[@]}" "${graphics_editors[@]}");;
            24) apps_to_install=("${apps_to_install[@]}" "${vm[@]}");;
            25) apps_to_install=("${apps_to_install[@]}" "${fonts[@]}");;
            26) apps_to_install=("${apps_to_install[@]}" "${gnome[@]}");;
            27) apps_to_install=("${apps_to_install[@]}" "${gaming[@]}");;
            28) apps_to_install=("${apps_to_install[@]}" "${automation[@]}");;
            29) apps_to_install=("${apps_to_install[@]}" "${dev[@]}");;
            30) install_unreal=true;;
            31) apps_to_install=("${apps_to_install[@]}" "${hardware[@]}");;
            32) apps_to_install=("${apps_to_install[@]}" "${nvidia[@]}");;
            33) apps_to_install=("${apps_to_install[@]}" "${nvidia_optimus[@]}");;
            34) apps_to_install=("${apps_to_install[@]}" "${android[@]}");;
            35) apps_to_install=("${apps_to_install[@]}" "${asus_notebooks[@]}");;
            36) apps_to_install=("${apps_to_install[@]}" "${iot[@]}");;
        esac
    done
fi

if echo "$options_choises" | grep -qw 3; then
    for choice in $install_soft_choises
    do
        case $choice in
            1) apps_to_install=("${apps_to_install[@]}" "${manuals_aur[@]}");;
            2) apps_to_install=("${apps_to_install[@]}" "${shell_aur[@]}");;
            3) apps_to_install=("${apps_to_install[@]}" "${cli_tools_aur[@]}");;
            4) apps_to_install=("${apps_to_install[@]}" "${cli_file_managers_aur[@]}");;
            5) apps_to_install=("${apps_to_install[@]}" "${cli_text_editors_aur[@]}");;
            6) apps_to_install=("${apps_to_install[@]}" "${cli_system_monitoring_aur[@]}");;
            7) apps_to_install=("${apps_to_install[@]}" "${cli_system_info_aur[@]}");;
            8) apps_to_install=("${apps_to_install[@]}" "${archivers_aur[@]}");;
            9) apps_to_install=("${apps_to_install[@]}" "${code_compiling_aur[@]}");;
            10) apps_to_install=("${apps_to_install[@]}" "${file_systems_aur[@]}");;
            11) apps_to_install=("${apps_to_install[@]}" "${backup_aur[@]}");;
            12) apps_to_install=("${apps_to_install[@]}" "${find_files_aur[@]}");;
            13) apps_to_install=("${apps_to_install[@]}" "${file_managers_aur[@]}");;
            14) apps_to_install=("${apps_to_install[@]}" "${encryption_aur[@]}");;   
            15) apps_to_install=("${apps_to_install[@]}" "${text_aur[@]}");;
            16) apps_to_install=("${apps_to_install[@]}" "${network_aur[@]}");;
            17) apps_to_install=("${apps_to_install[@]}" "${internet_aur[@]}");;
            18) apps_to_install=("${apps_to_install[@]}" "${audio_players_aur[@]}");;
            19) apps_to_install=("${apps_to_install[@]}" "${audio_editors_aur[@]}");;
            20) apps_to_install=("${apps_to_install[@]}" "${video_players_aur[@]}");;
            21) apps_to_install=("${apps_to_install[@]}" "${video_editors_aur[@]}");;
            22) apps_to_install=("${apps_to_install[@]}" "${picture_viewers_aur[@]}");;
            23) apps_to_install=("${apps_to_install[@]}" "${graphics_editors_aur[@]}");;
            24) apps_to_install=("${apps_to_install[@]}" "${vm_aur[@]}");;
            25) apps_to_install=("${apps_to_install[@]}" "${fonts_aur[@]}");;
            26) apps_to_install=("${apps_to_install[@]}" "${gnome_aur[@]}");;
            27) apps_to_install=("${apps_to_install[@]}" "${gaming_aur[@]}");;
            28) apps_to_install=("${apps_to_install[@]}" "${automation_aur[@]}");;
            29) apps_to_install=("${apps_to_install[@]}" "${dev_aur[@]}");;
            # 30) UNREAL ENGINE
            31) apps_to_install=("${apps_to_install[@]}" "${hardware_aur[@]}");;
            32) apps_to_install=("${apps_to_install[@]}" "${nvidia_aur[@]}");;
            33) apps_to_install=("${apps_to_install[@]}" "${nvidia_optimus_aur[@]}");;
            34) apps_to_install=("${apps_to_install[@]}" "${android_aur[@]}");;
            35) apps_to_install=("${apps_to_install[@]}" "${asus_notebooks_aur[@]}");;
            36) apps_to_install=("${apps_to_install[@]}" "${iot_aur[@]}");;
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
    sudo pacman -S --needed --noconfirm git base-devel
    git clone https://aur.archlinux.org/yay-bin.git
    cd yay-bin
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

# regular install (with validity checks)
# yay -S --needed --noconfirm --answerdiff=None --quiet --norebuild --noredownload ${apps_to_install[@]}

# skip validity checks (less secure but allow to install outdated packages)
yay -S --mflags --skipinteg --needed --noconfirm --answerdiff=None --quiet --norebuild --noredownload ${apps_to_install[@]}





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
    if [[ " ${apps_to_install[*]} " == *" bluez "* ]]; then
        echo -e "$INFO Enabling bluetooth support..."
        # sudo modprobe btusb
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
# if [[ " ${apps_to_install[*]} " == *" unreal-engine-bin "* ]]; then
if [[ -v install_unreal ]]; then
    echo -e "$INFO Installing Epic Games Launcher..."
    set +e  # disabling flags to compile UE
    set +u  

    yay -S --needed --noconfirm --answerdiff=None eam-git

    echo -e "$OK Epic Games Launcher installed"

    echo -e "$ACTN Installing Unreal Engine..."
    mkdir -p ~/.cache/yay/unreal-engine-bin
    echo -e "$ACTN Download Unreal Engine from https://www.unrealengine.com/en-US/linux"
    echo -e "$ACTN and place it to '~/.cache/yay/unreal-engine-bin'"
    read -rep "$ACTN Press Enter to continue..."

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
