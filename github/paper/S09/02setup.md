# 初始系统的搭建

## 学习环境

各位小伙伴大家好，咱们接着前面的课程，继续讲解 GitHub 开源之旅第九季：Linux Bash 入门，现在咱们讲解第二个话题：实验环境的搭建。

首先，先看一下学习环境需要用到的软件和硬件。
- 一台 Linux 服务器，名字：LAB，IP 地址：192.168.29.166
- Linux 系统是 CentOS 7，安装在 vmware 虚拟机中

## 所需软件

- vmware workstation 12 Pro
  - vmware workstation 软件版本和下载位置演示一下
  - 软件的下载过程和安装过程略
- CentOS 7
  - CentOS 7 下载位置和版本，说明一下
  - CentOS 7 下载过程不再演示
- xshell
  - 通过 xshell 远程管理 linux 虚拟机，不在虚拟机界面中操作命令行，因为字体太小，体验不好
  - xshell 软件下载位置和版本说明一下，下载过程不再演示

## 空白虚拟机

- 创建 vmware 空白虚拟机
- 内存 1G
- 硬盘 50G
- 单一存储文件
- NAT 网络地址转换
- 编辑虚拟机配置，去掉声卡、U 盘和打印机

## 最小系统安装

- 加载安装光盘镜像文件，启动虚拟机
- 最小系统安装
- 设置 root 密码
- 创建 wangding 用户，并设置密码
- 将 wangding 用户放到管理员组中
- 设置区域和语言
- 设置安全策略
- 设置标准分区

## 安装必要的软件

- git，vim, net-tools
- 默认最小系统安装支持 SSH 协议
- 配置固定 IP 地址：192.168.29.166
- sudo nmtui
- root 账户编辑 /etc/sysconfig/network-scripts/ifcfg-enoxxx
- systemctl restart network
- 拍摄快照

## 安装 xshell

- xshell 连接虚拟机
- 讲解一下 xshell 的用法

