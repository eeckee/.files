#!/bin/sh

# Starts in the home directory and initializes a tmux session called DropDown
# with ranger, a terminal and htop 

cd ~
session="DropDown"

tmux new-session -d -s $session
tmux rename-window -t $session:0 "Ranger"
tmux send-keys -t $session:0 "ranger" Enter

tmux new-window -t $session:1
tmux rename-window -t $session:1 "Terminal"

tmux new-window -t $session:2
tmux rename-window -t $session:2 "Htop"
tmux send-keys -t $session:2 "htop" Enter

# tmux new-window -t $session:2
# tmux rename-window -t $session:2 "IPython"

tmux select-window -t $session:0
tmux attach-session -d -t $session
