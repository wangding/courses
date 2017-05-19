# 权限管理

各位小伙伴大家好，咱们接着前面的课程，继续讲解 GitHub 开源之旅第九季：Linux Bash 入门，现在咱们讲解第五个话题：难舍难分之权限管理。

Linux 操作系统不仅是多任务系统，而且也是多用户系统。这到底意味着什么？它意味着多个用户可以在同一时间使用同一台计算机。当一台安装了 linux 的服务器连接到一个局域网或者互联网上，那么远程用户可以通过 ssh（安全 shell）登录并操纵这台电脑。

Linux 系统多用户的特点，可不是最近的“创新”。在最初设计操作系统内核的时候，就已经考虑进去了。想像一下 Unix 系统的诞生环境。多年前，在个人电脑出现之前，计算机都是大型的，昂贵的，集中化的。一个典型的大学计算机系统，例如，是由坐落在一座建筑中的一台大型中央计算机和许多散布在校园各处的终端机组成，每个终端都连接到这台大型中央计算机。这台计算机可以同时支持很多用户。

为了使多用户特性付诸实践，那么必须发明一种方法来阻止用户彼此之间受到影响。毕竟，一个用户的行为不能导致计算机崩溃，也不能乱动属于另一个用户的文件。

在本课程中，我们将看看这一系统安全的本质部分，会介绍以下命令：

- id – 显示用户身份号
- chmod – 更改文件模式
- umask – 设置默认的文件权限
- su – 以另一个用户的身份来运行 shell
- sudo – 以另一个用户的身份来执行命令
- chown – 更改文件所有者
- chgrp – 更改文件组所有权
- passwd – 更改用户密码

## 拥有者，组成员和其他人

在前面课程中我们探索文件系统时，当我们试图查看一个像 /etc/shadow 那样的文件的时候，我们会遇到一个问题。

    [wangding@LAB ~]$ file /etc/shadow
    /etc/shadow:  regular file, no read permission
    [wangding@LAB ~]$ less /etc/shadow
    /etc/shadow:  Permission denied

产生这种错误信息的原因是，作为一个普通用户，我们没有权限来读取这个文件。

在 Unix 安全模型中，一个用户可能拥有文件和目录。当一个用户拥有一个文件或目录时，用户对这个文件或目录的访问权限拥有控制权。用户，又属于一个或多个用户组，用户组当然就是用户的集合了，用户组成员由文件和目录的所有者授予对文件和目录的访问权限。除了对一个用户组授予权限之外，文件所有者可能会给每个人一些权限，在 Unix 术语中，每个人是指整个世界。可以用 id 命令，来找到关于你自己身份的信息：

    [wangding@LAB ~]$ id
    uid=500(me) gid=500(me) groups=500(me)

让我们看一下输出结果。当用户创建帐户之后，系统会给用户分配一个号码，叫做用户 ID 或者 uid，然后，为了符合人类的习惯，这个 ID 映射到一个用户名。系统又会给这个用户分配一个原始的组 ID 或者是 gid，这个 gid 可能属于另外的组。

那么这些信息来源于哪里呢？像 Linux 系统中的许多东西一样，来自一系列的文本文件。用户帐户定义在 /etc/passwd 文件里面，用户组定义在/etc/group 文件里面。当用户帐户和用户组创建以后，这些文件随着文件 /etc/shadow 的变动而修改，文件/etc/shadow 包含了关于用户密码的信息。对于每个用户帐号，文件/etc/passwd 定义了用户（登录）名，uid，gid，帐号的真实姓名，家目录，和登录 shell。如果你查看一下文件/etc/passwd 和文件/etc/group 的内容，你会注意到除了普通用户帐号之外，还有超级用户（uid 0）帐号，和各种各样的系统用户。

在下个专题中，当我们讨论进程时，你会知道这些其他的“用户”是谁，实际上，他们相当忙碌。

然而许多像 Unix 的系统会把普通用户分配到一个公共的用户组中，例如“users”，现在的 Linux 会创建一个独一无二的，只有一个成员的用户组，这个用户组与用户同名。这样使某种类型的权限分配更容易些。

## 读取，写入和执行

