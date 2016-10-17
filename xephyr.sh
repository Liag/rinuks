#!/bin/bash
Xephyr -br -ac -noreset -screen 1680x1050 :1 && DISPLAY=:1 xterm
