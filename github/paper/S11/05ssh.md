# 搭建 SSH 协议的 Git 服务器

## 空白虚拟机的创建

- vmware workstation 软件的下载和安装（略）
- vmware workstation 12 Pro 版本
- 创建 vmware 空白虚拟机
- 内存 3G
- 硬盘 50G
- 单一存储文件
- NAT 网络地址转换
- 编辑虚拟机配置，去掉声卡、U 盘和打印机

## 初始化系统的安装

- 单独录制视频
- CentOS 7
- 最小系统安装
- 设置 root 密码
- 创建 git 用户，并设置密码
- 将 git 用户放到管理员组中
- 设置区域和语言
- 设置安全策略
- 设置标准分区

## 服务器上必要软件的安装

- git，vim
- 默认最小系统安装支持 SSH 协议
- 配置固定 IP 地址：192.168.29.166
- sudo nmtui
- root 账户编辑 /etc/sysconfig/network-scripts/ifcfg-enoxxx
- systemctl restart network
- 在服务器上拍摄快照，每种协议的服务器搭建办法，创建一种快照，类似下面的样子：
  o -----> 初始系统 -------> 本地协议的 Git 服务器
              |------------> Git 协议的 Git 服务器
              |------------> SSH 协议的 Git 服务器
              |------------> HTTP协议的 Git 服务器
             

## STAGE 1


- 服务器上 root 操作
- /opt 目录下建裸仓库 git-demo
- 两个客户端通过 git clone root@192.168.29.166:/opt/git-demo 克隆仓库
- 推送更新
- 每次需要给出 root 账户的密码
- 评价：
- 这一步很容易做到
- 通过这一步加深理解了 SSH 协议的格式：git@github.com:wangding/git-demo.git