对于文件和目录的访问权力是根据读访问，写访问和执行访问来定义的。如果我们看一下 ls 命令的输出结果，我们能得到一些线索，这是怎样实现的：

    [wangding@LAB ~]$ > foo.txt
    [wangding@LAB ~]$ ls -l foo.txt
    -rw-rw-r-- 1 me   me   0 2008-03-06 14:52 foo.txt

列表的前十个字符是文件的属性。这十个字符的第一个字符表明文件类型。下表是你可能经常看到的文件类型（还有其它的，不常见类型）：

<table class="multi">
<caption class="cap">表10-1: 文件类型</caption>
<tr>
<th class="title" width="15%">属性</th>
<th class="title">文件类型</th>
</tr>
<tr>
<td valign="top">-</td>
<td valign="top">一个普通文件</td>
</tr>
<tr>
<td valign="top">d </td>
<td valign="top">一个目录</td>
</tr>
<tr>
<td valign="top">l</td>
<td valign="top"> 一个符号链接。注意对于符号链接文件，剩余的文件属性总是"rwxrwxrwx"，而且都是虚拟值。真正的文件属性是指符号链接所指向的文件的属性。</td>
</tr>
<tr>
<td valign="top">c</td>
<td valign="top"> 一个字符设备文件。这种文件类型是指按照字节流，来处理数据的设备。比如说终端机，或者调制解调器</td>
</tr>
<tr>
<td valign="top">b</td>
<td valign="top"> 一个块设备文件。这种文件类型是指按照数据块，来处理数据的设备，例如一个硬盘，或者 CD-ROM 盘。 </td>
</tr>
</table>

剩下的九个字符，叫做文件模式，代表着文件所有者，文件组所有者，和其他人的读，写，执行权限。

![](../images/101.png) \\
图 1: 权限属性
{: .figure}

当设置文件模式后，r，w，x 模式属性对文件和目录会产生以下影响：

<table class="multi">
<caption class="cap">表 10-2: 权限属性</caption>
<tr>
<th class="title" width="15%">属性</th>
<th class="title">文件</th>
<th class="title">目录</th>
</tr>
<tr>
<td valign="top">r</td>
<td valign="top">允许打开并读取文件内容。</td>
<td valign="top">允许列出目录中的内容，前提是目录必须设置了可执行属性（x）。</td>
</tr>
<tr>
<td valign="top">w</td>
<td valign="top">允许写入文件内容或截断文件。但是不允许对文件进行重命名或删除，重命名或删除是由目录的属性决定的。</td>
<td valign="top">允许在目录下新建、删除或重命名文件，前提是目录必须设置了可执行属性（x）。</td>
</tr>
<tr>
<td valign="top">x</td>
<td valign="top">允许将文件作为程序来执行，使用脚本语言编写的程序必须设置为可读才能被执行。</td>
<td valign="top">允许进入目录，例如：cd directory 。</td>
</tr>
</table>

## chmod － 更改文件模式

更改文件或目录的模式（权限），可以利用 chmod 命令。注意只有文件的所有者或者超级用户才能更改文件或目录的模式。chmod 命令支持两种不同的方法来改变文件模式：八进制数字表示法，或符号表示法。首先我们讨论一下八进制数字表示法。

通过八进制表示法，我们使用八进制数字来设置所期望的权限模式。因为每个八进制数字代表了3个二进制数字，这种对应关系，正好映射到用来存储文件模式所使用的方案上。下表展示了我们所要表达的意思：

|Octal| Binary | File Mode|
|---  | ---    | ---      |
|0 | 000 | -\-\-|
|1 | 001 | -\-x|
|2 | 010 | -w-|
|3 | 011 | -wx|
|4 | 100 | r-\-|
|5 | 101 | r-x|
|6 | 110 | rw-|
|7 | 111 | rwx|

通过使用3个八进制数字，我们能够设置文件所有者，用户组，和其他人的权限：

    [wangding@LAB ~]$ > foo.txt
    [wangding@LAB ~]$ ls -l foo.txt
    -rw-rw-r-- 1 me    me    0  2008-03-06 14:52 foo.txt
    [wangding@LAB ~]$ chmod 600 foo.txt
    [wangding@LAB ~]$ ls -l foo.txt
    -rw------- 1 me    me    0  2008-03-06 14:52 foo.txt

