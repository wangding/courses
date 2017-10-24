# 网络系统

各位小伙伴大家好，咱们接着前面的课程，继续讲解 GitHub 开源之旅第九季：Linux Bash 入门，现在咱们讲解第四个话题：柴米油盐之网络系统。

说到网络功能，好像没有什么是 Linux 不能做的。Linux 系统被用来创建各式各样的网络系统或者网络设备，包括：防火墙，路由器，域名服务器，网络存储，等等。当然，很多互联网公司或者创业公司，用 Linux 作为网站服务器或者数据库服务器，这更是稀松平常的事情了。

Linux 有丰富和大量的网络操作命令。本次课我们仅介绍一些最常使用的命令。我们要讲解的命令包括那些被用来监测网络和传输文件的命令。另外，我们还会探讨用来远端登录的 ssh 程序。要介绍的命令列表如下：

- ping - 发送 ICMP ECHO_REQUEST 软件包到网络主机
- netstat - 打印网络连接，路由表，接口统计数据，伪装连接，和多路广播成员
- wget - 非交互式网络下载器
- ssh - OpenSSH SSH 客户端（远程登录程序）

我们假定你已经多少知道了一点网络知识。在这个互联网时代，每个人多少都需要懂一些基本的网络概念。这里我们假设小伙伴们至少知道：

- 什么是 IP 地址
- 什么是主机和域名
- 什么是 URL

## 检查和监测网络

即使你不是一名系统管理员，检查一下网络的性能或者运作情况也是经常有帮助的。

### ping

最基本的网络命令是 ping。这个 ping 命令发送一个特殊的网络数据包，叫做 ICMP ECHO_REQUEST，到一台指定的主机。大多数接收这个包的网络设备将会回复它，来允许网络连接验证。

例如，看看我们能否连接到网站 www.baidu.com ，我们可以这样使用 ping 命令：

    [wangding@LAB ~]$ ping www.baidu.com
    [wangding@LAB ~]$ ping selenium.wangding.in
    [wangding@LAB ~]$ ping sample.wangding.in

一旦启动，ping 命令会持续在特定的时间间隔内（默认是一秒）发送数据包，直到它被中断。按下 Ctrl-C，中断这个命令之后，ping 打印出运行统计信息。一个正常工作的网络会报告零个数据包丢失。一个成功执行的“ping”命令会意味着网络的各个部件（网卡，电缆，路由，网关）都处于正常的工作状态。

再举一个失败的例子，随便 ping 一个 IP 地址，看看有什么结果。看不到任何返回数据吧，然后 Ctrl-C，看到所有包都丢失了。这说明，这个 IP 地址的网络设备不可到达，那么是什么原因不可到达呢？这就需要我们掌握网络排错的方法了。

    [wangding@LAB ~]$ ping 192.168.20.20
    
你可以 ping 127.0.0.1 或者 ping 192.168.130.133 这两个都是本机的 IP 地址，如果正常说明本地的网络能够正常工作。然后 ping 192.168.130.2 这是网关地址，如果没有问题，说明网关正常。那么最后可以断定，192.168.20.20 这个网络设备当机了，或者 IP 地址有误。别看这个 ping 命令非常简单，但是却非常好用，我们一般上不了网的时候，都会先从本机地址到网关地址，再到被访问的地址 ping 一遍，来判断网络故障处在哪里。那可能有的小伙伴要问了，我怎么知道，我网卡的 IP 地址呢？下面咱们讲 netstat 命令可以帮你获得这方面的信息。

### netstat

netstat 是 network statistics 的简写，network 是网络的意思，statistics 是统计的意思。netstat 程序被用来检查各种各样的网络设置和统计数据。通过此命令的许多选项，我们可以看看网络设置中的各种特性。使用“-ie”选项，我们能够查看系统中的网络接口，这个命令的执行结果跟 ifconfig 命令的运行结果相同，但是 netstat 的功能更强大：

    [wangding@LAB ~]$ netstat -ie
    [wangding@LAB ~]$ ifconfig 
    Kernel Interface table
    ens32: flags=4163<UP,BROADCAST,RUNNING,MULTICAST>  mtu 1500
        inet 192.168.130.133  netmask 255.255.255.0  broadcast 192.168.130.255
        inet6 fe80::62a2:9285:d4e0:e892  prefixlen 64  scopeid 0x20<link>
        ether 00:0c:29:4b:2a:90  txqueuelen 1000  (Ethernet)
        RX packets 67507  bytes 55344027 (52.7 MiB)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 31030  bytes 9637317 (9.1 MiB)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0

    lo: flags=73<UP,LOOPBACK,RUNNING>  mtu 65536
        inet 127.0.0.1  netmask 255.0.0.0
        inet6 ::1  prefixlen 128  scopeid 0x10<host>
        loop  txqueuelen 1  (Local Loopback)
        RX packets 746  bytes 63144 (61.6 KiB)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 746  bytes 63144 (61.6 KiB)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0

