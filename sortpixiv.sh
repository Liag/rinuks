#!/bin/bash
basedir="/home/v/p/drawn"
cd "$basedir/unsorted/tosort"
num=0
suc=0
for f in *; do
	((++num))
	name=`echo "$f"|sed 's/-.*//'`
	dir="$basedir/$name"
	mkdir -p "$dir"
	cp "$f" "$dir"
	if [ $? -eq 0 ]; then
		((++suc))
	fi
done
echo "Successfully copied $suc of $num files."
