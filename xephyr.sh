#!/bin/bash
Xephyr -br -ac -noreset -screen 1680x1050 :1 & export DISPLAY=:1
#Xephyr -br -ac -noreset -fullscreen :1 & export DISPLAY=:1
sleep 1
"$1"
