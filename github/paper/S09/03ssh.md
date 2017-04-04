# 搭建 SSH 协议的 Git 服务器

## 演示环境

- 一台 CentOS Linux 服务器，名字：LAB，IP 地址：192.168.29.166
- 一台 CentOS Linux 工作站，名字：AMTB，IP 地址：192.168.29.144
- 一台 win 10 工作站，名字：x1-carbon，IP 地址：192.168.29.1
- 一台服务器，两个客户端
- Linux 系统是 vmware 虚拟机
- win 10 系统是宿主机

## 服务器的安装

- 单独录制视频
- CentOS 7
- 最小系统安装

## 服务器上必要软件的安装

- git，vim
- 默认最小系统安装支持 SSH 协议

## STAGE 1

- 服务器上 root 操作
- /opt 目录下建裸仓库 git-demo
- 两个客户端通过 git clone root@192.168.29.166:/opt/git-demo 克隆仓库
- 推送更新
- 每次需要给出 root 账户的密码
- 评价：
- 这一步很容易做到
- 通过这一步加深理解了 SSH 协议的格式：git@github.com:wangding/git-demo.git
