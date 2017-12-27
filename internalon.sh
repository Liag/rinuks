#!/bin/sh
synclient TouchPadOff=0
intkbd=`xinput --list | grep "AT Translated Set 2 keyboard" | cut -f2 | cut -c4-`
xinput set-int-prop $intkbd "Device Enabled" 8 1	
