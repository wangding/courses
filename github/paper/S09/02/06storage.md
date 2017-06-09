# 存储媒介

各位小伙伴大家好，咱们接着前面的课程，继续讲解 GitHub 开源之旅第九季：Linux Bash 入门，现在咱们讲解第四个话题：柴米油盐之存储媒介。

前面课程，我们已经掌握了文件级别的数据操作。本次课程，我们将介绍设备级别的数据操作。Linux 有非常强大的设备管理能力。不管这个设备是物理设备还是虚拟设备。物理设备，比如说硬盘，网络设备。虚拟存储设备，比如 RAID（独立磁盘冗余阵列)和 LVM（逻辑卷管理器）。本次课，我们会介绍存储管理方面的基本概念以及存储设备管理的重要命令。

我们将学习以下命令：

- mount – 挂载一个文件系统
- umount – 卸载一个文件系统

## 挂载和卸载存储设备

Linux 的桌面系统，跟 windows 系统类似，可以很容易的管理存储设备。就是所谓的即插即用，我们只要把设备连接到系统中，它就能正常工作。但是，对于命令行系统，我们需要手工完成设备的挂载。

管理存储设备的第一步是把设备连接到文件系统树中，这个过程称为挂载，挂载就是允许设备参与到操作系统中。上篇的课程我们提到过，Linux 的设备挂载和 windows 有很大的不同，windows 会给 CD-ROM 或者 U 盘分配单独的盘符，而 Linux 只有一个唯一的根，我们需要把 CD-ROM 或者 U 盘挂载到这个根目录下的某个文件夹上，来维护整个目录树的统一和一致性。

/etc/fstab 文件保存着系统启动时要挂载的设备，其实就是硬盘分区。

    cat /etc/fstab

前面 # 号开头的是注释文字，有效内容是后面的四行，这些都是硬盘分区，每行都包括六个字段，这六个字段分别是：

<table class="multi">
<caption class="cap">表16-1: /etc/fstab 字段</caption>
<tr>
<th class="title">字段</th>
<th class="title">内容</th>
<th class="title">说明</th>
</tr>
<tr>
<td valign="top" width="8%">1</td>
<td valign="top" width="12%">设备 ID</td>
<td valign="top">
唯一的设备 ID。
</td>
</tr>
<tr>
<td valign="top">2</td>
<td valign="top">挂载点</td>
<td valign="top">设备所连接到的文件系统树的目录。
</td>
</tr>
<tr>
<td valign="top">3</td>
<td valign="top">文件系统类型</td>
<td valign="top">Linux 允许挂载许多文件系统类型。大多数本地的 Linux 文件系统是 ext3，但是也支持很多其它的，比方说 FAT16 (msdos), FAT32 (vfat)，NTFS (ntfs)，CD-ROM (iso9660)，等等。
</td>
</tr>
<tr>
<td valign="top">4</td>
<td valign="top">选项</td>
<td valign="top">文件系统可以通过各种各样的选项来挂载。有可能，例如，挂载只读的文件系统，或者挂载阻止执行任何程序的文件系统（一个有用的安全特性，避免删除媒介。）</td>
</tr>
<tr>
<td valign="top">5</td>
<td valign="top">频率</td>
<td valign="top">一位数字，指定是否和在什么时间用 dump 命令来备份一个文件系统。</td>
</tr>
<tr>
<td valign="top">6</td>
<td valign="top">次序</td>
<td valign="top">一位数字，指定 fsck 命令按照什么次序来检查文件系统。</td>
</tr>
</table>

## 查看挂载的文件系统列表

这个 mount 命令被用来挂载文件系统。执行这个不带参数的命令，将会显示一系列当前挂载的文件系统：

    [wangding@LAB ~]$ mount