通过传递参数 “600”，我们能够设置文件所有者的权限为读写权限，而删除用户组和其他人的所有权限。虽然八进制到二进制的映射看起来不方便，但通常只会用到一些常见的映射关系：
7 (rwx)，6 (rw-)，5 (r-x)，4 (r-\-)，和 0 (-\-\-)。

chmod 命令支持一种符号表示法，来指定文件模式。符号表示法分为三部分：更改会影响谁，要执行哪个操作，要设置哪种权限。通过字符 “u”，“g”，“o”，和 “a” 的组合来指定要影响的对象，如下所示：

<table class="multi">
<caption class="cap">表10-4: chmod 命令符号表示法 </caption>
<tr>
<td class="title" width="15%">u</td>
<td class="title"> "user"的简写，意思是文件或目录的所有者。</td>
</tr>
<tr>
<td valign="top">g</td>
<td valign="top"> 用户组。</td>
</tr>
<tr>
<td valign="top">o</td>
<td valign="top"> "others"的简写，意思是其他所有的人。</td>
</tr>
<tr>
<td valign="top">a</td>
<td valign="top"> "all"的简写，是"u", "g"和“o”三者的联合。</td>
</tr>
</table>

如果没有指定字符，则假定使用"all"。执行的操作可能是一个“＋”字符，表示加上一个权限，一个“－”，表示删掉一个权限，或者是一个“＝”，表示只有指定的权限可用，其它所有的权限被删除。

权限由 “r”，“w”，和 “x” 来指定。这里是一些符号表示法的实例：

<table class="multi">
<caption class="cap">表10-5: chmod 符号表示法实例 </caption>
<tr>
<td class="title" width="15%">u+x </td>
<td class="title"> 为文件所有者添加可执行权限。</td>
</tr>
<tr>
<td valign="top">u-x</td>
<td valign="top"> 删除文件所有者的可执行权限。</td>
</tr>
<tr>
<td valign="top">+x</td>
<td valign="top"> 为文件所有者，用户组，和其他所有人添加可执行权限。 等价于 a+x。</td>
</tr>
<tr>
<td valign="top">o-rw</td>
<td valign="top"> 除了文件所有者和用户组，删除其他人的读权限和写权限。</td>
</tr>
<tr>
<td valign="top">go=rw</td>
<td valign="top"> 给群组的主人和任意文件拥有者的人读写权限。如果群组的主人或全局之前已经有了执行的权限，他们将被移除。 </td>
</tr>
<tr>
<td valign="top">u+x,go=rw</td>
<td valign="top"> 给文件拥有者执行权限并给组和其他人读和执行的权限。多种设定可以用逗号分开。</td>
</tr>
</table>

一些人喜欢使用八进制表示法，而另一些人则非常喜欢符号表示法。符号表示法的优点是，允许你设置文件模式的某个属性，而不影响其他的属性。

看一下 chmod 命令的手册页，可以得到更详尽的信息和 chmod 命令的各个选项。要注意"-\-recursive"选项：它可以同时作用于文件和目录，所以它并不是如我们期望的那么有用处，因为我们很少希望文件和目录拥有同样的权限。

## umask － 设置默认权限

当创建一个文件时，umask 命令控制着文件的默认权限。umask 命令使用八进制表示法来表达从文件模式属性中删除一个位掩码。大家看下面的例子：

    [wangding@LAB ~]$ rm -f foo.txt
    [wangding@LAB ~]$ umask
    0002
    [wangding@LAB ~]$ > foo.txt
    [wangding@LAB ~]$ ls -l foo.txt
    -rw-rw-r-- 1 me   me   0 2008-03-06 14:53 foo.txt

首先，删除文件 foo.txt，以此确定我们从新开始。下一步，运行不带参数的 umask 命令，看一下当前的掩码值。响应的数值是0002（0022是另一个常用值），这个数值是掩码的八进制表示形式。下一步，我们创建文件 foo.txt，并且保留它的权限。

