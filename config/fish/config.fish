if status is-interactive
    # Commands to run in interactive sessions can go here
end

# disable greeting
set -g fish_greeting

# color threme
fish_config theme choose Nord

# prompt
starship init fish | source

# cnage VSCode file/folder picker to KDE default 
set -Ux GTK_USE_PORTAL 1

# advcpmv
alias cp '/usr/bin/advcp -g'
alias mv '/usr/bin/advmv -g'
