#!/bin/sh

session="ranger"

# set up tmux
tmux start-server

# create a new tmux session, starting vim from a saved session in the new window
tmux new-session -d -s $session -n ranger #"vim -S ~/.vim/sessions/kittybusiness"

# Select pane 1, set dir to gro (zsh alias) , run vim
tmux selectp -t 1 
tmux send-keys "ranger" C-m 

# Finished setup, attach to the tmux session!
tmux attach-session -t $session
