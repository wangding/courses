# 网络系统

各位小伙伴大家好，咱们接着前面的课程，继续讲解 GitHub 开源之旅第九季：Linux Bash 入门，现在咱们讲解第四个话题：柴米油盐之网络系统。

说到网络功能，好像没有什么是 Linux 不能做的。Linux 系统被用来创建各式各样的网络系统或者网络装置，包括：防火墙，路由器，域名服务器，网络存储，等等。当然，很多互联网公司或者创业公司，用 Linux 作为网站服务器或者数据库服务器，这更是稀松平常的事情了。

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

---

注意：大多数网络设备（包括 Linux 主机）都可以被配置为忽略这些数据包。通常，这样做是出于网络安全原因，部分地遮蔽一台主机免受一个潜在攻击者地侵袭。配置防火墙来阻塞 IMCP 流量也很普遍。

---

例如，看看我们能否连接到网站 www.baidu.com，我们可以这样使用 ping 命令：

    [wangding@LAB ~]$ ping www.baidu.com

一旦启动，ping 命令会持续在特定的时间间隔内（默认是一秒）发送数据包，直到它被中断：

    [wangding@LAB ~]$ ping linuxcommand.org

按下组合键 Ctrl-c，中断这个命令之后，ping 打印出运行统计信息。一个正常工作的网络会报告零个数据包丢失。一个成功执行的“ping”命令会意味着网络的各个部件（网卡，电缆，路由，网关）都处于正常的工作状态。

### netstat

netstat 程序被用来检查各种各样的网络设置和统计数据。通过此命令的许多选项，我们可以看看网络设置中的各种特性。使用“-ie”选项，我们能够查看系统中的网络接口：

    [wangding@LAB ~]$ netstat -ie
    eth0    Link encap:Ethernet HWaddr 00:1d:09:9b:99:67
            inet addr:192.168.1.2 Bcast:192.168.1.255 Mask:255.255.255.0
            inet6 addr: fe80::21d:9ff:fe9b:9967/64 Scope:Link
            UP BROADCAST RUNNING MULTICAST MTU:1500 Metric:1
            RX packets:238488 errors:0 dropped:0 overruns:0 frame:0
            TX packets:403217 errors:0 dropped:0 overruns:0 carrier:0
            collisions:0 txqueuelen:100 RX bytes:153098921 (146.0 MB) TX
            bytes:261035246 (248.9 MB) Memory:fdfc0000-fdfe0000

    lo      Link encap:Local Loopback
            inet addr:127.0.0.1 Mask:255.0.0.0
    ...

在上述实例中，我们看到我们的测试系统有两个网络接口。第一个，叫做 eth0，是以太网接口，和第二个，叫做 lo，是内部回环网络接口，它是一个虚拟接口，系统用它来“自言自语”。

当执行日常网络诊断时，要查看的重要信息是每个网络接口第四行开头出现的单词“UP”，说明这个网络接口已经生效，还要查看第二行中 inet addr 字段出现的有效 IP 地址。对于使用 DHCP（动态主机配置协议）的系统，在这个字段中的一个有效 IP 地址则证明了 DHCP 工作正常。

使用这个“-r”选项会显示内核的网络路由表。这展示了系统是如何配置网络之间发送数据包的。

    [wangding@LAB ~]$ netstat -r
    Kernel IP routing table
    Destination     Gateway     Genmask         Flags    MSS  Window  irtt Iface

    192.168.1.0     *           255.255.255.0   U        0    0          0 eth0
    default         192.168.1.1 0.0.0.0         UG       0    0          0 eth0

在这个简单的例子里面，我们看到了，位于防火墙之内的局域网中，一台客户端计算机的典型路由表。第一行显示了目的地 192.168.1.0。IP 地址以零结尾是指网络，而不是个人主机，所以这个目的地意味着局域网中的任何一台主机。下一个字段，Gateway，是网关（路由器）的名字或 IP 地址，用它来连接当前的主机和目的地的网络。若这个字段显示一个星号，则表明不需要网关。

最后一行包含目的地 default。指的是发往任何表上没有列出的目的地网络的流量。在我们的实例中，我们看到网关被定义为地址 192.168.1.1 的路由器，它应该能知道怎样来处理目的地流量。

netstat 程序有许多选项，我们仅仅讨论了几个。查看 netstat 命令的手册，可以得到所有选项的完整列表。

