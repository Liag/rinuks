#!/bin/bash
basedir="/home/v/p/drawn"
cd "$basedir/unsorted"
for f in *; do
	name=`echo "$f"|sed 's/-.*//'`
	dir="$basedir/$name"
	mkdir -p "$dir"
	cp "$f" "$dir"
done
