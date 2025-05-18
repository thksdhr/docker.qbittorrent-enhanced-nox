#!/bin/bash

echo "Starting install script"

mkdir -p /install-temp
cd /install-temp

# qBittorrent Enhanced Edition
QBT_RELEASE_TAG=$(curl --silent "https://api.github.com/repos/c0re100/qBittorrent-Enhanced-Edition/releases/latest" | awk -F\" '/^ *"tag_name": "/ {print $4; exit}')
QBT_DOWNLOAD_URL="https://github.com/c0re100/qBittorrent-Enhanced-Edition/releases/download/${QBT_RELEASE_TAG}/qbittorrent-enhanced-nox_x86_64-linux-musl_static.zip"
curl -C - -LO# ${QBT_DOWNLOAD_URL}
# Unzip the qBittorrent package
unzip -o qbittorrent-enhanced-nox_x86_64-linux-musl_static.zip -d /programs

# WebUI
UI_RELEASE_TAG=$(curl --silent "https://api.github.com/repos/VueTorrent/VueTorrent/releases/latest" | awk -F\" '/^ *"tag_name": "/ {print $4; exit}')
UI_DOWNLOAD_URL="https://github.com/VueTorrent/VueTorrent/releases/download/${UI_RELEASE_TAG}/vuetorrent.zip"
curl -C - -LO# ${UI_DOWNLOAD_URL}
# Unzip the WebUI package
unzip -o vuetorrent.zip -d /programs

# MiniConada
curl -C - -LO# "https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh"
bash Miniconda3-latest-Linux-x86_64.sh -b -u -p /root/miniconda3
source ~/miniconda3/bin/activate
conda init --all
# PATH="/root/miniconda3/bin:$PATH"

# Cleanup
cd / && rm -rf /install-temp

# END
echo "Install complete"