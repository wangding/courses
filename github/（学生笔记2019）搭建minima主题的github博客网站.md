---
layout: post
title: "搭建minima主题的github博客网站"
date:   2019-04-20 19:20:20 +0800
---

鸣谢：王顶 老师（河北经贸大学，github：wangding），该文章为网络课程教学素材。  
我（吴甜甜）学习了王顶老师的github系列课程，并得到王顶老师网络指导多次。  

更多学习视频内容请登陆51CTO视频课，[【王顶】GitHub 开源之旅视频课程第八季：Jekyll 静态站](https://edu.51cto.com/course/10440.html)，全套课件见王顶老师的github仓库https://github.com/wangding/courses

---

```本文主旨：为非前端的**零基础**，**免费**拥有github.io**域名**并有兴趣**搭建简单的博客网站**朋友，提供从零开始的初级git、jekyll静态站技术，全套搭建流程及问题解决注解。```

本文写作顺序：1.先用自己的语言简要比喻下流程，让读者先熟悉下流程，这样搭建问题中出现的问题能有自己的解决思路。2.搭建流程，不含环境与软件安装。先过下顺序让心中有数。3.软件环境与环境搭建、问题解决解答。4.git的操作初级基础，上传仓库并打开欣赏自己的博客网站。5.在windows系统下上传自己博客文章。

观看本文前应具备Markdown语法及 linux 命令行操作基本基本语句语法。
---

# 我的博客网页wutiantian.github.io  

我大学时想有一个自己的网站，但是因为学的是“电子信息工程”专业，对前端方面并没有了解，以为要每年买百元的 COM 域名养着，还要自己搭建，所以一直搁置。  

本文的方法，是免费获得github旗下的域名方法，域名里要有 github 字样。例如：帐户名.github.io  
因为github是代码托管网站，所以有 1G 容量限制，搭建个人博客网站存储百篇文件适合。


技术大白话：  
我想要免费能睡觉的房子（属于自己的网站），拎包即住（要有基本的设施配备，可以有自己的文章图片存放处）。  

jekyll先生帮盖好毛坯房（自行搭建出框架，文件夹及文件）及床（一篇示例博客内容），bundle先生帮贴minima主题的墙纸。

so , 我们只需要把自己放进去 ( 文档上传_post文件夹中 ) 就可以啦！还得去房产交易中心(git上传文件，github分配固定的http地址)登记哟！


|简单|静态|博客形态|
|---:|:---:|:---|
|无需数据库，评论功能   |只用Makedown、Liquid、HTML&CSS就可以构建可部署的静态网站|自定义 |


# 搭建步骤  

- 新建项目  

在Github上创建空仓库，以你的“用户名.github.io”，例如：我的仓库名wutiantian.github.io

在本地电脑终端使用命令jekyll new blog新建一个blog文件夹。  
（注意：blog该词最终将改为上面Github上创建空仓库名，此处只是方便cd切换目录时方便输入。）    
得404.html  about.md  _config.yml  Gemfile  Gemfile.lock  index.md  _posts

此时， jekyll 先生任务全部完成。


- minima主题

命令bundle show minima
显示/usr/local/lib/ruby/gems/2.6.0/gems/minima-2.5.0
切换到该安装目录下查看ls
显示assets  _includes  _layouts  LICENSE.txt  README.md  _sass

把minima文件下的所有文件拷贝到blog文件夹下
cp -r  /usr/local/lib/ruby/gems/2.6.0/gems/minima-2.5.0/* .

此时， bundle 先生任务全部完成。


# 软件环境与环境搭建

- 安装软件
VMware12 pro、CentOS 7、xshell 5  
注意：  
（1）使用VMware pro版本，若下载Player免费个人版本则缺失“快照”功能。这将影响到：配置ip地址时，可能会因为虚拟系统关机等问题重新分配ip地址，需要重新配置xshell的参数。  
（2）[centOS官网下载](www.centos.org)。“DVD ISO”有4G容量；"Everything ISO"虚拟机下载这个，有4.2G容量；“Minimal ISO”,最小系统。  
（3）xshell6版本及以后是收费的，下载链接要通过邮箱验证，官方下载速度极慢。建议使用xshell中文版（工具菜单下语言设置，菜单和部分代码提示会变中文）。

Xshell是一个功能强大、十分实用的终端模拟软件，它支持Telnet、Rlogin、SSH、SFTP、Serial等远程协议，让用户能通过互联网直接连接远程主机，在windows界面下就可以轻松完成对linux服务器的控制操作，从而提高在复杂网络环境下的工作效率。
通过xshell软件远程控制服务器（centOS虚拟机），而不是在嘈杂的机房物理机器上直接操作。  
xshell和securecrt用它们来查看日志、排查定位问题。区别：
xshell特性：运维都用的xshell，对linux支持好；优点就是能够直接把window的文件拉进linux；有中文语言设置；界面好看。
securecrt特性：网工都用的securecrt；只有英文版，国内程序员都是汉化版的，常常会出错；

（1）环境准备
- 启动xshell

- 连接到linux虚拟机
在虚拟机上查看IP地址，命令行操作 ifconfig 查看并记录IP地址（注意，不用时挂起虚拟机即可，关机会造成IP地址改变）
xshell快捷键【Alt+o】会话窗口，将上一步的IP地址，centOS英文用户名teenie,及权限密码123456输入到会话框。
此处的teenie为我在虚拟机上的用户名，只是我个人的英文名，没有特殊功能意义。

（2） 安装配置Git 和VIM参数
安装命令 sudo yum install -y git vim  
查看安装命令 git --version显示git version 1.8.3.1则为成功  

- 安装Jekyll环境  
centOS里sudo yum install -y ruby安装时2.0版本并不是最新稳定版。  
Jekyll3.5版本需要ruby新稳定版本  

1.root用户下执行yum install -y wget bzip2  
安装wget从网上下载安装包,安装bzip2用来压缩和解压缩工具。两个工具安装很快，内容很小。

2.安装ruby install
打开github网站，搜索栏里输入“ruby install”  
点击搜索结果“postmodern/ruby-install”  
点进仓库，看markdown文档里内容“Install”下执行语句  
wget -O ruby-install-0.7.0.tar.gz https://github.com/postmodern/ruby-install/archive/v0.7.0.tar.gz
tar -xzvf ruby-install-0.7.0.tar.gz  
cd ruby-install-0.7.0/  
sudo make install  

三步操作后可以删除压缩包ruby-install-0.7.0.tar.gz

把ruby安装在系统目录下
ruby-install --system ruby
过程会比较复杂，会安装ruby依赖包，会下载ruby源代码压缩包，会编译.c文件成为中间.o文件，编译完后会链接，检查系统环境，make生成运行环境后安装。安装时间长10分钟。
提示：Successfully installed ruby 2.6.2 into /usr/local则安装成功。
再确认ruby版本 ruby -v得ruby 2.6.2p47 (2019-03-13 revision 67232) [x86_64-linux]


用包管理gem安装jekll，命令为gem install jekyll
检查命令jekyll --help

若可以运行，会提示jekyll用法、简介：是博客生成器，用ruby语言写的。子命令列表说明，常用命令有new
常用用法：
new后跟网站名字即目录名，功能为:产生blog目录下基本框架文件。
build功能为：生成网站。_posts文件下多为md及基本文本文件，根据模板将文本内容生成html文件，将文件放到site目录下。
serve, server, s这三个命令都可以用。serve把网站运行起来，通过http协议来访问他，提供网站预览功能。
利用jekyll工具，可以在本地linux工作站搭建出网站，通过本地浏览器通过http可以链接到IP地址上

【错误及解决】  
若安装失败，提示：make g++:命令未找到；make:***[binder.o] 错误 127；make failed,exit code 2  
问题：需要编译一个项目的时候在装g++都装不上    
分析：缺少g++ 。百度一下centos7 g++,查一下yum install哪个安装包     
解决方法：一直提示这个错误，后面参考网上资料用： yum install gcc-c++然后输入g++ -v查看版本  

安装gem install bundler

安装完成后，退出root用户，回到普通用户模式。命令exit或者su teenie。



# git的操作初级操作

![Git基本三大关系域](https://images2015.cnblogs.com/blog/311549/201601/311549-20160121135709890-1864028072.png)

git init  
（此时，多了一个隐藏的git文件夹“.git”）  
git add .  
(add空格后的点，代表“当前目录下左右所有文件”提交到暂存区)  
git status  
(此时会发现各个待上传的文件名为红色的)  
git commit -m "commit"  
（此时将文件提交到本地仓库Repository，发现各个待上传的文件名为绿色的）
到github网站上创建仓库blog与本地同名
推送
git remote add origin https://github.com/wutiantian/wutiantian.github.io
（此时将本地与远程Remote仓库HTTP地址进行绑定）
git push -u origin master
（此时将本地仓库文件推送到远程Remote仓库中）

此刻，已经完成了博客网站搭建，可以打开你的用户名.github.io博客网址。已经有你yml头上配置的信息。
将仓库克隆到windows桌面
命令git clone  https://github.com/wutiantian/wutiantian.github.io


# 添加个人信息过程  

住宾馆和自己的家不同，自己的家一定有自己的标记，或是邋遢或是有自己的标记。

>样式框架,定制定化样式改写  
更改_config.yml文件  
把title：的内容改为“吴甜甜的个人博客”，  
email：的内容改为“wutiantian52@outlook.coms”。  
（注意，此处的邮箱可以不用是github邮箱账号，没有同步要求）  
description的下一行正文改为自己的简述：吴甜甜的个人博客网站。欢迎发送邮件技术交流！


# 在windows系统上传自己博客文章

>在框架网页上添加新文章  

打开_posts目录，将md文件放到文件夹下。
注意将yml头信息复制到文章首行。


>图片  

创建mkdir images
将图片拷贝到此文件夹

>上传步骤见： git的操作初级操作， 部分。

# 3分钟建博客站
如果感觉搭建过程安装复杂，可直接看后3个部分：git的操作初级操作、添加个人信息过程 、在windows系统下上传自己博客文章。修改yml头信息与上传自己的makedown文章即可。