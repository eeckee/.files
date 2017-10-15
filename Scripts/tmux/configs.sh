#!/bin/bash

session="config"
tmux has-session -t $session 2> /dev/null
if [ "$?" -eq 1 ] 
then
    Img=~/.files/icons/red-icon.png
    DISPLAY=:0 notify-send -t 3000 --urgency=critical --icon=$Img "Creating Work Session"
    # set up tmux
    tmux start-server

    # create a new tmux session, starting vim from a saved session in the new window
    tmux new-session -d -s $session -n vim #"vim -S ~/.vim/sessions/kittybusiness"

    # Select pane 1, set dir to gfi (zsh alias) , run vim
    tmux selectp -t 1 
    tmux send-keys "gfi;vim" C-m 
    # Finished setup, attach to the tmux session!
    tmux attach-session -t $session
else
    Img=~/.files/icons/check_green.png
    attached=$( tmux ls | grep $session | grep attached)
    if [ -z "$attached" ] 
    then
        killall notify-osd
        DISPLAY=:0 notify-send -t 3000 --urgency=critical --icon=$Img "Attaching to $session"
        tmux attach-session -t $session    
    else
        DISPLAY=:0 notify-send -t 3000 --urgency=critical --icon=$Img "Already attached"
    fi
fi


