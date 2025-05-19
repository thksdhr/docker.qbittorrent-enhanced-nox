# Docker qBittorrent Enhanced Edition
一个公开维护的 qBittorrent Enhanced Edition 容器镜像，使用 Dockerfile 创建.

整合了 VueTorrent WEB UI ，将第三方 WEB UI 路径设置为 /programs/vuetorrent 即可使用

### Tips
> 建议使用 host 模式运行，否则 UPnP 功能可能会失效 

### Docker Compose
```
services:
  qbit:
    container_name: qbittorrent
    image: taozig/qbittorrent-enhanced-nox:latest
    restart: always
    network_mode: host
    environment:
      - TZ=Asia/Shanghai
      - TORRENTING_PORT=8888
    volumes:
      - ./configs:/programs/qBittorrent
      - ./volumes:/volumes
```

### 环境变量
```
TZ: 时区，默认为 Asia/Shanghai
WEBUI_PORT: WEBUI端口，默认为8080
TORRENTING_PORT: 种子传输的端口, 默认为8081
CONF_PATH: 程序配置文件夹位置, 默认为 /programs
CONF_NAME: 程序配置文件夹名称, 默认为 qBittorrent
```