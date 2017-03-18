#!/bin/bash
#sudo cp disable-second.conf /etc/X11
xinit "/home/v/GOG Games/FTL Advanced Edition/start.sh" -- :1 -xf86config disable-second.conf vt$XDG_VTNR
#sudo rm /etc/X11/disable-second.conf
