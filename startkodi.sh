#!/bin/bash

sudo mount -t nfs yr:/srv/nfs/anime /mnt/nfs/anime
sudo mount -t nfs yr:/srv/nfs/videos /mnt/nfs/videos
sudo systemctl start kodi
