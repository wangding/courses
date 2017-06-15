# 归档和备份

各位小伙伴大家好，咱们接着前面的课程，继续讲解 GitHub 开源之旅第九季：Linux Bash 入门，现在咱们讲解第五个话题：七年之痒之归档和备份。

系统管理员的一个主要任务是保护数据安全，保护数据的主要方式之一是备份。即使你不是一名系统管理员，在各个位置和设备之间拷贝或移动大量文件，也是很常见的操作。

本次课程，我们将介绍几个常用的文件归档备份命令。它们分别是：

- gzip – 压缩或者展开文件
- tar – 磁带打包工具
- rsync – 同步远端文件和目录

## 压缩文件

### gzip

我们先介绍 gizp 命令。gzip 是 GNU zip 两个单词的简写，zip 单词是压缩。gzip 程序被用来压缩一个或多个文件。当执行 gzip 命令时，原始文件的压缩版会替代原始文件。相对应的 gunzip 程序被用来把压缩文件复原。举个个例子：

    [wangding@LAB ~]$ ls -l /etc > foo.txt
    [wangding@LAB ~]$ ls -lh
    -rw-r--r-- 1 me     me 15738 2008-10-14 07:15 foo.txt
    [wangding@LAB ~]$ gzip foo.txt
    [wangding@LAB ~]$ ls -lh 
    -rw-r--r-- 1 me     me 3230 2008-10-14 07:15 foo.txt.gz
    [wangding@LAB ~]$ gunzip foo.txt.gz
    [wangding@LAB ~]$ ls -lh
    -rw-r--r-- 1 me     me 15738 2008-10-14 07:15 foo.txt

在这个例子里，我们创建了一个名为 foo.txt 的文本文件，其内容包含一个目录的列表清单。接下来，我们运行 gzip 命令，它会把原始文件替换为一个叫做 foo.txt.gz 的压缩文件。在foo.\* 文件列表中，我们看到原始文件已经被压缩文件替代了，并将这个压缩文件大约是原始文件的五分之一。我们也能看到压缩文件与原始文件有着相同的权限和时间戳。接下来，我们运行 gunzip 程序来解压缩文件。随后，我们能见到压缩文件已经被原始文件替代了，同样地保留了相同的权限和时间戳。

gzip 命令有许多选项。这里列出了一些：

<table class="multi">
<caption class="cap">表19-1: gzip 选项 </caption>
<tr>
<th class="title">选项</th>
<th class="title">说明</th>
</tr>
<tr>
<td valign="top" width="25%">-c </td>
<td valign="top">把输出写入到标准输出，并且保留原始文件。也有可能用--stdout 和--to-stdout 选项来指定。 </td>
</tr>
<tr>
<td valign="top">-d</td>
<td
valign="top">解压缩。正如 gunzip 命令一样。也可以用--decompress 或者--uncompress 选项来指定. </td>
</tr>
<tr>
<td valign="top">-f</td>
<td valign="top">强制压缩，即使原始文件的压缩文件已经存在了，也要执行。也可以用--force 选项来指定。 </td>
</tr>
<tr>
<td valign="top">-h</td>
<td valign="top">显示用法信息。也可用--help 选项来指定。</td>
</tr>
<tr>
<td valign="top">-l</td>
<td valign="top">列出每个被压缩文件的压缩数据。也可用--list 选项。 </td>
</tr>
<tr>
<td valign="top">-r</td>
<td valign="top">若命令的一个或多个参数是目录，则递归地压缩目录中的文件。也可用--recursive 选项来指定。 </td>
</tr>
<tr>
<td valign="top">-t</td>
<td valign="top">测试压缩文件的完整性。也可用--test 选项来指定。</td>
</tr>
<tr>
<td valign="top">-v</td>
<td valign="top">显示压缩过程中的信息。也可用--verbose 选项来指定。 </td>
</tr>
<tr>
<td valign="top">-number</td>
<td valign="top">设置压缩指数。number 是一个在1（最快，最小压缩）到9（最慢，最大压缩）之间的整数。数值1和9也可以各自用--fast 和--best 选项来表示。默认值是整数6。 </td>
</tr>
</table>

