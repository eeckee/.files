#!/bin/bash
# Creates a "Notes" tex file with the name of the first argument passed to the script
# Uses a Note-template
if [ -n "$1" ]; then
    FILE="Notes_""$1"".tex"     
    echo $FILE
else     
    echo "No file name given."
    echo "Please give name:"
    echo "     sh new_tex.sh FILENAME"
    exit 1
fi

Img=/usr/share/icons/gnome/256x256/apps/accessories-text-editor.png
cd ~/Documents/latex/Notes/
if [ -f $FILE ]; then
    #File exists, open file
    DISPLAY=:0 notify-send -t 2000 --urgency=critical --icon=$Img "File already exists. Open existing file."
    vim $FILE
else
    cp ~/Documents/latex/LaTeX/Note_base.tex ~/Documents/latex/Notes/Notes_"$1".tex

    DISPLAY=:0 notify-send -t 2000 --urgency=critical --icon=$Img "Created "$1".tex"

    vim ~/Documents/latex/Notes/Notes_"$1".tex
fi

