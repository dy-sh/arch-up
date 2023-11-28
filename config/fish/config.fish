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


# navigate bu tere util (cd on quit from tere)
# run "tere" to naviafate
function tere
    set --local result (command tere $argv)
    [ -n "$result" ] && cd -- "$result"
end


# navigate bu xplr (cd on quit from tere)
# run "xcd" to naviafate
function xcd
    cd (xplr --print-pwd-as-result)
end