我们可以看到文件所有者和用户组都得到读权限和写权限，而其他人只是得到读权限。其他人没有得到写权限的原因是由掩码值决定的。重复我们的实验，这次自己设置掩码值：

    [wangding@LAB ~]$ rm foo.txt
    [wangding@LAB ~]$ umask 0000
    [wangding@LAB ~]$ > foo.txt
    [wangding@LAB ~]$ ls -l foo.txt
    -rw-rw-rw- 1 me   me    0 2008-03-06 14:58 foo.txt

当掩码设置为0000（实质上是关掉它）之后，我们看到其他人能够读写文件。为了弄明白这是怎么回事，我们需要看一下掩码的八进制形式。把掩码展开成二进制形式，然后与文件属性相比较，看看有什么区别：

| Original file mode | -\-\- rw- rw- rw- |
| ---                | ---               |
| Mask               | 000 000 000 010   |
| Result             | -\-- rw- rw- r-\-|

此刻先忽略掉开头的三个零（我们一会儿再讨论），注意掩码中若出现一个数字1，则删除文件模式中和这个1在相同位置的属性，在这是指其他人的写权限。这就是掩码要完成的任务。掩码的二进制形式中，出现数字1的位置，相应地关掉一个文件模式属性。看一下掩码0022的作用：

| Original file mode | -\-\- rw- rw- rw- |
| ---                | ---               |
| Mask | 000 000 010 010 |
| Result | -\-- rw- r-\- r-\- |

又一次，二进制中数字1出现的位置，相对应的属性被删除。再试一下其它的掩码值（一些带数字7的），习惯于掩码的工作原理。当你实验完成之后，要记得清理现场：

    [wangding@LAB ~]$ rm foo.txt; umask 0002

大多数情况下，你不必修改掩码值，系统提供的默认掩码值就很好了。然而，在一些高安全级别下，你要能控制掩码值。

>
> 一些特殊权限
>
> 虽然我们通常看到一个八进制的权限掩码用三位数字来表示，但是从技术层面上来讲，用四位数字来表示它更确切些。为什么呢？因为，除了读取，写入，和执行权限之外，还有其它的，较少用到的权限设置。
>
> 其中之一是 setuid 位（八进制4000)。当应用到一个可执行文件时，它把有效用户 ID 从真正的用户（实际运行程序的用户）设置成程序所有者的 ID。这种操作通常会应用到一些由超级用户所拥有的程序。当一个普通用户运行一个程序，这个程序由根用户(root)所有，并且设置了 setuid 位，这个程序运行时具有超级用户的特权，这样程序就可以访问普通用户禁止访问的文件和目录。很明显，因为这会引起安全方面的问题，所有可以设置 setuid 位的程序个数，必须控制在绝对小的范围内。
>
> 第二个是 setgid 位（八进制2000），这个相似于 setuid 位，把有效用户组 ID 从真正的用户组 ID 更改为文件所有者的组 ID。如果设置了一个目录的 setgid 位，则目录中新创建的文件具有这个目录用户组的所有权，而不是文件创建者所属用户组的所有权。对于共享目录来说，当一个普通用户组中的成员，需要访问共享目录中的所有文件，而不管文件所有者的主用户组时，那么设置 setgid 位很有用处。
>
> 第三个是 sticky 位（八进制1000）。这个继承于 Unix，在 Unix 中，它可能把一个可执行文件标志为“不可交换的”。在 Linux 中，会忽略文件的 sticky 位，但是如果一个目录设置了 sticky 位，那么它能阻止用户删除或重命名文件，除非用户是这个目录的所有者，或者是文件所有者，或是超级用户。这个经常用来控制访问共享目录，比方说/tmp。
>
> 这里有一些例子，使用 chmod 命令和符号表示法，来设置这些特殊的权限。首先，授予一个程序 setuid 权限。
>
>  _chmod u+s program_
>
> 下一步，授予一个目录 setgid 权限：
>
>  _chmod g+s dir_
>
> 最后，授予一个目录 sticky 权限：
>
>  _chmod +t dir_
>
> 当浏览 ls 命令的输出结果时，你可以确认这些特殊权限。这里有一些例子。首先，一个程序被设置为setuid属性：
>
>  _-rwsr-xr-x_
>
> 具有 setgid 属性的目录：
>
>  _drwxrwsr-x_
>
> 设置了 sticky 位的目录：
>
>  _drwxrwxrwt_