返回到我们之前的例子中：

    [wangding@LAB ~]$ gzip foo.txt
    [wangding@LAB ~]$ gzip -tv foo.txt.gz
    foo.txt.gz: OK
    [wangding@LAB ~]$ gzip -d foo.txt.gz

这里，我们用压缩文件来替代文件 foo.txt，压缩文件名为 foo.txt.gz。下一步，我们测试了压缩文件的完整性，使用了-t 和-v 选项。

    [wangding@LAB ~]$ ls -l /etc | gzip > foo.txt.gz

这个命令创建了一个目录列表的压缩文件。

这个 gunzip 程序，会解压缩 gzip 文件，假定那些文件名的扩展名是.gz，所以没有必要指定它，只要指定的名字与现有的未压缩文件不冲突就可以：

    [wangding@LAB ~]$ gunzip foo.txt

如果我们的目标只是为了浏览一下压缩文本文件的内容，我们可以这样做：

    [wangding@LAB ~]$ gunzip -c foo.txt | less

另外，对应于 gzip 还有一个程序，叫做 zcat，它等同于带有-c 选项的 gunzip 命令。它可以被用来如 cat 命令作用于 gzip 压缩文件：

    [wangding@LAB ~]$ zcat foo.txt.gz | less

## 归档文件

下面咱们聊一下文件归档，归档通常和文件压缩一块使用，归档也是一个很常见的文件管理操作。归档就是把多个文件或目录合并成一个大文件的过程。归档经常作为系统备份来使用。当把旧数据从一个系统移到其他存储设备时，也会用到归档操作。

### tar

在类 Unix 的软件世界中，tar 是归档文件的经典工具。tar 是 tape archive 的简称，揭示了它的根源，它最早是一款制作磁带备份的工具。现在它仍然被用来完成传统任务，当然现在已经适用于各种最新的存储设备了。我们经常看到扩展名为 .tar 或者 .tgz 的文件，它们各自表示“普通”的 tar 包和被 gzip 程序压缩过的 tar 包。一个 tar 包可以由一组独立的文件，一个或者多个目录，或者两者混合体组成。命令语法如下：

    tar mode[options] pathname...

这里的 mode 是指以下操作模式（这里只展示了一部分，查看 tar 的手册来得到完整列表）之一：

<table class="multi">
<caption class="cap">表19-2: tar 模式</caption>
<tr>
<th class="title">模式</th>
<th class="title">说明</th>
</tr>
<tr>
<td valign="top" width="25%">c</td>
<td valign="top">为文件和／或目录列表创建归档文件。 </td>
</tr>
<tr>
<td valign="top">x</td>
<td valign="top">抽取归档文件。</td>
</tr>
<tr>
<td valign="top">r</td>
<td valign="top">追加具体的路径到归档文件的末尾。</td>
</tr>
<tr>
<td valign="top">t</td>
<td valign="top">列出归档文件的内容。</td>
</tr>
</table>

tar 命令的选项比较特别，这里我们需要额外注意一下。所有的选项前面都没有横杠，为了展示 tar 的工作方式。首先，让我们创建一个实验环境:

    [wangding@LAB ~]$ mkdir -p playground/dir-{00{1..9},0{10..99},100}
    [wangding@LAB ~]$ touch playground/dir-{00{1..9},0{10..99},100}/file-{A..Z}
    [wangding@LAB ~]$ ls -R playground

你会看到，我们用两个命令创建了一百个目录，每个目录下创建了二十六个文件，总共创建了两千六百个文件。下面，我们在这个实验环境中讲解 tar 命令的使用：

    [wangding@LAB ~]$ tar cf playground.tar playground

这个命令创建了一个名为 playground.tar 的 tar 包，其包含整个 playground 目录层次。我们可以看到模式 c 和选项 f，其被用来指定这个 tar 包的名字，模式和选项可以写在一起，而且不需要开头的短横线。注意，然而，必须首先指定模式，然后才是其它的选项。

