#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)
#

xrdb -merge ~/.Xresources
exec ck-launch-session dbus-launch i3
