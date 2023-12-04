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

# set nvim as default editor
set -Ux EDITOR nvim

# advcpmv (cp, mv alternative with progress bar)
alias cp '/usr/bin/advcp -g'
alias mv '/usr/bin/advmv -g'

# exa (ls alternative with colors)
alias ls 'exa --icons=always --group-directories-first --smart-group --classify --git'
alias l 'ls -la'
alias la 'ls -la'
alias lt 'ls -la --total-size --sort=size --reverse'

# xplr
alias x xcd

# set TERM variable if TMUX 
# (by default it is tmux-256color, but some apps wont work with if, for example gotop)
if test -n "$TMUX"
    # echo "xterm-256color"
    set -Ux TERM xterm-256color
end


# navigate bu tere util (cd on quit from tere)
# run "tere" to naviafate
function tere
    set --local result (command tere $argv)
    [ -n "$result" ] && cd -- "$result"
end


# navigate bu xplr (cd on quit from tere)
# run "xcd" to naviafate
function xcd
    set output (xplr --print-pwd-as-result)
    if test $status -eq 0
        cd "$output"
    end
end

# this varian will go to home if xplr will return error (exited tirh Q key)
# function xcd
#     cd (xplr --print-pwd-as-result)
# end


# zoxide
zoxide init fish | source