## 远程下载文件

远程下载文件，以前常用的命令是 ftp，当然，前提是需要有 ftp 服务器。现在我们用的更多的是 wget，wget 既可以从 ftp 服务器上下载文件，也可以从 http 的 web 服务器上下载文件。更重要的是 wget 支持断点续传。

### wget

另一个流行的用来下载文件的命令行程序是 wget。若想从网络和 FTP 网站两者上都能下载数据，wget 是很有用处的。不只能下载单个文件，多个文件，甚至整个网站都能下载。下载 linuxcommand.org 网站的首页，我们可以这样做：

    [wangding@LAB ~]$ wget http://linuxcommand.org/index.php
    --11:02:51-- http://linuxcommand.org/index.php
            => `index.php'
    Resolving linuxcommand.org... 66.35.250.210
    Connecting to linuxcommand.org|66.35.250.210|:80... connected.
    HTTP request sent, awaiting response... 200 OK
    Length: unspecified [text/html]

      [ <                        => ]        3,120       --.--K/s

    11:02:51 (161.75 MB/s) - 'index.php' saved [3120]

这个程序的许多选项允许 wget 递归地下载，在后台下载文件（你退出后仍在下载），能完成未下载全的文件。这些特性在命令手册，better-than-average 一节中有详尽地说明。

## 与远程主机安全通信

通过网络来远程操控类 Unix 的操作系统已经有很多年了。早些年，在因特网普遍推广之前，有一些受欢迎的程序被用来登录远程主机。它们是 rlogin 和 telnet 程序。然而这些程序，拥有和 ftp 程序一样的致命缺点；它们以明码形式来传输所有的交流信息（包括登录命令和密码）。这使它们完全不适合使用在因特网时代。

### ssh

为了解决这个问题，开发了一款新的协议，叫做 SSH（Secure Shell）。SSH 解决了这两个基本的和远端主机安全交流的问题。首先，它要认证远端主机是否为它所知道的那台主机（这样就阻止了所谓的“中间人”的攻击），其次，它加密了本地与远程主机之间所有的通讯信息。

SSH 由两部分组成。SSH 服务器运行在远端主机上运行，在端口号22上监听将要到来的连接，而 SSH 客户端用在本地系统中，用来和远端服务器通信。

大多数 Linux 发行版自带一个提供 SSH 功能的软件包，叫做 OpenSSH，来自于 BSD 项目。一些发行版默认包含客户端和服务器端两个软件包（例如，RedHat）,而另一些（比方说 Ubuntu）则只是提供客户端服务。为了能让系统接受远端的连接，它必须安装 OpenSSH-server 软件包，配置，运行它，并且（如果系统正在运行，或者是在防火墙之后）它必须允许在 TCP 端口号上接收网络连接。

---

小贴示：如果你没有远端系统去连接，但还想试试这些实例，则确认安装了 OpenSSH-server 软件包，则可使用 localhost 作为远端主机的名字。这种情况下，计算机会和它自己创建网络连接。

---

用来与远端 SSH 服务器相连接的 SSH 客户端程序，顺理成章，叫做 ssh。连接到远端名为 remote-sys 的主机，我们可以这样使用 ssh 客户端程序：

    [wangding@LAB ~]$ ssh remote-sys
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

也有可能使用不同的用户名连接到远程系统。例如，如果本地用户“me”，在远端系统中有一个帐号名“bob”，则用户 me 能够用 bob 帐号登录到远端系统，如下所示：

    [wangding@LAB ~]$ ssh bob@remote-sys
    bob@remote-sys's password:
    Last login: Sat Aug 30 13:03:21 2008
    [bob@remote-sys ~]$

正如之前所讲到的，ssh 验证远端主机的真实性。如果远端主机不能成功地通过验证，则会提示以下信息：

    [wangding@LAB ~]$ ssh remote-sys
    @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
    @
    WARNING: REMOTE HOST IDENTIFICATION HAS CHANGED!
    @
    @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
    IT IS POSSIBLE THAT SOMEONE IS DOING SOMETHING NASTY!
    Someone could be eavesdropping on you right now (man-in-the-middle
    attack)!
    ...

有两种可能的情形会提示这些信息。第一，某个攻击者企图制造“中间人”袭击。这很少见，因为每个人都知道 ssh 会针对这种状况发出警告。最有可能的罪魁祸首是远端系统已经改变了；例如，它的操作系统或者是 SSH 服务器重新安装了。然而，为了安全起见，第一个可能性不应该被轻易否定。当这条消息出现时，总要与远端系统的管理员查对一下。

当确定了这条消息归结为一个良性的原因之后，那么在客户端更正问题就很安全了。使用文本编辑器（可能是 vim）从文件~/.ssh/known_hosts 中删除废弃的钥匙，就解决了问题。在上面的例子里，我们看到这样一句话：

    Offending key in /home/me/.ssh/known_hosts:1

这意味着文件 known_hosts 里面某一行包含攻击型的钥匙。从文件中删除这一行，则 ssh 程序就能够从远端系统接受新的身份验证凭据。

除了能够在远端系统中打开一个 shell 会话，ssh 程序也允许我们在远端系统中执行单个命令。例如，在名为 remote-sys 的远端主机上，执行 free 命令，并把输出结果显示到本地系统 shell 会话中。

    [wangding@LAB ~]$ ssh remote-sys free
    wangding@twin4's password:
                total   used       free     shared buffers cached

    Mem:        775536  507184   268352          0  110068 154596

    -/+ buffers/cache: 242520  533016
    Swap: 0 1572856 0 110068 154596

    [wangding@LAB ~]$

有可能以更有趣的方式来利用这项技术，比方说下面的例子，我们在远端系统中执行 ls 命令，并把命令输出重定向到本地系统中的一个文件里面。

    [wangding@LAB ~]$ ssh remote-sys 'ls \*' > dirlist.txt
    wangding@twin4's password:
    [wangding@LAB ~]$

注意，上面的例子中使用了单引号。这样做是因为我们不想路径名展开操作在本地执行 ；而希望它在远端系统中被执行。同样地，如果我们想要把输出结果重定向到远端主机的文件中，我们可以把重定向操作符和文件名都放到单引号里面。

    [wangding@LAB ~]$ ssh remote-sys 'ls * > dirlist.txt'

>
> _SSH 通道_
>
> 当你通过 SSH 协议与远端主机建立连接的时候，其中发生的事就是在本地与远端系统之间创建了一条加密通道。通常，这条通道被用来把在本地系统中输入的命令安全地传输到远端系统，同样地，再把执行结果安全地发送回来。除了这个基本功能之外，SSH 协议允许大多数网络流量类型通过这条加密通道来被传送，在本地与远端系统之间创建某种 VPN（虚拟专用网络）。
>
> 可能这个特性的最普遍的用法是允许传递 X 窗口系统流量。在运行着 X 服务器（也就是，能显示 GUI 的机器）的系统中，有可能在远端启动和运行一个 X 客户端程序（一个图形化应用程序），而应用程序的显示结果出现在本地。这很容易完成，这里有个例子：假设我们正坐在一台装有 Linux 系统，叫做 LAB 的机器之前，且系统中运行着 X 服务器，现在我们想要在名为 remote-sys 的远端系统中运行 xload 程序，但是要在我们的本地系统中看到这个程序的图形化输出。我们可以这样做：
>
>     [wangding@LAB ~]$ ssh -X remote-sys
>     wangding@remote-sys's password:
>     Last login: Mon Sep 08 13:23:11 2008
>     [wangding@remote-sys ~]$ xload
>
> 这个 xload 命令在远端执行之后，它的窗口就会出现在本地。在某些系统中，你可能需要使用 “－Y” 选项，而不是 “－X” 选项来完成这个操作。

### scp 

这个 OpenSSH 软件包也包含两个程序，它们可以利用 SSH 加密通道在网络间复制文件。第一个，scp（安全复制）被用来复制文件，与熟悉的 cp 程序非常相似。最显著的区别就是源或者目标路径名要以远端主机的名字，后跟一个冒号字符开头。例如，如果我们想要从远端系统，remote-sys，的家目录下复制文档 document.txt，到我们本地系统的当前工作目录下，可以这样操作：

    [wangding@LAB ~]$ scp remote-sys:document.txt .
    wangding@remote-sys's password:
    document.txt
    100%        5581        5.5KB/s         00:00
    [wangding@LAB ~]$

和 ssh 命令一样，如果你所期望的远端主机帐户与你本地系统中的不一致，则可以把用户名添加到远端主机名的开头。

    [wangding@LAB ~]$ scp bob@remote-sys:document.txt .

