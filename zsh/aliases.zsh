# =================================================
# =================   ALIASES  ====================
# =================================================
# Standard {{{
alias cd..="cd .."
alias e="exit"
alias :q='exit'
alias :wq='exit'
# pneumonic: (l)ist(.)...
# alias la="ls -A"

if [[ $(uname) == 'Darwin' ]]; then
	alias ll="gls -l --color"
	alias ld="gls -ld */ --color"
	alias la="gls -A -1 --group-directories-first --color"
	alias lsf="gls -1 --group-directories-first --color"
	alias lrt="gls -lrt --color"
	alias ltt="gls -ogl *.tex --color"
	alias ltx="gls *.tex --color"
	alias lpy="gls *.py --color"
	alias lpdf="gls -ogl *.pdf --color"

else
	alias ll="ls -l"
	alias ld="ls -ld */"
	alias la="ls -A -1 --group-directories-first"
	alias lrt="ls -lrt"
	alias ltt="ls -ogl *.tex"
	alias ltx="ls *.tex"
	alias lpy="ls *.py"
	alias lpdf="ls -ogl *.pdf"

fi

alias ldt="tree -d -L 2"
# }}}

# Movement {{{
alias gfi="cd ~/.files; ls"
alias gz="cd ~/.files/zsh; ls"
alias gbl="cd ~/blog; ls"
alias gph="cd ~/phd; ls"
alias gpe="cd ~/.personal; ls"

alias gbu="cd ~/.vim/bundle; ls"
alias gdw="cd ~/Downloads; la"
alias gho="cd ~/"
alias gno="cd ~/blog/public/notes; ls" 
alias gpi="cd ~/Pictures"

# }}}

####################### 

# CUSTOM {{{
alias vim="nvim"
alias VIM="vim"
alias v="nvim"
alias ipy="ipython"  #--profile=erik"
function mkpr() { project_init "$1" }  # I dont use this but good idea. Revisit

alias jno="jupyter notebook"  #jupyter notebook example.ipynb
alias wnvi="watch -n 1 nvidia-smi"

alias scroll="xinput set-prop 12 284 -303 303"
alias wif="sudo iwconfig wlp2s0 txpower 10dBm"
alias somy="source $HOME/mycroft-core/.venv/bin/activate"

alias friture="python $HOME/friture/main.py"

# tmuxinator
alias work="tmuxinator start WORK"
alias basic="tmuxinator start basic"
alias drop="tmuxinator start dropdown"
alias proj="tmuxinator start project"
# }}}

alias patchwork="cd ~/patchwork && npm start"

alias Clear='tspc "clear"'

# Git {{{
alias gad="git add"
alias gco="git commit -m"
alias gdi="git diff"
alias gps="git push"
alias gpl="git pull"
alias gst="git status"
# For all panes in window (tmux)
alias Gps='tspc "git push"'
alias Gpl='tspc "git pull"'
alias Gst='tspc "git status"'

alias gpush="python ~/.files/bin/git-script -c push -d .files phd Notes Audio/maptaskdataset Audio/dialogAgent Locomotion"
alias gpull="python ~/.files/bin/git-script -c pull -d .files phd Notes Audio/maptaskdataset Audio/dialogAgent Locomotion"      
alias gstatus="python ~/.files/bin/git-script -d .files phd Notes Audio/maptaskdataset Audio/dialogAgent Locomotion"
# }}}

# Tmux {{{
alias tls="tmux list-sessions"
alias tkd="tmux-kill-detached-sessions"
alias tks="tmux kill-session -t"
alias tkp="tmux kill-pane -t"
alias tkw="tmux kill-window -t"
alias tst="tmux new-session"
alias tspc="_tmux_send_keys_all_panes_"
# }}}

# Config {{{
alias eal="vim ~/.files/zsh/aliases.zsh"
alias ealiases="vim ~/.files/zsh/aliases.zsh"
alias ev="nvim ~/.files/nvim/init.vim"
alias ez="nvim ~/.zshrc"
alias et="nvim ~/.tmux.conf"
alias ec="nvim ~/.files/chunkwm/chunkwmrc"
alias er="nvim ~/.config/ranger/rc.conf"
alias ekitty="vim ~/.files/terminals/kitty/kitty.conf"
alias chunk="v ~/.files/chunkwm/chunkwmrc"
alias skhd="v ~/.files/chunkwm/skhd/skhdrc"


alias rz="source ~/.zshrc"
alias ru="xrdb -load ~/.Xresources"

# Mount Usb Stick
alias umountusb="udiskie-umount /media/erik/*"

# }}}

# SSH / WOL {{{
export MOUNTPATH=~/LAN
alias wake="wakeonlan -i xxx.xxx.xxx.xxx yy:yy:yy:yy:yy:yy" 
alias mountmachine="sshfs -p 2002 -o ssh_command='ssh -i ~/.ssh//id_rsa' user@xxx.xxx.xxx.xxx:/PATH/ ~/$MOUNTPATH"
alias umountall="sudo umount ~/Machines/*"

# }}}
