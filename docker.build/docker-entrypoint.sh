#!/bin/bash

# FUNC
# 检测是否转换 INT 类型成功
function INT_CHECK() {
    if [ "$#" -lt 1 ]; then
        echo "错误: 需要至少一个参数。"
        echo "用法: INT_CHECK <value>"
        return 1 # 返回非零值表示失败
    fi

    if [[ $1 =~ ^-?[0-9]+$ ]]; then
        echo "检测通过，这是一个整数: $1"
    else
        echo "请检查输入的值是否为整数"
        echo "exiting..."
        exit 1
    fi
}

# 检测环境变量是否正常
echo "检测环境变量是否正确设置..."
INT_CHECK ${WEBUI_PORT}
INT_CHECK ${TORRENTING_PORT}

# 启动 qBittorrent
./qbittorrent-nox --confirm-legal-notice \
    --webui-port=${WEBUI_PORT} \
    --torrenting-port=${TORRENTING_PORT} \
    --profile=${CONF_PATH} \
    --configuration=${CONF_NAME} \
    --relative-fastresume
