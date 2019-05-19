#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then
    xrdb -merge $sysresources
fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

xrandr --setprovideroutputsource modesetting NVIDIA-0
xrandr --auto --dpi 96

if [ `xrandr --listmonitors | wc -l` -gt 2 ]; then
	xrandr --output eDP-1-1 --primary
	xrandr --output eDP-1-1 --mode 1920x1080 --output HDMI-1-1 --right-of eDP-1-1 --mode 1280x1024
fi

xss-lock -- i3lock -n -c 000000 &
export QT_STYLE_OVERRIDE=kvantum
exec i3