我们看到实验环境的 Linux 虚拟机有两个网络接口。第一个，叫做 ens32，是以太网接口，第二个，叫做 lo，是内部回环网络接口，它是一个虚拟接口，系统用它来“自言自语”。

当执行日常网络诊断时，要查看的重要信息是每个网络接口出现的单词“UP”，说明这个网络接口已经生效，还要查看第二行中 inet addr 字段出现的有效 IP 地址。对于使用 DHCP（动态主机配置协议）的系统，在这个字段中的一个有效 IP 地址则证明了 DHCP 工作正常。

使用这个“-rn”选项会显示内核的网络路由表。这展示了系统是如何配置网络之间发送数据包的。

    [wangding@LAB ~]$ netstat -rn
    Kernel IP routing table
    Destination     Gateway         Genmask         Flags   MSS Window  irtt Iface
    0.0.0.0         192.168.130.2   0.0.0.0         UG        0 0          0 ens32
    192.168.130.0   0.0.0.0         255.255.255.0   U         0 0          0 ens32
    
我们看到位于防火墙之内的局域网中，一台客户端计算机的典型路由表。

第一行包含目的地 0.0.0.0。指的是所有不知道路由信息的 IP 地址，在这里，我们看到网关被定义为地址 192.168.130.2 的路由器，它应该能知道怎样来处理目的地流量。

第二行显示了目的地 192.168.130.0。IP 地址以零结尾是指网络，而不是主机地址，所以这个目的地意味着局域网中的任何一台主机。这个网段和网卡的 IP 地址在同一个网段，所以不需要路由信息，显示的网关 IP 为 0.0.0.0 表明不需要网关。

netstat 程序有许多选项，也有很多用法，我们仅仅讨论了两个。小伙伴们可以查看 netstat 命令手册，进一步深入的学习。

## 与远程主机安全通信


通过网络来远程操控类 Unix 的操作系统已经有很多年了。早些年，在因特网普遍推广之前，有一些受欢迎的程序被用来登录远程主机。它们是 rlogin 和 telnet 程序。然而这些程序，拥有和 ftp 程序一样的致命缺点；它们以明码形式来传输所有的交流信息（包括登录命令和密码）。这使它们完全不适合使用在因特网时代。

### ssh

为了解决这个问题，开发了一款新的协议，叫做 SSH（Secure Shell）。SSH 解决了这两个基本的和远端主机安全交流的问题。首先，它要认证远端主机是否为它所知道的那台主机（这样就阻止了所谓的“中间人”的攻击），其次，它加密了本地与远程主机之间所有的通讯信息。

SSH 由两部分组成。SSH 服务器运行在远端主机上运行，在端口号 22 上监听将要到来的连接，而 SSH 客户端用在本地系统中，用来和远端服务器通信。

大多数 Linux 发行版自带一个提供 SSH 功能的软件包，叫做 OpenSSH，来自于 BSD 项目。一些发行版默认包含客户端和服务器端两个软件包（例如，RedHat）,而另一些（比方说 Ubuntu）则只是提供客户端服务。为了能让系统接受远端的连接，它必须安装 OpenSSH-server 软件包，配置，运行它，并且（如果系统正在运行，或者是在防火墙之后）它必须允许在 TCP 端口号上接收网络连接。

用来与远端 SSH 服务器相连接的 SSH 客户端程序，顺理成章，叫做 ssh。连接到远端名为 remote-sys 的主机，我们可以这样使用 ssh 客户端程序：

    [wangding@LAB ~]$ ssh 192.168.130.144
    The authenticity of host 'remote-sys (192.168.1.4)' can't be
    established.
    RSA key fingerprint is
    41:ed:7a:df:23:19:bf:3c:a5:17:bc:61:b3:7f:d9:bb.
    Are you sure you want to continue connecting (yes/no)?

第一次尝试连接，提示信息表明远端主机的真实性不能确立。这是因为客户端程序以前从没有看到过这个远端主机。为了接受远端主机的身份验证凭据，输入“yes”。一旦建立了连接，会提示用户输入他或她的密码：

    Warning: Permanently added 'remote-sys,192.168.1.4' (RSA) to the list
    of known hosts.
    wangding@remote-sys's password:

成功地输入密码之后，我们会接收到远端系统的 shell 提示符：

    Last login: Sat Aug 30 13:00:48 2008
    [wangding@remote-sys ~]$

