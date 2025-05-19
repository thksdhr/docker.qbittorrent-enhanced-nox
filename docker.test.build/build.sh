#!/bin/bash
SHELL_PATH=$(readlink -f "${BASH_SOURCE[0]}")
echo "SHELL_PATH=[$SHELL_PATH]"
SHELL_DIR=$(dirname $SHELL_PATH)
echo "SHELL_DIR=[$SHELL_DIR]"
cd "$SHELL_DIR" || { echo "切换工作目录失败"; exit 1; }

# env
IMAGE_NAME="taozig/qbittorrent-enhanced-nox"
IMAGE_TAG="v5.1.0.10-bugfix"

# build docker image
docker build -t ${IMAGE_NAME}:${IMAGE_TAG} -f ./dockerfile --no-cache --pull ./

# save docker image
docker save ${IMAGE_NAME}:${IMAGE_TAG} -o ./qbittorrent-enhanced-nox.tar

# push docker image
docker push ${IMAGE_NAME}:${IMAGE_TAG}