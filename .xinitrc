#!/bin/sh

# xinitrc runs automatically when you run startx.

# There are some small but important commands that need to be run when we start
# the graphical environment. I keep those commands in ~/.xprofile because that
# file is run automatically if someone uses a display manager (login screen)
# and so they are needed there. To prevent doubling up commands, I source them
# here with the line below.

[ -f ~/.xprofile ] && . ~/.xprofile


# urxvt settings

[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources
eval $(dbus-launch --sh-syntax --exit-with-session spectrwm)

# Here we run the proper command to run when the graphical environment starts.

exec spectrwm

# wallpaper

exec feh --bg-fill ~/.config/wall.png