要想列出归档文件的内容，我们可以这样做：

    [wangding@LAB ~]$ tar tf playground.tar

为了得到更详细的列表信息，我们可以添加选项 v：

    [wangding@LAB ~]$ tar tvf playground.tar

现在，抽取 tar 包 playground 到一个新位置。我们先创建一个名为 foo 的新目录，更改目录，然后抽取 tar 包中的文件：

    [wangding@LAB ~]$ mkdir foo
    [wangding@LAB ~]$ cd foo
    [wangding@LAB ~]$ tar xf ../playground.tar
    [wangding@LAB ~]$ ls
    playground

如果我们检查 ~/foo/playground 目录中的内容，会看到这个归档文件已经被成功地安装了，就是创建了一个精确的原始文件的副本。

注意一下 tar 命令处理归档文件路径的方式。默认情况下，路径名是相对的，而不是绝对路径。当创建归档文件的时候，tar 命令会简单地删除路径名开头的斜杠。为了说明问题，我们将会重新创建我们的归档文件，这次指定一个绝对路径：

    [wangding@LAB foo]$ cd
    [wangding@LAB ~]$ tar cf playground2.tar ~/playground

记住，当按下回车键后，~/playground 会展开成 /home/me/playground，所以我们将会得到一个绝对路径名。接下来，和之前一样我们会抽取归档文件，观察发生什么事情：

    [wangding@LAB ~]$ cd foo
    [wangding@LAB foo]$ tar xf ../playground2.tar
    [wangding@LAB foo]$ ls
    home     playground
    [wangding@LAB foo]$ ls home
    me
    [wangding@LAB foo]$ ls home/me
    playground

这里我们看到当我们抽取第二个归档文件时，它重新创建了 home/me/playground 目录，相对于我们当前的工作目录，~/foo，而不是相对于 root 目录，作为带有绝对路径名的案例。这看起来似乎是一种奇怪的工作方式，但事实上这种方式很有用，因为这样就允许我们抽取文件到任意位置，而不是强制地把抽取的文件放置到原始目录下。

当抽取一个归档文件时，有可能限制从归档文件中抽取什么内容。例如，如果我们想要抽取单个文件，可以这样实现：

    tar xf archive.tar pathname

通过给命令添加末尾的路径名，tar 命令就只会恢复指定的文件。可以指定多个路径名。注意路径名必须是完全的，精准的相对路径名，就如存储在归档文件中的一样。当指定路径名的时候，通常不支持通配符；然而，GNU 版本的 tar 命令（在 Linux 发行版中最常出现）通过 -\-wildcards 选项来支持通配符。这个例子使用了之前 playground.tar 文件：

    [wangding@LAB ~]$ cd foo
    [wangding@LAB foo]$ tar xf ../playground2.tar --wildcards 'home/me/playground/dir-\*/file-A'

这个命令将只会抽取匹配特定路径名的文件，路径名中包含了通配符 dir-\*。

tar 命令经常结合 find 命令一起来制作归档文件。在这个例子里，我们将会使用 find 命令来产生一个文件集合，然后这些文件被包含到归档文件中。

    [wangding@LAB ~]$ find playground -name 'file-A' -exec tar rf playground.tar '{}' '+'

这里我们使用 find 命令来匹配 playground 目录中所有名为 file-A 的文件，然后使用-exec 行为，来唤醒带有追加模式（r）的 tar 命令，把匹配的文件添加到归档文件 playground.tar 里面。

使用 tar 和 find 命令，来创建逐渐增加的目录树或者整个系统的备份，是个不错的方法。通过 find 命令匹配新于某个时间戳的文件，我们就能够创建一个归档文件，其只包含新于上一个 tar 包的文件，假定这个时间戳文件恰好在每个归档文件创建之后被更新了。

