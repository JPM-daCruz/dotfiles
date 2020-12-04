# start X if on TTY 1
if [[ -z $DISPLAY && $XDG_VTNR -eq 1 ]]
then
exec startx
fi

source "$HOME/.bashrc"