远端 shell 会话一直存在，直到用户输入 exit 命令后，则关闭了远程连接。这时候，本地的 shell 会话恢复，本地 shell 提示符重新出现。

也有可能使用不同的用户名连接到远程系统。例如，如果本地用户“wangding”，在远端系统中有一个帐号名“root”，则用户 wangding 能够用 root 帐号登录到远端系统，如下所示：

    [wangding@LAB ~]$ ssh root@192.168.130.133
    root@192.168.130.133's password:
    Last login: Sat Aug 30 13:03:21 2008

    [root@LAB ~]$

除了能够在远端系统中打开一个 shell 会话，ssh 程序也允许我们在远端系统中执行单个命令。例如，在名为 remote-sys 的远端主机上，执行 free 命令，并把输出结果显示到本地系统 shell 会话中。

    [wangding@LAB ~]$ ssh 192.168.130.133 free -h
    wangding@192.168.130.133's password: 
                  total        used        free      shared  buff/cache   available
    Mem:           976M        114M        357M         12M        505M        668M
    Swap:          2.0G          0B        2.0G

    [wangding@LAB ~]$

有可能以更有趣的方式来利用这项技术，比方说下面的例子，我们在远端系统中执行 ls 命令，并把命令输出重定向到本地系统中的一个文件里面。

    [wangding@LAB ~]$ ssh 192.168.130.133 'ls /' > dirlist.txt
    wangding@192.168.130.133's password:
    [wangding@LAB ~]$

注意，上面的例子中使用了单引号。这样做是因为我们不想路径名展开操作在本地执行 ；而希望它在远端系统中被执行。同样地，如果我们想要把输出结果重定向到远端主机的文件中，我们可以把重定向操作符和文件名都放到单引号里面。

    [wangding@LAB ~]$ ssh remote-sys 'ls * > dirlist.txt'

我们稍微总结一下啊。从 windows 远程连接 Linux 我们用的是 XShell 软件，其实类似的软件很多，免费开源的有 Putty，其实他的底层走的还是 ssh 协议，这一点我们在 windows 上运行 netstat -b，就能看出来了。问题是如果从一个 linux 系统，远程连接另一个 linux 系统，怎么办呢？我们 linux 是命令行系统，有 XShell 和 Putty 给我们用吗？这些可都是图形用户界面的软件。

### scp 

这个 OpenSSH 软件包也包含两个程序，它们可以利用 SSH 加密通道在网络间复制文件。一个是 scp，另一个是 sftp，我们只讲一下 scp。scp（secure copy 安全复制）被用来复制文件，与熟悉的 cp 程序非常相似。最显著的区别就是源或者目标路径名要以远端主机的名字，后跟一个冒号字符开头。例如，如果我们想要从远端系统，remote-sys，的家目录下复制文档 document.txt，到我们本地系统的当前工作目录下，可以这样操作：

    [wangding@LAB ~]$ scp 192.168.130.133:foo.txt .
    wangding@192.168.130.133's password:
    document.txt
    100%        5581        5.5KB/s         00:00
    [wangding@LAB ~]$

和 ssh 命令一样，如果你所期望的远端主机帐户与你本地系统中的不一致，则可以把用户名添加到远端主机名的开头。

    [wangding@LAB ~]$ scp root@192.168.130.133:foo.txt .

## 配置固定 IP 地址（略）

咱们刚开始安装 CentOS 最小系统的时候，选择的是 DHCP 自动获取 IP 地址，这样的好处是安装完操作系统后，在不具备太多的 Linux 基础知识的前提下，小伙伴们就能够快速上手使用 Linux。缺点是这样的系统如果重新启动几次之后，可能 IP 地址就会变化，这样 XShell 可能就连不上实验环境了。正好我们现在讲到 Linux 的网络知识，咱们现在一块来解决一下这个问题。

首先我们简单说明一下什么是静态 IP 地址，或者固定 IP 地址，什么是动态 IP 地址。对于静态 IP 地址，每个电脑主机上，需要给网卡手工设置一个 IP 地址，除了 IP 地址，还需要设置其他一些参数，包括：网关、子网掩码、DNS，等信息。对于一个新手用户，这些概念都不知道是什么的前提下，做这些操作，显然有很多困难。而且，这还不是最致命的问题。最致命的问题是，如果每个人都是手动设置的 IP 地址，在一个机器数量比较多的网络环境中，比如，有二百台电脑的公司办公环境中，很有可能会有人设置的 IP 地址相同，这就会导致 IP 地址

## 通过 XShell 在 windows 和 Linux 中传递文件（略）

333