tar 命令也可以利用标准输出和输入。这里是一个完整的例子:

    [wangding@LAB foo]$ cd
    [wangding@LAB ~]$ find playground -name 'file-A' | tar cf - --files-from=-
       | gzip > playground.tgz

在这个例子里面，我们使用 find 程序产生了一个匹配文件列表，然后把它们管道到 tar 命令中。如果指定了文件名“-”，则其被看作是标准输入或输出，正是所需（顺便说一下，使用“-”来表示标准输入／输出的惯例，也被大量的其它程序使用）。这个 -\-file-from 选项（也可以用 -T 来指定）导致 tar 命令从一个文件而不是命令行来读入它的路径名列表。最后，这个由 tar 命令产生的归档文件被管道到 gzip 命令中，然后创建了压缩归档文件 playground.tgz。此 .tgz 扩展名是命名由 gzip 压缩的 tar 文件的常规扩展名。有时候也会使用 .tar.gz 这个扩展名。

虽然我们使用 gzip 程序来制作我们的压缩归档文件，但是现在的 GUN 版本的 tar 命令，gzip 和 bzip2 压缩两者都直接支持，各自使用 z 和 j 选项。以我们之前的例子为基础，我们可以这样简化它：

    [wangding@LAB ~]$ find playground -name 'file-A' | tar czf playground.tgz -T -

如果我们本要创建一个由 bzip2 压缩的归档文件，我们可以这样做：

    [wangding@LAB ~]$ find playground -name 'file-A' | tar cjf playground.tbz -T -

通过简单地修改压缩选项，把 z 改为 j（并且把输出文件的扩展名改为 .tbz，来指示一个 bzip2 压缩文件），就使 bzip2 命令压缩生效了。另一个 tar 命令与标准输入和输出的有趣使用，涉及到在系统之间经过网络传输文件。假定我们有两台机器，每台都运行着类 Unix，且装备着 tar 和 ssh 工具的操作系统。在这种情景下，我们可以把一个目录从远端系统（名为 remote-sys）传输到我们的本地系统中：

    [wangding@LAB ~]$ mkdir remote-stuff
    [wangding@LAB ~]$ cd remote-stuff
    [wangding@LAB remote-stuff]$ ssh remote-sys 'tar cf - Documents' | tar xf -
    wangding@remote-sys’s password:
    [wangding@LAB remote-stuff]$ ls
    Documents

这里我们能够从远端系统 remote-sys 中复制目录 Documents 到本地系统名为 remote-stuff 目录中。我们怎样做的呢？首先，通过使用 ssh 命令在远端系统中启动 tar 程序。你可记得 ssh 允许我们在远程联网的计算机上执行程序，并且在本地系统中看到执行结果——远端系统中产生的输出结果被发送到本地系统中查看。我们可以利用。在本地系统中，我们执行 tar 命令，

## 同步文件和目录

维护系统备份的常见策略是保持一个或多个目录与另一个本地系统（通常是某种可移动的存储设备）或者远端系统中的目录（或多个目录）同步。我们可能，例如有一个正在开发的网站的本地备份，需要时不时的与远端网络服务器中的文件备份保持同步。在类 Unix 系统的世界里，能完成此任务且备受人们喜爱的工具是 rsync。这个程序能同步本地与远端的目录，通过使用 rsync 远端更新协议，此协议允许 rsync 快速地检测两个目录的差异，执行最小量的复制来达到目录间的同步。比起其它种类的复制程序，这就使 rsync 命令非常快速和高效。

rsync 被这样唤醒：

    rsync options source destination

这里 source 和 destination 是下列选项之一：

- 一个本地文件或目录
- 一个远端文件或目录，以[user@]host:path 的形式存在
- 一个远端 rsync 服务器，由 rsync://[user@]host[:port]/path 指定

注意 source 和 destination 两者之一必须是本地文件。rsync 不支持远端到远端的复制

