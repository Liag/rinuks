#!/bin/bash
date +'%Y-%m-%d %H:%M:%S' > ~/docs/rinuks/pacman_native.txt
echo -e >> ~/docs/rinuks/pacman_native.txt
pacman -Qn >> ~/docs/rinuks/pacman_native.txt

date +'%Y-%m-%d %H:%M:%S' > ~/docs/rinuks/pacman_foreign.txt
echo -e >> ~/docs/rinuks/pacman_foreign.txt
pacman -Qm >> ~/docs/rinuks/pacman_foreign.txt

cd ~/docs/rinuks
git commit -am "Automated commit."