## 更改身份

在不同的时候，我们会发现很有必要具有另一个用户的身份。经常地，我们想要得到超级用户特权，来执行一些管理任务，但是也有可能"变为"另一个普通用户，比如说测试一个帐号。有三种方式，可以拥有多重身份：

1. 注销系统并以其他用户身份重新登录系统。  
2. 使用 su 命令。  
3. 使用 sudo 命令。  

我们将跳过第一种方法，因为我们知道怎样使用它，并且它缺乏其它两种方法的方便性。在我们自己的 shell 会话中，su 命令允许你，假定为另一个用户的身份，以这个用户的 ID 启动一个新的 shell 会话，或者是以这个用户的身份来发布一个命令。sudo 命令允许一个管理员设置一个叫做/etc/sudoers 的配置文件，并且定义了一些具体命令，在假定的身份下，特殊用户可以执行这些命令。选择使用哪个命令，很大程度上是由你使用的 Linux 发行版来决定的。你的发行版可能这两个命令都包含，但系统配置可能会偏袒其中之一。我们先介绍 su 命令。

## su － 以其他用户身份和组 ID 运行一个 shell

su 命令用来以另一个用户的身份来启动 shell。这个命令语法看起来像这样：

    su [-[l]] [user]

如果包含"-l"选项，那么会为指定用户启动一个需要登录的 shell。这意味着会加载此用户的 shell 环境，并且工作目录会更改到这个用户的家目录。这通常是我们所需要的。如果不指定用户，那么就假定是超级用户。注意（不可思议地），选项"-l"可以缩写为"-"，这是经常用到的形式。启动超级用户的 shell，我们可以这样做：

    [wangding@LAB ~]$ su -
    Password:
    [root@LAB ~]#

按下回车符之后，shell 提示我们输入超级用户的密码。如果密码输入正确，出现一个新的 shell 提示符，这表明这个 shell 具有超级用户特权（提示符的末尾字符是"#"而不是"$"），并且当前工作目录是超级用户的家目录（通常是/root）。一旦进入一个新的 shell，我们能执行超级用户所使用的命令。当工作完成后，输入"exit"，则返回到原来的 shell:

    [root@LAB ~]# exit
    [wangding@LAB ~]$

以这样的方式使用 su 命令，也可以只执行单个命令，而不是启动一个新的可交互的 shell：

    su -c 'command'

使用这种模式，命令传递到一个新 shell 中执行。把命令用单引号引起来很重要，因为我们不想命令在我们的 shell 中展开，但需要在新 shell 中展开。

    [wangding@LAB ~]$ su -c 'ls -l /root/*'
    Password:
    -rw------- 1 root root    754 2007-08-11 03:19 /root/anaconda-ks.cfg

    /root/Mail:
    total 0
    [wangding@LAB ~]$

## sudo － 以另一个用户身份执行命令

sudo 命令在很多方面都相似于 su 命令，但是 sudo 还有一些非常重要的功能。管理员能够配置sudo 命令，从而允许一个普通用户以不同的身份（通常是超级用户），通过一种非常可控的方式来执行命令。尤其是，只有一个用户可以执行一个或多个特殊命令时，（更体现了 sudo 命令的方便性）。另一个重要差异是 sudo 命令不要求超级用户的密码。使用 sudo 命令时，用户使用他/她自己的密码来认证。比如说，例如，sudo 命令经过配置，允许我们运行一个虚构的备份程序，叫做"backup_script"，这个程序要求超级用户权限。通过 sudo 命令，这个程序会像这样运行：

    [wangding@LAB ~]$ sudo backup_script
    Password:
    System Backup Starting...

按下回车键之后，shell 提示我们输入我们的密码（不是超级用户的）。一旦认证完成，则执行具体的命令。su 和 sudo 之间的一个重要区别是 sudo 不会重新启动一个 shell，也不会加载另一个用户的 shell 运行环境。这意味者命令不必用单引号引起来。注意通过指定各种各样的选项，这种行为可以被推翻。详细信息，阅读 sudo 手册页。

