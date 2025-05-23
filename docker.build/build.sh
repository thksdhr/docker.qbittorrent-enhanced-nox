#!/bin/bash
SHELL_PATH=$(readlink -f "${BASH_SOURCE[0]}")
echo "SHELL_PATH=[$SHELL_PATH]"
SHELL_DIR=$(dirname $SHELL_PATH)
echo "SHELL_DIR=[$SHELL_DIR]"
cd "$SHELL_DIR" || { echo "切换工作目录失败"; exit 1; }

docker build -t taozig/qbittorrent-enhanced-nox:latest -f ./dockerfile --no-cache --pull ./