这个列表的格式是：设备 on 挂载点 type 文件系统类型（选项）。例如，倒数第二行和倒数第三行，/dev/sda5 设备被挂载到 /home 目录类型是 xfs，并且是可读可写的。/dev/sda1 设备被挂载到 /boot 目录类型是 xfs，也是可读可写的。

现在我们把我们安装 Linux 操作系统的安装光盘镜像文件挂载上来。首先是创建一个新的光盘挂载点。所谓的挂载点就是文件系统树中的一个目录。它没有什么特殊的。它甚至不必是一个空目录。当你把设备挂载到了一个非空目录上，你就看不到这个目录中原来的内容了，直到你卸载这个设备。当然，一般我们都创建一个新目录：

    [wangding@LAB ~]$ sudo mkdir /mnt/cdrom

然后，我们把这个 CD-ROM 挂载到新的挂载点上。

    [wangding@LAB ~]$ sudo mount /dev/cdrom /mnt/cdrom

现在，咱们就可以通过这个新挂载点来查看 CD-ROM 的内容了：

    [wangding@LAB ~]$ cd /mnt/cdrom
    [wangding@LAB cdrom]$ ls
    [wangding@LAB cdrom]$ ls Packages

我们看到，Packages 目录下面有很多 rpm 文件，这就是我们安装 Linux 时，安装的软件包的来源。当然，我们可以把 CD-ROM 设置为 yum 源，如果服务器不能连接互联网时，我们可以从本地光盘来安装软件包。当然，设置本地光盘为 yum 源的前提是，我们能够把光盘挂载上来。至于接下来如何设置，我们等会再讲这个话题。现在咱们接着来说设备管理，现在我们再执行一个不带参数的 mount 命令，这个时候我们看到最后一行就是刚才挂载的光盘镜像。

    [wangding@LAB cdrom]$ mount

现在，我们试着卸载这个 CD-ROM，看看发生了什么事情。

    [root@LAB cdrom]# sudo umount /mnt/cdrom
    umount: /mnt/cdrom: device is busy

这是怎么回事呢？因为我们或者某个进程正在使用这个设备。我们当前的工作目录是 CD-ROM 的挂载点，这个导致设备忙碌。所以，只要更改一下当前的工作目录，题就解决了。我们把目前切换到家目录，然后再执行 umount 命令。

    [wangding@LAB cdrom]# cd
    [wangding@LAB ~]# sudo umount /mnt/cdrom

现在这个设备成功卸载了。

## 本地 yum 源

结合刚才介绍的设备管理的知识，以及上次课关于软件包管理的知识，下面给小伙伴们介绍一下如何利用安装光盘创建本地 yum 源。

首先，yum 源的配置文件在 /etc/yum.repos.d/ 目录下 \*.repo 文件就是 yum 源的配置文件，其中 CentOS-Base.repo 是 yum 网络源的配置文件，而 CentOS-Media.repo 是 yum 本地源的配置文件。

    ls /etc/yum.repos.d
    cat CentOS-Base.repo
    cat CentOS-Media.repo

默认，用的是网络 yum 源，如果想要使用本地 yum 源，CentOS-Media.repo 文件中的注释，已经告诉我们如何操作了。

首先我们需要挂载 CD-ROM 光盘镜像到 /media/cdrom/ 或者 /media/CentOS/ 或者 /media/cdrecorder/ 这三个目录的任意一个目录上。

    cd /media
    ls
    sudo mkdir cdrom
    ls
    sudo mount /dev/cdrom /media/cdrom
    ls /media/cdrom
    ls /media/cdrom/Packages
    sudo yum install git
    sudo yum erase git
    注意安装信息中的安装源信息

    sudo yum --disablerepo=\* --enablerepo=c7-media install git
    这个命令禁用其他所有安装源，只使用 CD-ROM 的本地源
    注意安装信息中的安装源信息

## 总结

好，这样本次课程的全部内容都讲完了，咱们一块看一下通关任务。看完本次课程的小伙伴请完成以下通关任务。
