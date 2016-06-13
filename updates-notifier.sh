#!/usr/bin/env bash
updates=$(checkupdates)
n=$(echo "$updates" | sed '/^\s*$/d' | wc -l)
if [ "$n" != "0" ]; then
    if [ "$n" -gt "1" ]
    then
        notify-send "System update" "$n updates available:\n$updates"
    else
        notify-send "System update" "1 update available:\n$updates"
    fi
fi