想知道 sudo 命令可以授予哪些权限，使用"-l"选项，列出所有权限：

    [wangding@LAB ~]$ sudo -l
    User me may run the following commands on this host:
    (ALL) ALL

## chown － 更改文件所有者和用户组

chown 命令被用来更改文件或目录的所有者和用户组。使用这个命令需要超级用户权限。chown 命令的语法看起来像这样：

    chown [owner][:[group]] file...

chown 可以根据这个命令的第一个参数更改文件所有者和/或文件用户组。这里有一些例子：

<table class="multi">
<caption class="cap">表10-6: chown 参数实例</caption>
<tr>
<th class="title">参数</th>
<th class="title">结果</th>
</tr>
<tr>
<td valign="top" width="15%">bob</td>
<td valign="top"> 把文件所有者从当前属主更改为用户 bob。</td>
</tr>
<tr>
<td valign="top">bob:users</td>
<td valign="top"> 把文件所有者改为用户 bob，文件用户组改为用户组 users。</td>
</tr>
<tr>
<td valign="top">:admins</td>
<td valign="top"> 把文件用户组改为组 admins，文件所有者不变。</td>
</tr>
<tr>
<td valign="top">bob:</td>
<td valign="top"> 文件所有者改为用户 bob，文件用户组改为，用户 bob 登录系统时，所属的用户组。</td>
</tr>
</table>

比方说，我们有两个用户，janet，拥有超级用户访问权限，而 tony 没有。用户 jant 想要从她的家目录复制一个文件到用户 tony 的家目录。因为用户 jant 想要 tony 能够编辑这个文件，janet 把这个文件的所有者更改为 tony:

    [janet@LAB ~]$ sudo cp myfile.txt ~tony
    Password:
    [janet@LAB ~]$ sudo ls -l ~tony/myfile.txt
    -rw-r--r-- 1 root  root 8031 2008-03-20 14:30 /home/tony/myfile.txt
    [janet@LAB ~]$ sudo chown tony: ~tony/myfile.txt
    [janet@LAB ~]$ sudo ls -l ~tony/myfile.txt
    -rw-r--r-- 1 tony  tony 8031 2008-03-20 14:30 /home/tony/myfile.txt

这里，我们看到用户 janet 把文件从她的目录复制到 tony 的家目录。下一步，janet 把文件所有者从 root（使用 sudo 命令的原因）改到 tony。通过在第一个参数中使用末尾的":"字符，janet 同时把文件用户组改为 tony 登录系统时，所属的用户组，碰巧是用户组 tony。

注意，第一次使用 sudo 命令之后，为什么（shell）没有提示 janet 输入她的密码？这是因为，在大多数的配置中，sudo 命令会相信你几分钟，直到计时结束。

## chgrp － 更改用户组所有权

在旧版 Unix 系统中，chown 命令只能更改文件所有权，而不是用户组所有权。为了达到目的，使用一个独立的命令，chgrp 来完成。除了限制多一点之外，chgrp 命令与 chown 命令使用起来很相似。

## passwd —— 更改用户密码

这一章最后一个话题，我们将讨论自己帐号的密码（和其他人的密码，如果你具有超级用户权限）。使用 passwd 命令，来设置或更改用户密码。命令语法如下所示：

    passwd [user]

只要输入 passwd 命令，就能更改你的密码。shell 会提示你输入你的旧密码和你的新密码：

    [wangding@LAB ~]$ passwd
    (current) UNIX password:
    New UNIX password:

passwd 命令将会试着强迫你使用“强”密码。这意味着，它会拒绝接受太短的密码，与先前相似的密码，字典中的单词作为密码，或者是太容易猜到的密码：

    [wangding@LAB ~]$ passwd
    (current) UNIX password:
    New UNIX password:
    BAD PASSWORD: is too similar to the old one
    New UNIX password:
    BAD PASSWORD: it is WAY too short
    New UNIX password:
    BAD PASSWORD: it is based on a dictionary word

如果你具有超级用户权限，你可以指定一个用户名作为 passwd 命令的参数，这样可以设置另一个用户的密码。还有其它的 passwd 命令选项对超级用户有效，允许帐号锁定，密码失效，等等。详细内容，参考 passwd 命令的手册页。