让我们试着对一些本地文件使用 rsync 命令。首先，清空我们的 foo 目录：

    [wangding@LAB ~]$ rm -rf foo/*

下一步，我们将同步 playground 目录和它在 foo 目录中相对应的副本

    [wangding@LAB ~]$ rsync -av playground foo

我们包括了-a 选项（递归和保护文件属性）和-v 选项（冗余输出），来在 foo 目录中制作一个 playground 目录的镜像。当这个命令执行的时候，我们将会看到一系列的文件和目录被复制。在最后，我们将看到一条像这样的总结信息：

    sent 135759 bytes received 57870 bytes 387258.00 bytes/sec
    total size is 3230 speedup is 0.02

说明复制的数量。如果我们再次运行这个命令，我们将会看到不同的结果：

    [wangding@LAB ~]$ rsync -av playgound foo
    building file list ... done
    sent 22635 bytes received 20 bytes
    total size is 3230 speedup is 0.14
    45310.00 bytes/sec

注意到没有文件列表。这是因为 rsync 程序检测到在目录~/playground 和 ~/foo/playground 之间不存在差异，因此它不需要复制任何数据。如果我们在 playground 目录中修改一个文件，然后再次运行 rsync 命令：

    [wangding@LAB ~]$ touch playground/dir-099/file-Z
    [wangding@LAB ~]$ rsync -av playground foo
    building file list ... done
    playground/dir-099/file-Z
    sent 22685 bytes received 42 bytes 45454.00 bytes/sec
    total size is 3230 speedup is 0.14

我们看到 rsync 命令检测到更改，并且只是复制了更新的文件。作为一个实际的例子，让我们考虑一个假想的外部硬盘，之前我们在 tar 命令中用到过的。如果我们再次把此硬盘连接到我们的系统中，它被挂载到/media/BigDisk 目录下，我们可以执行一个有用的系统备份了，首先在外部硬盘上创建一个目录，名为/backup，然后使用 rsync 程序从我们的系统中复制最重要的数据到此外部硬盘上：

    [wangding@LAB ~]$ mkdir /media/BigDisk/backup
    [wangding@LAB ~]$ sudo rsync -av --delete /etc /home /usr/local /media/BigDisk/backup

在这个例子里，我们把/etc，/home，和/usr/local 目录从我们的系统中复制到假想的存储设备中。我们包含了--delete 这个选项，来删除可能在备份设备中已经存在但却不再存在于源设备中的文件，（这与我们第一次创建备份无关，但是会在随后的复制操作中有用途）。挂载外部驱动器，运行rsync 命令，不断重复这个过程，是一个不错的（虽然不理想）方式来保存少量的系统备份文件。当然，别名会对这个操作更有帮助些。我们将会创建一个别名，并把它添加到.bashrc 文件中，来提供这个特性：

    alias backup='sudo rsync -av --delete /etc /home /usr/local /media/BigDisk/backup'

现在我们所做的事情就是连接外部驱动器，然后运行 backup 命令来完成工作。

### 在网络间使用 rsync 命令

rsync 程序的真正好处之一，是它可以被用来在网络间复制文件。毕竟，rsync 中的“r”象征着“remote”。远程复制可以通过两种方法完成。第一个方法要求另一个系统已经安装了 rsync 程序，还安装了远程 shell 程序，比如 ssh。比方说我们本地网络中的一个系统有大量可用的硬盘空间，我们想要用远程系统来代替一个外部驱动器，来执行文件备份操作。假定远程系统中有一个名为/backup 的目录，其用来存放我们传送的文件，我们这样做：

    [wangding@LAB ~]$ sudo rsync -av --delete --rsh=ssh /etc /home /usr/local remote-sys:/backup

我们对命令做了两处修改，来方便网络间文件复制。首先，我们添加了-\-rsh=ssh 选项，其指示rsync 使用 ssh 程序作为它的远程 shell。以这种方式，我们就能够使用一个 ssh 加密通道，把数据安全地传送到远程主机中。其次，通过在目标路径名前加上远端主机的名字（在这种情况下，远端主机名为 remote-sys），来指定远端主机。

