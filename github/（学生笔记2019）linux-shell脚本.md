---
layout: post
title:  "生产力工具：shell 与 Bash 脚本"
date:   2019-06-30 23:58:25 +0800
---

# 生产力工具：shell 与 Bash 脚本



作者：吴甜甜  
个人博客网站： wutiantian.github.io  
注意：本文只是我个人总结的学习笔记，不适合0基础人士观看。


----
参考内容：

王顶老师 linux bash 视频教程

http://billie66.github.io/TLCL/book

C语言编程网：  http://c.biancheng.net/shell/

推荐书籍：《UNIX环境编程》，有内容，有远离，课后习题也很棒。

---
目录


<!-- TOC -->

- [生产力工具：shell 与 Bash 脚本](#生产力工具shell-与-bash-脚本)
- [我为什么学 shell](#我为什么学-shell)
    - [什么是 shell 与 BASH](#什么是-shell-与-bash)
    - [学 shell 与 BASH 立竿见影的好处](#学-shell-与-bash-立竿见影的好处)
- [三步编写执行一个 Shell 脚本](#三步编写执行一个-shell-脚本)
- [命令](#命令)
    - [命令提示符与命令的概念简述](#命令提示符与命令的概念简述)
    - [命令的详细](#命令的详细)
- [linux系统基础操作](#linux系统基础操作)
    - [linux思想：一切皆文件](#linux思想一切皆文件)
    - [探索操作系统状态](#探索操作系统状态)
    - [linux文件系统跳转](#linux文件系统跳转)
    - [操作文件和目录](#操作文件和目录)
    - [文本处理](#文本处理)
    - [停止](#停止)
    - [权限](#权限)
    - [软件安装管理](#软件安装管理)
    - [编译程序make](#编译程序make)
- [shell眼中看世界——“展开”](#shell眼中看世界展开)
    - [字符展开](#字符展开)
    - [路径名展开](#路径名展开)
    - [波浪线展开](#波浪线展开)
    - [算术表达式展开](#算术表达式展开)
    - [花括号展开](#花括号展开)
    - [参数展开](#参数展开)
    - [命令(展开)替换](#命令展开替换)
    - [引用-控制展开](#引用-控制展开)
    - [引用-双引号-限制部分展开](#引用-双引号-限制部分展开)
    - [引用-单引号-禁止展开](#引用-单引号-禁止展开)
    - [转义字符](#转义字符)
- [IO 重定向](#io-重定向)
    - [IO](#io)
    - [重定向](#重定向)
    - [管道操作符\|提取数据](#管道操作符\提取数据)
- [正则表达式](#正则表达式)
    - [用“元字符”实现复杂匹配](#用元字符实现复杂匹配)
    - [元字符和原义字符](#元字符和原义字符)
    - [grep](#grep)
- [专项专题(选看)](#专项专题选看)
    - [显示与查找文件](#显示与查找文件)
    - [归档 tar、解压、批量](#归档-tar解压批量)
    - [内存与进程的性能](#内存与进程的性能)
    - [存储媒介-设备挂载](#存储媒介-设备挂载)
    - [网络](#网络)
- [定制 shell](#定制-shell)
    - [shell环境](#shell环境)
    - [定制 shell 提示符$PS1](#定制-shell-提示符ps1)
    - [别名alias-创建你自己的命令](#别名alias-创建你自己的命令)
- [写脚本](#写脚本)
    - [注释第一行](#注释第一行)
    - [变量](#变量)
    - [使用变量](#使用变量)
    - [声明数组](#声明数组)
    - [表达式](#表达式)
    - [数学运算](#数学运算)
    - [流程控制-if](#流程控制-if)
    - [流程控制-循环](#流程控制-循环)
    - [语句](#语句)
    - [脚本习题](#脚本习题)
- [附录：如何查看 man 帮助手册](#附录如何查看-man-帮助手册)
- [附录：学习方法](#附录学习方法)
- [附录：鸣谢](#附录鸣谢)

<!-- /TOC -->

# 我为什么学 shell

我首先接触到 shell 是在深圳的一家fpga的方案公司参观交流时，看到工程师对fpga进行编程时，敲几个字符就插入了代码块，感觉很快，是生产力的决胜武器。工程师告诉我，每个 fpga 公司都有自己的核心技术专利，编写好的私有库就是通过几个字符的脚本插入到程序中，每家都不同，模块不对外公开。

**我意识到，成为具有核心价值的工程师必须掌握这项技能！**

我本科时学的是电子信息工程，对软件的态度并没有什么都要会的意识，只是用到再学。但对于 shell ，它并不能迫在眉睫能解决什么必须处理的问题，却成为人与人差距的重要一环之一。

写本内容时，是应用于图像机器学习中遇到实际问题写的个人笔记。当我准备用手头的《Linux程序设计》书时，很失望，看着块头挺大。内容可看的不多。网上的博客大多数内容比较浅，实战性不强。所以我自己写给自己复习。

*嵌入式的shell是精简过的，语法略有不同，这点要注意。比如说数组，部分命令的输出和PC尚的存在一定差异。*


## 什么是 shell 与 BASH 

- shell:
    一说到命令行，我们真正指的是 shell。
    **shell 就是一个程序，它接受从键盘输入的命令， 然后把命令传递给操作系统去执行。**

- BASH   
    “bash” 是 “Bourne Again SHell” 的首字母缩写。
    bash 是由 Steve Bourne 的人写成 **shell 程序的增强版**


因为基于“命令行”界面，而不是“图形”界面，所以 shell 与 bash 的适应性更强，能应用在**多种系统**中，是“**通杀**”的技能。

## 学 shell 与 BASH 立竿见影的好处

|常用功能例举|功能简述|优势|功能|
|---|---|---|---|
|1|自动运行命令行|自动执行多组操作|添加一条命令行，每次输入几个字符（打开bash）时都会自动运行|
|2|alias别名|简化单组操作字符数|


# 三步编写执行一个 Shell 脚本

|步骤|内容|详细|
|:---|:---:|:---|
|1|**编写一个脚本。**|shell 脚本就是普通的文本文件。所以我们需要一个文本编辑器来书写它们。最好的文本 编辑器都会支持语法高亮，这样我们就能够看到一个脚本关键字的彩色编码视图。语法高亮会帮助我们查看某种常见 错误。为了编写脚本文件，vim，gedit，kate，和许多其它编辑器都可以。|
|2|使脚本文件**可执行**。|系统会相当挑剔不允许任何旧的文本文件被看作是一个程序，并且有充分的理由! 所以我们需要设置脚本文件的权限来允许其可执行。|
|3|把脚本放置到 shell 能够找到**当前目录下**。|当没有指定可执行文件明确的路径名时，shell 会**自动地搜索某些目录**， 来查找此可执行文件。为了最大程度的方便，我们会把脚本放到这些目录当中。|

# 命令

## 命令提示符与命令的概念简述

- 命令提示符：说明 **shell已经准备好输入了**。


>[当前用户登录名@linux主机名 当前路径]$

例如： [Teenie@wutiantian.github.io ~]$  
表示：当前用户Teenie在主机名为wutiantian.github.io的当前路径为家目录

注意，后续的“定制 shell 环境”章节 有具体更改为自己心中环境的设置过程。

- 命令行语法

>command -options arguments
>命令 一个或多个选项 一个或多个参数对象

以“空格”分隔，不管几个空格都算一个空格。

例如：  ls -l  /usr

- 如何选择命令行发挥更大优势

|界面|优势|
|---|---|
|图形|简单的任务更简单|
|命令行|复杂的任务成为可能|

## 命令的详细

选项 options 分为 短选项和长选项，**功能效果一样**。

|options|举例|优势|描述|
|---|---|---|:---|
|short|-a|效率高|格式为'-'**单横杠**。<br>短选项可**合并**。若'-'后不止一个字母则为合并选项。<br>例如：-a与-l合并为-al全部列出功能|
|long|--all|更直观|格式为'--'**双横杠**。<br>长选项没有合并说法。|



|命令|四种形式||
|---|:---:|:---:|
|execute binary<br>可执行二进制|就像我们所看到的位于目录/usr/bin 中的文件一样|用诸如 C 和 C++语言写成的**程序编译**的**二进制文件**, 也可以是由诸如shell，perl，python，ruby等等**脚本语言**写成的程序 |
|buildin bash<br>内嵌bash命令|bash 支持若干命令，内部叫做 shell 内部命令 (builtins)|例如，cd 命令，就是一个 shell 内部命令。|
|shell function 函数|这些是小规模的 shell 脚本|它们混合到环境变量中。|   
|alias 命令别名|定义自己的命令|建立在其它命令之上|


|命令|检测命令的四种形式归属|举例|举例|
|---|---|---|---|
|type|Indicate how a command name is interpreted<br>说明怎样解释一个命令名|type command<br>**四种命令形式的哪一种**|#type type <br> type is a shell builtin <br> #type ls<br>ls is aliased to `ls --color=auto'<br>#type cp<br>cp is /bin/cp|
|which|To determine the exact location of a given executable, the which command is used:<br>显示可执行程序的**位置**|which command<br>一个操作系统中，不只安装了可执行程序的一个版本,为了确定所给定的执行程序的准确位置，使用 which 命令<br>**这个命令只对可执行程序有效**|#which cp<br>/bin/cp<br>#which cd<br>使用 shell 内建命令时，得不到回应。|
|help|得到**shell 内建命令的（简要）帮助文档**|command --help<br>help command<br>帮助文件可能是**中文**也可能是**英文**|help cd<br>cd --help|
|man|**详细**用户帮助|man command|man ls \| less|
|apropos|基于某个关键字的**搜索**匹配项,很粗糙但有时很有用|apropos command<br>等价于man -k|
|whatis|The whatis program displays the name and a one line description of a man page matching a specified<br>显示**匹配特定关键字**的**手册页**的名字和**一行命令说明**|whatis command|whatis ls<br>ls(1)- list directory contents|
|info|info 内容可通过 info 阅读器 程序读取。info 页是超级链接形式的，和**网页很相似,退出就消失了痕迹**。<br>info 文件包含超级链接，它可以让你从一个结点跳到另一个结点。一个**超链接**可通过 它开头的**星号来辨别**出来，把光标放在它上面并**按下 enter 键，就可以激活它**。|info command|info ls|

>help cd

长说明
```
cd: cd [-L|[-P [-e]] [-@]] [dir]
    Change the shell working directory.
    
    Change the current directory to DIR.  The default DIR is the value of the
    HOME shell variable.
    
    The variable CDPATH defines the search path for the directory containing
    DIR.  Alternative directory names in CDPATH are separated by a colon (:).
    A null directory name is the same as the current directory.  If DIR begins
    with a slash (/), then CDPATH is not used.
    
    If the directory is not found, and the shell option `cdable_vars' is set,
    the word is assumed to be  a variable name.  If that variable has a value,
    its value is used for DIR.
    
    Options:
        -L	force symbolic links to be followed: resolve symbolic links in
    	DIR after processing instances of `..'
        -P	use the physical directory structure without following symbolic
    	links: resolve symbolic links in DIR before processing instances
    	of `..'
        -e	if the -P option is supplied, and the current working directory
    	cannot be determined successfully, exit with a non-zero status
        -@  on systems that support it, present a file with extended attributes
            as a directory containing the file attributes
    
    The default is to follow symbolic links, as if `-L' were specified.
    `..' is processed by removing the immediately previous pathname component
    back to a slash or the beginning of DIR.
    
    Exit Status:
    Returns 0 if the directory is changed, and if $PWD is set successfully when
    -P is used; non-zero otherwise.
```


>cd --help

短说明
```
bash: cd: --: invalid option
cd: usage: cd [-L|[-P [-e]] [-@]] [dir]
```
>apropos ls

匹配关键字
等价于man -k ls
```
SSL (3ssl)           - OpenSSL SSL/TLS library
_llseek (2)          - reposition read/write file offset
aconnect (1)         - ALSA sequencer connection manager
add-shell (8)        - add shells to the list of valid login shells
afInitChannels (3)   - initialize audio data format for a track in an audio f...
afOpenFile (3)       - open an audio file and create a file handle structure ...
afs_syscall (2)      - unimplemented system calls
afSetVirtualChannels (3) - set the virtual data format for a track in an audi...
afSetVirtualSampleFormat (3) - set the virtual data format for a track in an ...
alsabat (1)          - command-line sound tester for ALSA sound card driver
alsactl (1)          - advanced controls for ALSA soundcard driver
alsactl_init (7)     - alsa control management - initialization
alsaloop (1)         - command-line PCM loopback
alsamixer (1)        - soundcard mixer for ALSA soundcard driver, with ncurse...
amidi (1)            - read from and write to ALSA RawMIDI ports
amixer (1)           - command-line mixer for ALSA soundcard driver
aplay (1)            - command-line sound recorder and player for ALSA soundc...
...

```



# linux系统基础操作

## linux思想：一切皆文件

|颜色属性|白|蓝|浅蓝|绿|红|红色闪烁|黄|灰|
|---|---|---|---|---|---|---|---|---|---|
|文件类型|普通文件|目录|链接文件|可执行文件|压缩文件|链接有问题文件|设备文件|其他文件|


```
解析例如：
档案类型权限 连节数 档案拥有者  档案所属群组  文件大小  档案最后被修改时间  档名
-rw-r--r--  1      Teenie       Teenie     3803     6月  24 21:43     .bashrc
```

文件类型标记方法：
|首位|类型|举例|文件举例|
|---|---|---|---|
|-|普通文件|文本文件、二进制文件|a.c , 1.txt  , a.out  ， test1.sh ，bbbb.txt-hard看不出类型的文本硬链接|
|d|文件夹||cache/|
|l|符号链接文件|后面会用->打印出它指向的文件|ln -s src.c linker.c<br>linker.c就是src.c的一个符号链接文件<br>lrwxrwxrwx 1 root root 3 .... linker.c -> src.c|
|s|socket文件||
|p|管道文件|||


|文件权限|含义|
|---|:---:|
|r|可读|
|w|可写|
|x|可执行|
|-|空权限，没有权限<br>不可执行Permission denied|


|文件目录结构|内容|
|---|---|
|bin|存储二进制**可执行命令文件**（绿色）|
|root|**root超级用户**，即根用户的主目录|
|home|**普通用户**的默认家目录，每个普通用户拥有一个以用户名命名的文件夹|
|mnt|**可移除设备挂载点**。例如：光驱。共享文件夹目录/mnt/ghfs/|
|media|可移除设备|
|etc|**配置文件和目录**<br>/etc/crontab写脚本或定时运行一些任务，有定时设置。<br>/etc/fstab系统挂载的磁盘ID<br>**/etc/passwd所有用户的账号密码**|
|proc|操作系统正在运行进程的文件列表。可用“file 文件名”去查看用途|
|lib|存储各种程序所需要的**共享库文件**|
|opt|optional可选的，第三方软件可安装至此|
|boot|存放ubuntu内核和**系统启动文件**<br>/boot/grub/grub.conf or menu.lst，被用来配置启动加载程序。<br>/boot/vmlinuz，Linux 内核|
|var|用于存放很多不断变化的文件，例如日志文件等。<br>/var/log 目录包含日志文件、各种系统活动的记录。<br>这些文件非常重要，并且 应该时时监测它们。|
|tmp|存储系统和用户的临时信息|
|user|包括与系统用户直接有关的文件和目录|
|sbin|系统命令的存储位置|

- linux文件存储
 
至少包括两部分，（1）文件数据本身（2）文件原数据  
原数据包括：文件属性（创建时间、修改时间、所有者、权限、文件名）。  
这些原数据链接到了数据块本身，所以**本身就是一个硬链接**。  
当硬链接数量比1少时，文件就被删除了。


|类型|硬链接|软链接|
|------|---|---|
|局限性|**不能指向到目录**<br>有 ln file link无ln directory link<br>文件和链接文件不能位于不同设备|符号链接：链接、原文件。删除链接，原文件不受影响。<br>删除原文件则链接文件指向空，野指针，在操作系统有红色显示|
|外观|硬链接在ls命令下是看不出区别的。|符号链接课看出符号指向<br>sbin->usr/sbin|
## 探索操作系统状态

>date

显示系统当前时间和日期
This command displays the current time and date.

```
2019年 06月 30日 星期日 18:21:15 CST

```

>cal

显示当前月份的日历
A related command is cal which, by default, displays a **calendar** of the current month.

```
      六月 2019         
日 一 二 三 四 五 六  
                   1  
 2  3  4  5  6  7  8  
 9 10 11 12 13 14 15  
16 17 18 19 20 21 22  
23 24 25 26 27 28 29  
30              
```

>exit

结束终端会话

We can end a terminal session by either closing the terminal emulator window, or by entering the exit command at the shell prompt:

>file filename

确定文件类型

>file ~/.bashrc

/home/Teenie/.bashrc: ASCII text


## linux文件系统跳转


|命令|全英文|用法|
|---|:---:|:---:|
|pwd|Print name of current working directory<br>打印出当前工作的绝对路径|pwd **我是谁？我在哪？**|
|ls|List directory contents<br>列出目录内容|ls<br>什么都不跟，查看当前目录资料<br>ls /dev<br>查看指定路径下资料<br>|
|cd|Change directory<br>更改目录|cd <br>什么都不跟，回到家目录<br>cd ~username<br>回到某用户家目录<br>cd -<br>切换到前一个操作目录<br>cd Teenie/<br>切换到指定路径下目录|


>[Teenie@wutiantian.github.io ~]$ pwd

/home/Teenie
普通用户根目录的工作目录名：在home目录下的该用户名地址下。


>ls

|常用选项|长选项|作用|举例|
|---|---|---|---|
|-a|--all|列出目录下的所有内容，包括隐藏的|
|-d|--directory|该目录本身的信息(单)行|ls -ld /usr<br>drwxr-xr-x. 13 root root 155 6月 30 03:28 /usr
|-F|--classify|文件或者目录名字后加一个字符的分类标识|/目录，例如opt/; @链接，例如 bin@|
|-h|--human-readable|可读模式|将**容量**4096转为4.0k，<br>避免太大数字不能直观看出多大|
|-l|long长格式输出||
|-r|--reverse|反序，字母**降序排列文件夹**|
|-t|--time|按修改日期排序|



>cd Teenie/

切换到当前路径下的Teenie文件夹目录路径下
在几乎所有的情况下，你**可以省略”./”。它是隐含的**。

To change your working directory (where we are standing in our tree-shaped maze) we use the cd command. To do this, type cd followed by the pathname of the desired working directory. A pathname is the route we take along the branches of the tree to get to the directory we want. Pathnames can be specified in one of two different ways; as absolute pathnames or as relative pathnames. Let’s deal with absolute pathnames first.
|路径的两种方式|特征|
|---|---|
|相对路径|用**一对特殊符号**来表示相对位置：符号 “.” 指的是工作目录，”..” 指的是工作目录的父目录|
|绝对路径|**根目录开头**的“/”开始，直到它的目的地|

>cd ..

切换到上一级目录


## 操作文件和目录

|命令|含义|示例|
|---|---|---|
|mkdir|make directory|mkdir dir1<br>mkdir dir1 dir2 dir3|
|cp|copy|cp item1 item2 把单个文件item1复制成item2<br>cp item... directory 复制多个item文件/文件夹到directory文件夹|
|mv|move|移动、重命名文件|
|rm|remove|-i交互咨询；<br>-r递归;<br>-f,--force ;<br>-v,--verbose,explain what is being done。<br>rm file1 <br>	默默地删除文件<br>rm -i file1 <br>	除了在删除文件之前，提示用户确认信息之外，和上面的命令作用一样。<br>rm -r file1 dir1 <br>	删除文件 file1, 目录 dir1，及 dir1 中的内容。<br>rm -rf file1 dir1 <br>	除了如果文件 file1，或目录 dir1 不存在的话，rm 仍会继续执行。||
|ln|link|ln file link创建硬链接；<br>ln bbb.txt bbb.txt-hard<br>ln -s item link创建符号链接<br>ln -s fun fun-sym|


附：**item 表示文件或目录**








>cp /etc/passwd .

将用户账户密码拷贝至当前目录

>cp -v /etc/passwd .

"/etc/passwd"->"./passwd"
显示操作过程

>cp -i /etc/passwd .

cp:是否覆盖"./passwd"？

>cp a passwd dir1

将a与passwd文件，复制到dir1文件夹中


|cp短选项|长选项|意义|
|---|:---:|:---:|
|-a|--archive|**复制文件和目录，以及它们的属性**，包括所有权和权限。 通常，副本具有用户所操作文件的默认属性。|
|-i|--interactive|在**重写已存在文件之前，提示用户确认**。如果这个选项不指定， cp 命令会默认重写文件。|
|-r|--recursive|**递归地复制目录及目录中的内容**。当复制目录时， 需要这个选项（或者-a 选项）。|
|-u|--update|当把文件从一个目录复制到另一个目录时，**仅复制**目标目录中不存在的文件，或者是文件内容新于目标目录中已经存在的文件。|
|-v|--verbose|显示翔实的**命令操作信息**|


|mv短选项|长选项| 	意义|
|---|---|---|
|-i| --interactive |	在重写一个已经存在的文件之前，**提示用户确认信息**。 如果不指定这个选项，mv 命令会默认重写文件内容。|
|-u| --update| 	当把文件从一个目录移动另一个目录时，只是移动不存在的文件， 或者文件内容新于目标目录相对应文件的内容。|
|-v| --verbose |	当操作 mv 命令时，显示翔实的操作信息。|


## 文本处理

文本处理用处：文档、网页、电子邮件、打印输出、程序源代码


- 排序

|排序命令|功能|
|---|---|
|cat|连接文件并且打印到标准输出|
|sort|给文本行排序，结果发送到标准输出|
|uniq|报告或者省略重复行|




|cat选项|功能|
|---|---|
|-A|打印文本文档中的非打印字符|
|-n|number增加行号在文本中|
|-s|合并多余空行。3个连续空行变为1个|

|非打印字符|名称|显示效果|
|---|---|---|
|enter|回车键|$|
|tab|制表键|^I|
|space|空格||



>cat -A hello.c

打印 hello.c 文本文档中的非打印字符,让人更明了程序排版
```
#include<stdio.h>$
int main(void)$
{$
    printf("hello world");$
    return 0;$
 } $
```

sort 程序对标准输入的内容，或命令行中指定的一个或多个文件进行排序，然后把排序 结果发送到标准输出。

使用与 cat 命令相同的技巧，我们能够演示如何用 sort 程序来处理标准输入

```
sort >foo.txt 
c
a
b

Ctrl-d 组合键来表示文件的结尾

cat foo.txt 
a
b
c
看到文本行有序地显示
```
sort 程序能接受命令行中的多个文件作为参数，所以有可能把多个文件合并成一个有序的文件。

例如， 如果我们有三个文本文件，想要把它们合并为一个有序的文件。

>sort file1.txt file2.txt file3.txt > final_sorted_list.txt


|sort 程序选项|长选项 |	功能|
|---|---|---|
|-b|--ignore-leading-blanks|默认情况下，对整行进行排序，从每行的第一个字符开始。这个选项导致 sort 程序**忽略** 每行开头的**空格**，从第一个非空白字符开始排序。|
|-f|--ignore-case |	让排序不区分大小写。|
|-n |	--numeric-sort |	基于字符串的数值来排序。使用此选项允许根据数字值执行排序，而不是字母值。
|-r |	--reverse |	按相反顺序排序。结果按照**降序排列**，而不是升序。
|-k |	--key=field1[,field2]<br>偏量| 	根据**字段排序**|
|-m |	--merge |	把每个参数看作是一个预先排好序的文件。把多个文件合并成一个排好序的文件，而没有执行额外的排序。
|-o |	--output=file |	把排好序的输出结果发送到文件，而不是标准输出。
|-t| 	--field-separator=char| 	定义域**分隔字符**。默认情况下，域由空格或制表符分隔。

>du -s /usr/share/* |sort -nr |head

查看磁盘中目录，哪个文件夹占用磁盘空间大，数字逆序排列前十个
```
245984	/usr/share/fonts
122532	/usr/share/icons
114424	/usr/share/doc
89328	/usr/share/help
82640	/usr/share/libreoffice
60556	/usr/share/pyzy
55588	/usr/share/app-install
42228	/usr/share/mythes
41496	/usr/share/fcitx-sogoupinyin
39692	/usr/share/man

```




|uniq 选项|功能|
|---|---|
|-c|输出所有的重复行，并且每行开头显示重复的次数。|
|-d|只输出重复行，而不是特有的文本行。|
|-f n|忽略每行开头的 n 个字段，字段之间由空格分隔，正如 sort 程序中的空格分隔符；然而， 不同于 sort 程序，uniq 没有选项来设置备用的字段分隔符。|
|-i|在比较文本行的时候忽略大小写。|
|-s n|跳过（忽略）每行开头的 n 个字符。|
|-u|只输出独有的文本行。这是默认的。|


- 切片

|命令|功能|例子|
|---|---|---|
|cut|裁剪，从文件里取东西|cut -f 2,2 linux-by-date.txt >linux-vernums.txt|
|paste|**合并**文件文本行<br>通过读取多个文件，然后把每个文件中的字段整合成单个文本流，输入到标准输出。|paste linux-dates.txt linux-names.txt >linux-key-names.txt|
|join|往文件里加东西|join linux-key-names.txt linux-key-vernums.txt|

- 比较


|查看差异命令|功能|例子|
|---|---|---|
|comm|逐行比较两个有序的文件<br>compare|
|diff|逐行比较文件或目录<br>different<br>**如何把文件1编程文件2**|
|patch|把更改应用到原始文档中去|diff -Naur old_file new_file >patchfile.txt<br>patch < patchfile.txt|
<br>

|diff三种模式|模式内容|示例|
|---|---|---|
|normal|描述要求更改的位置和类型|
|context|上下文模式。信息有冗余|-删除行<br>+增加行<br>！更改行|
|unin|统一模式|空格：两个文件都包含这一行<br>-：在第一个文件中删除这一行<br>+：添加这一行到第一个文件中|


```
cat file1.txt
a
b
c
d

cat file2.txt
b
c
d
e

comm file1.txt file2.txt
a
            b
            c
            d
    e
1特  2特  共有

comm -12 file1.txt file2.txt
b
c
d
隐藏12列

diff file1.txt file2.txt           
1d0     如何把file1改成file2.txt?
< a     删除d第一行的a
4a4     把第2个文件的第4行
> e     加上e

diff -c file1.txt file2.txt
context模式
*** file1.txt
--- file2.txt
*************
*** 1,4 *****
-a
 b
 c
 d
--- 1,4 -----
 b
 c
 d
+e

diff -u file1.txt file2.txt
unin 统一模式
---file1.txt
+++file2.txt
@@-1,4,+1,4@@
-a
 b
 c
 d
+e
```


- 运行时编辑

The tr program is used to transliterate characters.

 tr 程序被用来更改字符。我们可以把它看作是一种基于字符的查找和替换操作。

|命令|功能|例子|
|---|---|---|
|tr|search/replace查找与替换|tr char_set1 char_set2<br>在第一个字符集里查找，替换成第2个字符集内容|

|charset三种模式|内容|
|---|---|
|list枚举|abcdefghijklmnop|
|field域|a-z or A-Z or 0-9|
|POSIX|[:lower:][:upper:]

## 停止

|停止的快捷键|功能|例子|
|---|---|---|
|ctrl+z|将任务中止（暂停的意思）,但是此任务并没有结束。<br>他仍然在进程中他只是**维持挂起的状态**,<br>用户可以使用fg/bg操作继续前台或后台的任务,<br>fg命令重新启动前台被中断的任务,<br>bg命令把被中断的任务放在后台执行.|当你vi一个文件是,如果需要用shell执行别的操作,<br>但是你又不打算关闭vi,<br>因为你得存盘退出,<br>你可以简单的按下ctrl+z,<br>shell会将vi进程挂起,<br>当你结束了那个shell操作之后,<br>你可以用fg命令继续vi你的文件。|
|ctrl+c|强制中断程序的执行,**进程**已经**终止**。|
|ctrl+d| 不是发送信号，而是表示一个特殊的二进制值，表示 EOF。<br>在shell中，**ctrl-d表示退出当前shell**|

## 权限

Linux 系统有**多用户**性能。

为了使多用户特性付诸实践，那么必须发明一种方法来阻止用户彼此之间受到影响。

毕竟，**一个用户的行为不能导致计算机崩溃，也不能乱动属于另一个用户的文件。**


|命令|详解|示例|
|---|---|---|---|
|id |Display user identity<br>显示**当前用户身份**号|#id|
|chmod|Change a file’s mode<br>更改**已经存在的文件模式**|支持两种不同的方法来改变文件模式：八进制数字表示法或 符号表示法。|
|umask|Set the default file permissions<br>设置默认的**新创建文件权限**|umask 0002<br>默认权限减2|
|chown|Change a file’s owner<br>更改文件**所有者**|
|chgrp|Change a file’s group ownership<br>更改文件**组所有权**|
|su|Run a shell as another user<br>以另一个用户的**身份**来运行 shell|
|sudo|Execute a command as another user<br>以另一个用户的**身份**来执行命令|
|passwd|Change a user’s password<br>更改**用户密码**|passwd [user]


在 Unix 术语中，每个人 是指整个世界。可以**用 id 命令，来找到关于你自己身份的信息**
>id
uid=1000(teenie) gid=1000(teenie) groups=1000(teenie),4(adm),24(cdrom),27(sudo),30(dip),46(plugdev),113(lpadmin),128(sambashare)


|id组的字符|含义|||||
|---|---|---|---|---|---|
|u|g|o|a|||
|owner<br>user|group|other|all=user+group+other|||


uid 从1000开始变号

|属性|文件(直观)|目录（不直观，需记忆）|
|---|---|---|
|r|允许打开并读取文件内容|允许列出目录中的内容，<br>前提是目录必须设置了可执行属性（x）|
|w|允许写入文件内容或截断文件。<br>但不允许对文件进行重命名或删除，<br>重命名或删除是由目录的属性决定的|允许在目录下新建、删除或重命名文件，<br>前提是目录必须设置了可执行属性（x）|
|x|允许将文件作为程序来执行，使用脚本语言编写的程序必须设置为可读才能被执行|允许进入目录，例如：cd directory|


权限的基础组合值
|Octal|Binary|File Mode|
|---|---|---|---|
|1|001|--x|execute|
|2|010|-w-|write|
|4|100|r--|read|
八进制有8种组合，对以上三种进行组合相加赋值即可。

- 对于脚本文件，有两个常见的权限设置

|脚本权限值|功能|
|---|---|
|755|每个人都能执行|
|700|只有文件所有者能够执行|
注意：为了能够**执行脚本文件**，脚本必须是**可读的**。


>chmod

```
chmod gu=rw foo.txt
组权限赋值

chmod o-x foo.txt
减去other组的x可执行功能

chmod 755 foo.txt
把文件的权限设为755

```

## 软件安装管理

**软件包管理工具：系统中，一种安装和维护软件的方法**

如果我们花些时间在 Linux 社区里，我们会看到很多像Linux发行版中哪一个是“最佳”之类的观点。 这些讨论通常非常可笑，集中在一些像桌面背景的漂亮程度（一些人不使用 Ubuntu， 只是因为 Ubuntu 默认主题颜色是棕色的！）和其它的琐碎东西上。

Linux 发行版本质量最重要的决定因素是软件包管理系统和其支持社区的持久性。随着我们 花更多的时间在 Linux 上，我们会发现它的变化是非常快的。大多数一线 Linux 发行版每隔六个月发布一个新版本，并且许多独立的程序每天都会更新。为了能和这些 如暴风雪一般多的软件保持联系，我们需要一些好工具来进行软件包管理。

**选择 linux 发行版的重要指标：软件包管理**

|该发行版是否有|
|---|
|1.好用的软件包管理系统|
|2.丰富的软件包使用|
|3.持久的社区维护更新|

对于早期 linux 用户，人们需下载和编译源代码来安装软件。
**如果有预先编译好的软件包，使用起来相对容易和快速一些**

拥有对软件源代码的访问权限是linux的伟大之处，它赋予每个人定制和优化系统权利。


|包管理两大阵营|发行版（部分列表）|包管理底层工具|包管理上层工具|
|---|---|---|---|
|.deb|Debian , Ubuntu|dpkg|apt-get, aptitude|
|.rpm|Fedora , CentOS , Red Hat , OpenSUSE |rpm|rpm|

以 ubuntu16为例:

- 查找安装

命令 子命令 包名
apt install git

apt 命令首先分析 git 依赖关系，这就是包管理的好处.
如果程序发现缺少了一个依赖，则会报错并退出。

```
Reading package lists... Done
Building dependency tree       
Reading state information... Done
The following packages were automatically installed and are no longer required:
  libllvm5.0 snapd-login-service
Use 'apt autoremove' to remove them.
Suggested packages:
  git-daemon-run | git-daemon-sysvinit git-doc git-el git-email
  git-gui gitk gitweb git-arch git-cvs git-mediawiki git-svn
The following NEW packages will be installed:
  git
0 upgraded, 1 newly installed, 0 to remove and 0 not upgraded.
Need to get 3,176 kB of archives.
After this operation, 24.1 MB of additional disk space will be used.
Get:1 http://mirrors.tuna.tsinghua.edu.cn/ubuntu xenial-updates/main amd64 git amd64 1:2.7.4-0ubuntu1.6 [3,176 kB]
Fetched 3,176 kB in 3s (878 kB/s)
Selecting previously unselected package git.
(Reading database ... 241828 files and directories currently installed.)
Preparing to unpack .../git_1%3a2.7.4-0ubuntu1.6_amd64.deb ...
Unpacking git (1:2.7.4-0ubuntu1.6) ...
Setting up git (1:2.7.4-0ubuntu1.6) ...

```

- 卸载

命令 子命令 包名
apt remove git
y

```
Reading package lists... Done
Building dependency tree       
Reading state information... Done
The following packages were automatically installed and are no longer required:
  liberror-perl libllvm5.0 snapd-login-service
Use 'apt autoremove' to remove them.
The following packages will be REMOVED:
  git git-core
0 upgraded, 0 newly installed, 2 to remove and 0 not upgraded.
After this operation, 24.1 MB disk space will be freed.
Do you want to continue? [Y/n] y
(Reading database ... 242467 files and directories currently installed.)
Removing git-core (1:2.7.4-0ubuntu1.6) ...
Removing git (1:2.7.4-0ubuntu1.6) ...
```


- 更新

apt update 更新源


更新已安装的包
命令 子命令 包名
apt upgrade git

```
Reading package lists... Done
Building dependency tree       
Reading state information... Done
git is already the newest version (1:2.7.4-0ubuntu1.6).
Calculating upgrade... Done
The following packages were automatically installed and are no longer required:
  libllvm5.0 snapd-login-service
Use 'apt autoremove' to remove them.
0 upgraded, 0 newly installed, 0 to remove and 0 not upgraded.

```

- 显示包信息

知道包名后，要显示软件包的详细信息，例如：版本号、大小、校验值和软件描述等信息时。

apt-cache show firefox
```
Package: firefox
Architecture: amd64
Version: 67.0.4+build1-0ubuntu0.16.04.1
Priority: optional
Section: web
Origin: Ubuntu
...
```
列出所有已经安装的软件包
apt list --installed
```
Listing... Done
a11y-profile-manager-indicator/xenial,xenial,xenial,now 0.1.10-0ubuntu3 amd64 [installed]
account-plugin-facebook/xenial,xenial,xenial,xenial,xenial,xenial,now 0.12+16.04.20160126-0ubuntu1 all [installed]
...
firefox/xenial-updates,xenial-security,xenial-updates,xenial-security,xenial-security,xenial-updates,now 67.0.4+build1-0ubuntu0.16.04.1 amd64 [installed]
...
```

PS:**aptitude**与 apt-get 一样，是 Debian 及其衍生系统中功能极其强大的包管理工具。

与 apt-get 不同的是，aptitude在处理依赖问题上更佳一些。

## 编译程序make

编译就是把源码（一个由程序员编写的人类可读的程序的说明）翻译成计算机处理器的语言的过程。

ubuntu16 下,编译一个叫做 diction 的程序，来自 GNU 项目。步骤：

(1)安装**编译器**

>sudo apt install ftp gcc

安装 ftp 与 gcc 两个文件。

(2)获取**源代码**

>ftp ftp.gnu.org

```
Connected to ftp.gnu.org.
220 GNU FTP server ready.

Name (ftp.gnu.org:root): anonymous


230-NOTICE (Updated October 13 2017):
...
230 Login successful.
Remote system type is UNIX.
Using binary mode to transfer files.


ftp> ls

200 PORT command successful. Consider using PASV.
150 Here comes the directory listing.
...
-rw-r--r--    1 0        0            2925 Apr 04 20:15 README
-rw-r--r--    1 0        0          405121 Oct 23  2003 before-2003-08-01.md5sums.asc
-rw-rw-r--    1 0        3003       262986 Jul 05 09:50 find.txt.gz
drwxrwxr-x  320 0        3003        12288 Jun 17 21:54 gnu
drwxrwxr-x    3 0        3003         4096 Mar 10  2011 gnu+linux-distros
-rw-rw-r--    1 0        3003       483088 Jul 05 09:50 ls-lrRt.txt.gz
drwxr-xr-x    3 0        0            4096 Apr 20  2005 mirrors
lrwxrwxrwx    1 0        0              11 Apr 15  2004 non-gnu -> gnu/non-gnu
...
226 Directory send OK.


ftp> cd gnu/dicition

550 Failed to change directory.



ftp> cd gnu/diction

250 Directory successfully changed.


ftp> ls

200 PORT command successful. Consider using PASV.
150 Here comes the directory listing.
-rw-r--r--    1 3003     65534       68940 Aug 28  1998 diction-0.7.tar.gz
-rw-r--r--    1 3003     65534       90957 Mar 04  2002 diction-1.02.tar.gz
-rw-r--r--    1 3003     65534      141062 Sep 17  2007 diction-1.11.tar.gz
-rw-r--r--    1 3003     65534         189 Sep 17  2007 diction-1.11.tar.gz.sig
226 Directory send OK.


ftp> get diction-1.11.tar.gz

local: diction-1.11.tar.gz remote: diction-1.11.tar.gz
200 PORT command successful. Consider using PASV.
150 Opening BINARY mode data connection for diction-1.11.tar.gz (141062 bytes).
226 Transfer complete.
141062 bytes received in 1.99 secs (69.1985 kB/s)


ftp> bye

221 Goodbye.
此时根目录下多了个压缩包
diction-1.11.tar.gz
```
解压缩文件

>tar xzf diction-1.11.tar.gz

(3)查看代码

*.c与*.h文件

(4)编译**预处理**

执行 configure 预处理文件=>产生 makefile脚本文件

>./configure

(5)**编译**程序

>make

执行命令 make 会直接找 makefile=>创建很多 .o 文件

(6)**安装**程序

>sudo make install

(7)**查看**程序**是否安装好**

> which diction  
/usr/local/bin/diction


|编译原因|内容|
|---|---|
|可用性|有些发行版不包含所有程序|
|即时性|获得最新版本程序|


# shell眼中看世界——“展开”

当按下 enter 键后，发生在命令行中的一些“魔法”，这种**魔法**就是**展开的过程**。

## 字符展开

>echo *

打印出当前目录下的所有文件夹名，不会显示隐藏文件。

当回车键被按下时，shell 在命令被执行前在命令行上自动展开任何符合条件的字符， 所以 echo 命令的实际参数并不是”*“，而是它展开后的结果。

## 路径名展开

>echo /usr/*/share

```
/usr/kerberos/share  /usr/local/share
```
通配符所依赖的工作机制叫做路径名展开。

## 波浪线展开

波浪线字符(“~”)有特殊的含义。

>[Teenie@wutiantian.github.io ~]$ echo ~teenie
/home/teenie


当它用在 一个单词的开头时，它会展开成指定用户的家目录名，如果没有指定用户名，则展开成当前用户的家目录

## 算术表达式展开

shell 在展开中执行算数表达式。当作计算器来使用。

算术表达式展开使用这种格式：
>$((expression))

表达式是指算术表达式，它由数值和算术操作符组成。
**注意：美元符号不能丢掉！**
例如
>echo $((2+2))
4

算术表达式**只支持整数**（全部是数字，**不带小数点**），但是能执行很多不同的操作。

|操作符|说明|
|---|---|
|+| 	加|
|-| 	减|
|*| 	乘|
|/| 	除（但是记住，因为展开只是支持整数除法，所以结果是整数。）|
|%| 	取余，只是简单的意味着，“余数”|
|**| 	取幂|

在算术表达式中**空格并不重要**，并且**表达式可以嵌套**。例如，5的平方乘以3：
注意：嵌套的$与括号切不可少！否则报错！！！

```
echo $(($((5**2))*3))
75

echo with $((5%2)) left over.
with 1 left over.
```


## 花括号展开


这种模式不能 嵌入空白字符。  
花括号展开可以嵌套。  

```
花括号的模式中 创建多个文本字符串。  
echo Front-{A,B,C}-Back
Front-A-Back Front-B-Back Front-C-Back

echo Number_{1..5}
Number_1 Number_2 Number_3 Number_4 Number_5
使用了一个整数区间

echo {Z..A}
Z Y X W V U T S R Q P O N M L K J I H G F E D C B A
倒序排列的字母区间

echo a{A{1,2},B{3,4}}b
aA1b aA2b aB3b aB4b
花括号展开可以嵌套
```



## 参数展开

**参数展开特性在 shell 脚本中比直接在命令行中更有用。**

存储小块数据，并给每块数据命名的能力有关系。许多像这样的小块数据， 更恰当的称呼应该是变量，可供你方便地检查它们。

```
"USER"的变量包含你的用户名。可以这样做来调用参数，并查看 USER 中的内容

echo $USER
teenie

查看有效的变量列表
printenv |less

```
**其它展开类型中，如果你误输入一个字符，展开就不会发生**。

这时 echo 命令只简单地显示误键入的模式。

但在参数展开中，如果你拼写错了一个变量名， 展开仍然会进行，只是展开的结果是一个空字符串。

## 命令(展开)替换

命令替换允许我们把一个命令的**输出作为一个展开模式来使用**

```
ls -l $(which cp)
-rwxr-xr-x 1 root root 151024 3月   3  2017 /bin/cp
把 which cp 的执行结果作为一个参数传递给 ls 命令，因此可以在不知道 cp 命令 完整路径名的情况下得到它的文件属性列表。

file $(ls /usr/bin/* | grep zip)
/usr/bin/funzip:     ELF 64-bit LSB executable, x86-64, version 1 (SYSV), dynamically linked, interpreter /lib64/l, for GNU/Linux 2.6.32, BuildID[sha1]=06412c648a6927c4a14c751fe2412db3425ecd0f, stripped
/usr/bin/gpg-zip:    POSIX shell script, ASCII text executable
...
管道线的输出结果成为 file 命令的参数列表
```

## 引用-控制展开

**shell 提供了一种叫做引用的机制，来有选择地禁止不需要的展开。**

```
echo this is a    test
this is a test
shell 利用单词分割删除掉 echo 命令的参数列表中多余的空格

echo The total is $100.00
The total is nu00.00

echo The total is $00.00
The total is bash0.00

echo The total is$100.00
The total isnu00.00

因为 1 是没有定义的变量,参数展开把 $1 的值替换为 nu

echo the winner is $smith
the winner is
```

## 引用-双引号-限制部分展开

把文本放在双引号中， shell 使用的**特殊字符，都失去它们的特殊含义，被当作普通字符来看待**。 

有几个例外： $，\ (反斜杠），和 `（倒引号）。

这意味着单词分割、路径名展开、 波浪线展开和花括号展开都将失效，然而**参数展开、算术展开和命令替换 仍然执行**。

使用双引号，我们可以**处理包含空格的文件名。**

```
比方说我们是不幸的 名为 two words.txt 文件的受害者。
如果我们试图在命令行中使用这个 文件，单词分割机制会导致这个文件名被看作两个独自的参数，而不是所期望 的单个参数：
ls -l two words.txt
ls: cannot access two: No such file or directory
ls: cannot access words.txt: No such file or directory

使用双引号，我们可以阻止单词分割，得到期望的结果；
进一步，我们甚至可以修复 破损的文件名。

ls -l "two words.txt"
-rw-rw-r-- 1 me   me   18 2008-02-20 13:03 two words.txt
 mv "two words.txt" two_words.txt
```

记住，在双引号中，参数展开、算术表达式展开和命令替换仍然有效：

```
echo "$USER$((2+2))"
teenie4
```

单词分割机制会在单词中寻找空格，制表符，和换行符，并把它们看作 单词之间的界定符。

这意味着无引用的空格，制表符和换行符都不是文本的一部分， 它们只作为分隔符使用。

```
echo "this is a    test"
this is a    test
```
单词分割被禁止，内嵌的空格也不会被当作界定符，它们成为参数的一部分。 

一旦加上双引号，我们的命令行就包含一个带有一个参数的命令。

```
单词分割机制把换行符看作界定符，对命令替换产生了一个虽然微妙但有趣的影响
echo $(cal)
六月 2019 日 一 二 三 四 五 六 1 2  3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30

echo "$(cal)"
      六月 2019         
日  一 二 三 四  五 六  
                   1      
 2  3  4  5  6  7  8
 9 10 11 12 13 14 15
16 17 18 19 20 21 22
23 24 25 26 27 28 29           
30                    
命令行只有一个参数，参数中包括嵌入的空格和换行符。
```

## 引用-单引号-禁止展开

如果需要禁止所有的展开，我们要使用单引号。以下例子是无引用，双引号，和单引号的比较结果
```
echo text ~/*.txt {a,b} $(echo foo) $((2+2)) $USER
text /home/teenie/*.txt a b foo 4 teenie

echo "text ~/*.txt {a,b} $(echo foo) $((2+2)) $USER"
text ~/*.txt {a,b} foo 4 teenie

echo 'text ~/*.txt {a,b} $(echo foo) $((2+2)) $USER'
text ~/*.txt {a,b} $(echo foo) $((2+2)) $USER
```

## 转义字符

**如果没有准确地理解展开模式，shell 总是神秘和混乱的源泉，并且 shell 潜在的能力也 浪费掉了。**


只想引用单个字符。
**在字符之前加上一个反斜杠，叫做转义字符。**
经常在双引号中使用转义字符，来**有选择地阻止展开**。

使用转义字符来*消除文件名中一个字符的特殊含义*，是很普遍的。  
这些字符包括”$”, “!”, “ “等字符。
```
echo "The balance for user $USER is: \$5.00"
The balance for user teenie is: $5.00
防止美元符号展开
```
# IO 重定向

## IO
”I/O”代表输入/输出。**标准的输入为键盘，标准的输出为屏幕**，而不是保存到磁盘文件。


|文件描述符|标准|文件名|
|---|---|---|
|0|标准输入|stdin|
|1|标准输出的特殊文件|stdout|
|2|标准错误的文件|stderr|




|类型输出|
|---|
|程序**运行结果**，程序要完成的功能|
|得到**状态和错误信息**， 这些告诉我们程序进展|

通过工具，你可以**重定向命令的输入输出，命令的输入来自文件，而输出也存到文件**。 

## 重定向

|重定向符号|含义|示例|
|---|---|---|
|>|覆盖内容|**清空**一个已存在文件的内容或是**创建**一个新的空文件。|
|>>|追加内容|不会冲掉以前内容|

标准错误重定向没有专用的重定向操作符。为了重定向标准错误，我们必须参考其文件描述符。
|将错误信息输出到文件操作|说明|
|---|---|
|ls -l /bin/usr 2> ls-error.txt|因为标准错误和文件描述符2一样，我们用这种 表示法来重定向标准错误<br>**文件描述符”2”，紧挨着放在重定向操作符之前，来执行重定向标准错误到文件 ls-error.txt 任务。**|
|cat ls-error.txt|ls: cannot access '/bin/usr': No such file or directory错误信息已经在所指定文件中|


重定向标准输出和错误到同一个文件
|命令|说明|
|---|---|
|ls -l /bin/usr > ls-output.txt 2>&1|首先重定向标准输出到文件 ls-output.txt，<br>然后 **重定向文件描述符2（标准错误）到文件描述符1（标准输出）使用表示法2>&1。**<br>注意重定向的**顺序**安排非常重要。标准错误的重定向必须总是出现在标准输出 重定向之后，要不然它不起作用。|

处理不需要的输出/dev/null位存储桶
>ls -l /bin/usr 2> /dev/null


## 管道操作符\|提取数据

- 把**多个命令连接起来**组成一个强大的命令**管道**。
管道操作符”|”（竖杠），一个命令的标准**输出**可以通过管道送至另一个命令的标准**输入**

>command1 | command2

- 过滤器

管道线经常用来对数据完成复杂的操作。有可能会把几个命令放在一起组成一个管道线。 通常，以这种方式使用的命令被称为过滤器。**过滤器接受输入，以某种方式改变它，然后输出它。**




|命令|含义|示例|例子|
|---|---|:---:|:---:|
|cat|Concatenate files<br>连接文件|cat [file]不分页显示|cat < abc.txt 将文件重定向输入到cat中 |
|sort|Sort lines of text<br>**排序**文本行||ls /bin /usr/bin \| sort \| less<br>因为我们指定了两个目录（/bin 和/usr/bin），ls 命令的输出结果由有序列表组成， 各自针对一个目录。通过在管道线中包含 sort，我们改变输出数据，从而产生一个 有序列表。|
|uniq|Report or omit repeated lines<br>报道或**省略重复行**||ls /bin /usr/bin \| sort \| uniq \| less<br>uniq 从 sort 命令的输出结果中，来删除任何重复行|
|grep| Print lines matching a pattern<br>打印匹配行|grep pattern [file...]|ls /bin /usr/bin \| sort \| uniq \| grep zip<br>找到文件名中包含单词”zip”的所有文件<br>方便的选项：”-i”使得 grep 在执行搜索时忽略大小写（通常，搜索是大小写 敏感的），”-v”选项会告诉 grep 只打印不匹配的行。|
|wc|Print newline, word, and byte counts for each file<br>**打印**文件中**换行符，字，和字节个数**|字计数|#wc xy.c <br>1 1 6 xy.c<br>xy.c文件中有hello内容，输出换行符1个，字1个，字节数6个<br>ls /bin /usr/bin \| sort \| uniq \| wc -l<br>-l 选项限制命令输出只能 报道行数|
|head |Output the first part of a file<br>输出文件第一部分|默认情况下，打印十行文本|head -n 5 ls-output.txt<br>只打印文件前5行<br>ls /usr/bin \| tail -n 5
|tail|Output the last part of a file<br>输出文件最后一部分|默认情况下，打印十行文本|tail -f /var/log/messages<br>tail的f选项允许实时地浏览文件。当新的内容添加到文件后，它们会立即 出现在屏幕上。这会一直继续下去直到你输入 Ctrl-c|
|tee|Read from standard input and write to standard output and files<br>从标准输入读取数据，并同时写到标准输出和文件||ls /usr/bin \| tee ls.txt \| grep zip<br>在 grep 过滤管道线的内容之前，来捕捉整个目录列表到文件 ls.txt|

比方说我们下载了一个 大型文件，这个文件被分离成多个部分（USENET 中的多媒体文件经常以这种方式分离）， 我们想把它们**连起来**。
>cat movie.mpeg.0* > movie.mpeg

movie.mpeg.001 movie.mpeg.002 … movie.mpeg.099,we could join them back together with this command




# 正则表达式

## 用“元字符”实现复杂匹配

- **学正则表达式，就是学“元字符”，实现复杂的匹配**

- **正则表达式**与**通配符**比较相似，但其规模更庞大。

- **非常灵活，组合使用方法多**

正则表达式可应用在很多命令：grep、find、less、vim...

- 正则表达式是一种符号表示法，被用来识别**文本**模式。


|两种语法|POSIX 正则表达式|类型|元字符|
|---|---|---|---|
|BRE|basic **regular expressions**|基本正则表达式|^ $ . [ ] *|
|ERE|Extended Regular Expressions|扩展正则表达式，需要添加-E选项|( ) { } ? + -  \| \\ |



## 元字符和原义字符


|字符名|字符|功能|
|---|---|---|
|锚点<br>托字符|^|start 行首<br>文本行的开头。插入符号|
|锚点<br>美元符号|$|end 结尾|
|任意字符|.|any char<br>会匹配在此位置的任意一个字符|
|中括号表达式|[]|指定 一个待匹配**字符集合**。<br>不加中括号的情况下会被解释为元字符的字符<br>一个字符集合可能包含任意多个字符，并且元字符被放置到中括号里面后会**失去了它们的特殊含义**<br>[^]not char set否定字符集里内容；|
|限定符|*|0或多匹配次数|
||( )||
|限定符|{ } | 匹配特定个数的元素<br>要求匹配的最小和最大数目|
|限定符|?|0或1匹配次数|
|限定符<br>|+|1或多匹配次数|
||-|表示一个字符范围|[A-Z],连字符'[A-Z]'，匹配大写字母'[-AZ]'|
|替换符|\||alternative|
|转义符|\\||





## grep

global regular expression print

我们能看出 grep 程序和正则表达式有关联。 

本质上，**grep 程序会在文本文件中查找一个指定的正则表达式，并把匹配行输出到标准输出**。

>grep [options] regex [file...]

regex 是指一个正则表达式。

- grep 的选项


|grep 的选项|功能|内容|
|---|---|---|
|-i|**忽略大小写**。|不会区分大小写字符。也可用--ignore-case 来指定。|
|-v|不匹配。|通常，grep 程序会打印包含匹配项的文本行。这个选项导致 grep 程序**只会打印不包含匹配项的文本行**。<br>也可用--invert-match 来指定。|
|-c|**打印匹配的数量**。| 也可用--count 选项来指定。
|-l|**打印**包含匹配项的**文件名**，而不是文本行本身|也可用--files-with-matches 选项来指定。|
|-L| 	相似于-l 选项，但是只是**打印不包含匹配项的文件名**。|也可用--files-without-match 来指定。|
|-n| 	在每个匹配行之前打印出其位于文件中的相应行号。也可用--line-number 选项来指定。|
|-h| 	应用于多文件搜索，**只显示内容，不输出**文件名。|也可用--no-filename 选项来指定。 |


- 常用 grep 命令选项


|常用 grep 命令选项|功能|
|---|---|
|ls /usr/bin \|grep bus|显示匹配到文件名中含有bus的**文件名**|
|grep bus dirlist*|显示匹配**左边为dirlist的文件名**，**右边含有bus的文件内容**|
|grep -l bus dirlist*|只显示**左边为dirlist的文件名**，不显示文件内容|
|grep -h '^bus' dirlist*|显示行首为bus开头的文件|
|grep -h 'bus' dirlist*|显示行首、中间等位置含bus的文件|
|grep -h '[^dg]bus' dirlist*|不是d,不是g开头的bus|
|grep -hE 'bus \|zip' dirlist*|找bus或zip内容，-E|
|egrep -h 'bus \|zip' dirlist*|找bus或zip内容,e|


# 专项专题(选看)


## 显示与查找文件

- 常用命令


|命令|功能|
|---|:---:|
|cat|用于显示整个文件的内容，单独使用**没有翻页功能**。<br>因此经常和 more 命令搭配使用，cat 命令还有就是可以将数个文件合并成一个文件的功能。|
|more |让画面在显示满一页时暂停，此时可按**空格健**继续**显示下一个画面**，或按 q 键停止显示。|
|less常用|less 命令的用法与 more 命令类似，也可以用来**浏览超过一页的文件**。<br>所不同的是 less 命令除了可以按空格键向下显示文件外，还可以利用**上下键**来翻动文件。<br>当要结束浏览时，只要在 less 命令的提示符“：”下按 q 键即可。|

其实这三个命令除了 cat 命令有合并文件的功能，其余功能上相近，只是从浏览习惯和显示方式上有所不同。

- 通配符 wildchar

快速指定一组文件名

|通配符|含义|例子|
|---|:---:|---|
|*|0，1，more char|
|?|1 char||
|[character]|one char in set<br>字符集中的**任何一个**|ls /etc/[dm]*.conf<br>列出以d或m开头的配置文件|
|[!character]|not one char in set<br>不是字符集中的任何一个|
|```[[:class:]]```|one char in class|

|最常使用的字符类|含义|举例|
|---|---|---|---|
|[:digit:]|number;0~9,十个数字|ls /etc/rc[[:digit:]].d<br>/etc/rc0.d /etc/rc1.d /etc/rc2.d /etc/rc3.d|
|[:lower:]|Matches any lowercase letter<br>匹配任意一个小写字母|
|[:upper:]|Matches any uppercase letter<br>匹配任意一个大写字母|
|[:alnum:]|num+alpha匹配任意一个字母或数字|
|[:alpha:]|low and upper匹配任意一个字母|

- 查找文件

|命令|内容|示例|例子|
|---|---|---|---|
|find|在一个目录层次结构中搜索文件|find<br>find dir<br>find dir condition条件<br>注意：长命令的例外之处用单横杠|find -type f查找路径下的普通文件<br>find -name "\*.txt" -or -size +100c<br>查找txt文件或大于100字节的<br>find -name "*.bak" -delete<br>删除 bak 类型文件|
|stat|显示文件或文件系统状态|



|find 文件类型|含义|
|---|---|
|b|块特殊设备文件|
|c|字符特殊设备文件|
|d|目录|
|f|普通文件|
|l|符号链接|

|字符|find 大小单位|
|---|---|
|b|512 个字节块。如果没有指定单位，则这是默认值。|
|c|字节|
|w|两个字节的字|
|k|千字节(1024个字节单位)|
|M|兆字节(1048576个字节单位)|
|G|千兆字节(1073741824个字节单位)|


- 操作符

即使拥有了 find 命令提供的所有测试条件，我们还需要一个更好的方式来**描述测试条件之间的逻辑关系**。


|操作符|描述|
|---|---|
|-and|如果操作符两边的测试条件**都是真，则匹配**。可以简写为 -a。<br>注意若没有使用操作符，则默认使用 -and。|
|-or|若操作符两边的任一个**测试条件为真，则匹配**。<br>可以简写为 -o。|
|-not|若操作符后面的测试条件是假，则匹配。可以简写为一个感叹号（!）。|
|()|把测试条件和操作符组合起来**形成更大的表达式**。这用来控制逻辑计算的优先级。<br>注意 因为圆括号字符对于 shell 来说有特殊含义，<br>所以在命令行中使用它们的时候，它们必须 用引号引起来，<br>才能作为实参传递给 find 命令。通常反斜杠字符被用来转义圆括号字符。


## 归档 tar、解压、批量

**保护数据安全主要方式之一：备份**

- 归档：把多个文件和目录合并成一个大的文件。


**归档**操作通常和**压缩**操作**配合使用**。

|功能|命令|具体功能|示例|例子|
|---|---|---|---|---|
|备份<br>backup|gzip|压缩或者展开文件<br>GNU zip|压缩 gzip<br>解压缩 gunzip<br>gzip -d filename|标准输出显示解压文件内容，内容较多，用管道分页<br>gunzip -c foo.txt.gz \| less|
|归档<br>archieve|tar|打包文件或目录<br>tap archieve|打包.tar<br>打包压缩.tgz|tar -zcvf filename.tar.gz filename/<br>表示打包后压缩|
|远程同步|rsync|同步远程文件和目录<br>remote sync|rsync options source destination<br>本地->本地，本地->远程|rsync -av  源文件  目的地|
  


- 压缩与解压缩

**gzip 程序被用来压缩**一个或多个文件。当执行 gzip 命令时，则原始文件的**压缩版会替代原始文件**。 

|gzip 选项|含义|功能||
|---|---|---|---|
|-c|creat|把输出写入到标准输出，并且**保留原始文件**。|
|-d|decompress|解压缩。gunzip <=>gzip -d|
|-f|force|**强制压缩**，即使原始文件的压缩文件已经存在了，也要执行。|
|-h|help|显示用法信息。|
|-l|list|列出每个被压缩文件的压缩数据。|
|-r|recursive|若命令的一个或多个参数是目录，则**递归**地压缩目录中的文件。|
|-t|test|测试压缩文件的完整性。|
|-v|verbose|显示压缩过程中的信息,**更详细的列表信息**。**辅助选项**|




```
(1)查看需操作文件。拷贝本机的配置文件和目录，包括脚本及用户账号密码等信息
ls -l /etc > foo.txt
ls -lh
-rw-r--r--   1 root root  15K 6月   30 22:40 foo.txt

(2)对文件进行压缩
gzip foo.txt
ll
-rw-r--r--   1 root root   2980 6月  30 22:41 foo.txt.gz

此时容量由15k变为2980，压缩变小了。并且foo.txt文件消失了，增加了红色的foo.txt.gz压缩包

(3)对压缩包进行解压
gunzip foo.txt.gz
ll
-rw-r--r--   1 root root  14907 6月   30 22:43 foo.txt
此时容量由2980变为14907，恢复原大小。并且foo.txt.gz压缩包文件消失了，增加了白色的foo.txt普通文件
```

简化上面2步骤为

```
ls -l /etc | gzip > foo.txt.gz
ll
-rw-r--r--   1 root root   2980 6月  30 22:41 foo.txt.gz
```

- 打包

>tar mode[options] pathname...

|tar 模式|功能||
|---|---|---|
|c|create 为文件和／或目录列表**创建归档文件**。|
|C|解压到指定目录||
|x|抽取归档文件。|
|r|**追加具体的路径**到归档文件的末尾。|
|t|**列出**归档文件的**内容**。|
|z|使用gzip压缩算法来压缩打包后的文件|
```
(1)归档查看需操作文件。

tar cf playground.tar playground/
ll
drwxrwxr-x 102 teenie teenie   4096 6月  30 20:34 playground/
-rw-r--r--   1 root   root    61440 6月  30 22:45 playground.tar
(2)查看归档下内容
tar tf playground.tar

(3)提取归档
把tar文件释放到foo1文件夹下
mkdir foo1
cd foo1
tar xf ../playground.tar
ll
drwxrwxr-x 102 book book 4096 6月  30 00:34 playground/
(4)归档并压缩
tar czf playground.tgz  playground
```

- 常用打包并压缩命令


|序号|功能|命令|
|---|---|---|
|1|打包|tar -cvf|
|2|g**zip压缩**|tar -c**z**vf|
|3|**bzip2**压缩|tar -c**j**vf|
|4|**解**包|tar -**x**vf|
|5|bzip2解压|tar -xjvf|

- tar 批量问题


我想进行批量解压tar文件，使用tar -xvf .tar会出错，提示“Not found in archive”。

解决方法有很多，比如写一个脚本之类的。 

请问为什么tar不支持这种通配符语法呢？是否有特殊的原因？ 我试过gzip就支持 gzip -d .tar.gz。

回答：通配符是shell解决的问题。

如``` tar -xvf *.tar ```实际上执行tar时，tar接收到的```展开是 tar -xvf a.tar b.tar c.tar …```

如果当前目录跟本没有tar的东西，那么tar就收到’*.tar’这个参数

与win不同，linux所有字符都可以作文件名，也```即目录中不存在着 *.tar这个文件```

为了防止 *.tar被shell解释为a.tar b.tar c.tar…

可以给它加个单引号。用tar解开一个Archive时，语法是 ```tar -xvf ＜tarfile.tar>```

＜tarfile.tar> 是选项f所要求的，只能是一个文件，比如myfiles.tar。

myfiles.tar所包含的归了档的文件中的一个或者多个成员文件。






- 远程同步


- 学习 sync 有什么用？
  
我感觉用不到，远端可以用git拉取，本地可以拷贝。那么有没有必要了解该指令呢？

我个人觉得指令不重要，重要的是原理。原理需要手动去实现才能更直观掌握。即使在命令行下用不到，但在其他领域，同步的概念仍然会有，例如我在双系统下，使用火狐的同一账号可以同步书签等内容，需要验证的窗口提示“sync”等单词，我看到该单词就立即明白该页内容，而不是一个陌生概念，需要翻译整个页面，还要考虑安全问题。

- 实例：把playground文件夹下内容同步到foo文件夹下

```
ls
foo playground 

rsync -av playground foo
    显示信息 源文件  目的地
此时，foo文件夹下就有了playground文件夹及其下所有内容
ls foo/
playground

rsync -av playground foo
再执行一遍，没有变化则不会做同步操作
对其中一个文件作更改则只同步那一个文件
```



## 内存与进程的性能

- 查看**磁盘剩余空间**的数量,disk free

>df


To see the current amount of **free** space on your **disk drives**

```
文件系统        含量          已用    可用    已用%  挂载点
Filesystem     1K-blocks      Used Available Use% Mounted on
udev             3041592         0   3041592   0% /dev
tmpfs             614356     16924    597432   3% /run
/dev/sda1      102049120  11838668  85003620  13% /
tmpfs            3071760       328   3071432   1% /dev/shm
tmpfs               5120         4      5116   1% /run/lock
tmpfs            3071760         0   3071760   0% /sys/fs/cgroup
/dev/sdb1      309505024    280824 293479228   1% /work
vmhgfs-fuse    524289020 292404892 231884128  56% /mnt/hgfs
tmpfs             614356        72    614284   1% /run/user/1000

```
- 显示**内存剩余空间**
  
>free


To display the amount of free memory.

```
              total        used        free      shared  buff/cache   available
Mem:        6143524      983732      506060       31860     4653732     4744492
Swap:       1045500           0     1045500
```

- 进程

现在的操作系统都支持多任务，意味着操作系统通过在一个执行中的程序和另一个 程序之间快速地切换造成了一种它同时能够做多件事情的假象。Linux 内核通过使用进程来 管理多任务。进程，就是Linux 组织安排正在等待使用 CPU的各种程序的方式。

|命令|查看进程||
|---|---|---|
|ps|Report a snapshot of current **processes**<br>报告**当前进程**快照（**内容很少**）|ps<br>ps x<br>ps aux|
|top|Display tasks<br>显示任务，每3秒钟更新一次**动态信息**|


|命令|进程控制管理||
|---|---|---|
|kill|Send a signal to a process<br>给一个进程发送信号|kill [-signal] PID|
|jobs|List active jobs<br>列出活跃的任务||
|bg|Place a job in the **background**<br>把一个任务放到后台执行|停止一个进程，而不是终止它。|
|fg|Place a job in the **foreground**<br>把一个任务放到前台执行|为了让一个进程返回前台。<br>一个在后台运行的进程对一切来自键盘的输入都免疫，也不能用 Ctrl-c 来中断它。 |




```
ps
   PID TTY          TIME CMD
 84009 pts/18   00:00:00 bash
 87162 pts/18   00:00:00 bash
 88998 pts/18   00:00:00 bash
 92203 pts/18   00:00:00 ps

ps x
   PID TTY      STAT   TIME COMMAND
  2163 ?        Ss     0:01 /lib/systemd/systemd --user
  2164 ?        S      0:00 (sd-pam)
  2169 ?        Sl     0:00 /usr/bin/gnome-keyring-daemon --daemonize --login
...

ps aux
USER        PID %CPU %MEM    VSZ   RSS TTY      STAT START   TIME COMMAND
root          1  0.0  0.0 185312  5800 ?        Ss   6月11   0:12 /sbin/init sp
root          2  0.0  0.0      0     0 ?        S    6月11   0:00 [kthreadd]
...

```
|进程号|？|命令|CPU占用率|内存消耗|虚拟内存使用|物理内存使用|进程状态|运行时长|消耗CPU时间|
|---|---|---|---|---|---|---|---|---|---|---|
|PID|TTY|CMD|%CPU|%MEM|VSZ|RSS|STAT|START|TIME|
|process id|teletype|command||memory|vitual memory|phisical memory||state|


|进程状态|意义|
|---|---|
|R|**进程正在运行**或准备运行。|
|S|**正在睡眠**。进程没有运行，而是，正在等待一个事件， 比如说，一个按键或者网络分组。|
|D|**不可中断睡眠**。进程正在等待 I/O，比方说，一个磁盘驱动器的 I/O。|
|T|**已停止**. 已经指示进程停止运行。稍后介绍更多。|
|Z|**一个死进程或“僵尸”进程**。这是一个已经终止的子进程，但是它的父进程还没有清空它。 （父进程没有把子进程从进程表中删除）|
|<|一个**高优先级进程**。这可能会授予一个进程更多重要的资源，给它更多的 CPU 时间。 进程的这种属性叫做niceness。具有高优先级的进程据说是不好的（less nice）， 因为它占用了比较多的 CPU 时间，这样就给其它进程留下很少时间。|
|N|**低优先级进程**。一个低优先级进程（一个“nice”进程）只有当其它高优先级进程被服务了之后，才会得到处理器时间。| 

- kill杀死进程

```
top

  PID USER      PR  NI    VIRT    RES    SHR S    %CPU   %MEM  TIME+ COMMAND
92495 teenie      20   0 1992668 265724 135284 S   0.3  4.3   0:29.76 firefox
...

我想关闭火狐浏览器

kill 92495
此时浏览器被关闭
```
## 存储媒介-设备挂载

llinux有非常强大得设备管理能力。

物理设备：比如说硬盘，还是网络设备。
虚拟存储设备：像 RAID（独立磁盘冗余阵列)和 LVM（逻辑卷管理器）。

**命令行需要手动完成设备挂载**

- 挂载
  
把设备连接到文件系统树种，允许设备参与操作系统的文件系统中。


|存储设备|的重要管理命令||
|---|---|---|
|mount|挂载一个文件系统|||
|umount|卸载一个文件系统|||









## 网络

**Linux 有大量丰富的网络命令**，被用来创建各式各样的网络系统和装置， 包括防火墙，路由器，名称服务器，网络连接式存储设备等。


|命令|监测网络和传输文件|例子|
|---|---|---|
|ping|发送 ICMP ECHO_REQUEST 数据包到网络主机|命令 ping 后跟IP地址或域名|
|traceroute|打印到一台网络主机的路由数据包|
|netstat|network 网络 statistics 统计 。打印网络连接，路由表，接口统计数据，伪装连接，和多路广播成员|netstat -ie<=>ifconfig打印网卡接口信息<br>netstat -rn打印路由表
|ftp|因特网文件传输程序|
|ssh|Secure Shell,client Server 22 使用22号端口。远程登录程序|ssh user_namer@host_name command|


- 丢包率---衡量通信是否正常的指标


一旦启动，ping 命令会持续在特定的时间间隔内（默认是一秒）发送数据包，直到它被中断

按下组合键 **Ctrl-c，中断这个命令之后，ping 打印出运行统计信息**。

一个正常工作的网络会报告**零个数据包丢失**。

**一个成功执行的“ping”命令会意味着网络的各个部件（网卡，电缆，路由，网关） 都处于正常的工作状态。**

- 网络测试

- 网络正常

> ping www.baidu.com

```
PING www.a.shifen.com (182.61.200.6) 56(84) bytes of data.
域名先被解析为IP地址
64 bytes from 182.61.200.6: icmp_seq=1 ttl=51 time=47.5 ms
再由 IP 地址回复消息，每隔1秒返回一个数据包
64 bytes from 182.61.200.6: icmp_seq=2 ttl=51 time=44.5 ms
64 bytes from 182.61.200.6: icmp_seq=3 ttl=51 time=44.5 ms
按 ctrl+c 后，会停止并打印简单报告
...
--- www.a.shifen.com ping statistics ---
8 packets transmitted, 8 received, 0% packet loss, time 7020ms
rtt min/avg/max/mdev = 44.533/45.274/47.577/0.957 ms
```

- 网络有问题

随便写了地址，主机不存在的，可能产生 ping 不通的情况 
>ping 192.168.20.20
等一分钟没有任何反应
```
PING 192.168.20.20 (192.168.20.20) 56(84) bytes of data.

--- 192.168.20.20 ping statistics ---
20 packets transmitted, 0 received, 100% packet loss, time 19442ms

```

- 测试网络问题的方法步骤

（1）本机 IP 地址测试

>ping 127.0.0.1

```
PING 127.0.0.1 (127.0.0.1) 56(84) bytes of data.
64 bytes from 127.0.0.1: icmp_seq=1 ttl=64 time=0.059 ms
64 bytes from 127.0.0.1: icmp_seq=2 ttl=64 time=0.027 ms
64 bytes from 127.0.0.1: icmp_seq=3 ttl=64 time=0.053 ms
64 bytes from 127.0.0.1: icmp_seq=4 ttl=64 time=0.058 ms
^C
--- 127.0.0.1 ping statistics ---
4 packets transmitted, 4 received, 0% packet loss, time 3064ms
rtt min/avg/max/mdev = 0.027/0.049/0.059/0.013 ms
```
(2)自己的 IP 地址测试

>ping 192.168.31.137

```
PING 192.168.31.137 (192.168.31.137) 56(84) bytes of data.
64 bytes from 192.168.31.137: icmp_seq=1 ttl=64 time=0.175 ms
64 bytes from 192.168.31.137: icmp_seq=2 ttl=64 time=0.060 ms
64 bytes from 192.168.31.137: icmp_seq=3 ttl=64 time=0.058 ms
^C
--- 192.168.31.137 ping statistics ---
4 packets transmitted, 4 received, 0% packet loss, time 3080ms
rtt min/avg/max/mdev = 0.048/0.085/0.175/0.052 ms
```

(3)网关测试

>ping 192.168.31.1

```
PING 192.168.31.1 (192.168.31.1) 56(84) bytes of data.
64 bytes from 192.168.31.1: icmp_seq=1 ttl=64 time=5.32 ms
64 bytes from 192.168.31.1: icmp_seq=2 ttl=64 time=3.21 ms
^C
--- 192.168.31.1 ping statistics ---
2 packets transmitted, 2 received, 0% packet loss, time 79774ms
rtt min/avg/max/mdev = 3.219/4.274/5.329/1.055 ms

```

(4)结论

若前3步都是正常的，**只有目标主机 ping 不通，则确定本机网络没问题**

目标机 192.168.20.20 的主机不存在或者宕机了。



- 网络统计

>netstat -ie

打印网卡接口信息

>ifconfig

```
Kernel Interface table
ens33     Link encap:Ethernet  HWaddr 00:0c:29:f8:f3:18  
          inet addr:192.168.31.137  Bcast:192.168.31.255  Mask:255.255.255.0
          inet6 addr: fe80::bdc1:5d66:2d85:1808/64 Scope:Link
          UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
          RX packets:1315640 errors:0 dropped:0 overruns:0 frame:0
          TX packets:266354 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:1000 
          RX bytes:504190955 (504.1 MB)  TX bytes:19535936 (19.5 MB)

lo        Link encap:Local Loopback  
          inet addr:127.0.0.1  Mask:255.0.0.0
          inet6 addr: ::1/128 Scope:Host
          UP LOOPBACK RUNNING  MTU:65536  Metric:1
          RX packets:184851 errors:0 dropped:0 overruns:0 frame:0
          TX packets:184851 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:1000 
          RX bytes:9704102 (9.7 MB)  TX bytes:9704102 (9.7 MB)
```

**UP 启用；Down 禁用**

|两张网卡|属性|IP 地址|
|---|---|---|
|ens|以太网|192.168.31.137|
|Io|虚拟网卡|127.0.0.1|


- 打印路由表

>netstat -rn
```
Kernel IP routing table
Destination     Gateway         Genmask         Flags   MSS Window  irtt Iface
0.0.0.0         192.168.31.1    0.0.0.0         UG        0 0          0 ens33
169.254.0.0     0.0.0.0         255.255.0.0     U         0 0          0 ens33
192.168.31.0    0.0.0.0         255.255.255.0   U         0 0          0 ens33
```

Destination：目的地    

192.168.31.0 本机在同一网段地址。

Gateway：网关

不能识别的地址都向网关上发，例如此处的 192.168.31.1 网关地址。网关地址为  0.0.0.0  时，不需要网关转发。

- ssh

windows可以用Xshell、PuTTY 连接到 linux 系统上。

**linux 连接到 linux 系统则用SSH命令本身**

例如，我用虚拟机中的 centOS7与ubuntu16命令行交互

```
ssh root@192.168.31.137
root@192.168.31.137's password:
Welcome to Ubuntu 16.04.6 LTS (GNU/Linux 4.15.0-52-generic x86_64)
...
Last login:Thu Jun 30 22:11:46 2019 from 192.168.31.57
```





# 定制 shell

## shell环境

- 如何建立 shell 环境？

当我们登录系统后， bash 程序启动，并且会读取一系列称为启动文件的配置脚本， 这些文件定义了默认的可供所有用户共享的 shell 环境。然后是读取更多位于我们自己家目录中 的启动文件，这些启动文件定义了用户个人的 shell 环境。确切的启动顺序依赖于要运行的 shell 会话 类型。有两种 shell 会话类型：一个是登录 shell 会话，另一个是非登录 shell 会话。

登录 shell 会话会在其中**提示用户输入用户名和密码**；例如，我们启动一个虚拟控制台会话。

|文件名|登录 shell 会话的启动文件|
|---|---|
|/etc/profile|应用于所有用户的全局配置脚本。|
|~/.bash_profile|**用户个人的启动文件**。可以用来扩展或重写全局配置脚本中的设置。|

非登录 shell 会话通常当我们在 GUI 下启动终端会话时出现。

|文件名|非登录 shell 会话的启动文件|
|---|---|
|/etc/bash.bashrc|应用于所有用户的全局配置文件。|
|~/.bashrc|**用户个人的启动文件**。可以用来扩展或重写全局配置脚本中的设置。| 


***注意：更换环境时，需要拷贝自己需要的环境文件，方便在新环境里自动配置，例如：~/.bashrc**


|检查环境变量命令|内容|例子|
|---|---|---|
|printenv|打印部分（跟参数）或全部（不跟参数）的环境变量|printenv USER<br>teenie<br>跟参数显示部分|
|set|设置 shell 选项|set|
|export|导出环境变量，让随后执行的程序知道。|
|alias|创建命令别名|详情见对应章节|


|常用变量|内容|
|---|---|
|SHELL|shell 程序的名字。|
|HOME|**家目录**|
|LANG|定义了字符集以及**语言编码**方式。|
|PATH|由冒号分开的目录列表，可执行程序路径。|
|PS1|Prompt String 1.提示字符串。 **命令提示符定义**。|
|PWD|当前工作目录。|
|TERM|**终端类型名**。类 Unix 的系统支持许多终端协议；这个变量设置你的终端仿真器所用的协议。|
|USER|你的用户名|

## 定制 shell 提示符$PS1

我目前的格式为：  
[Teenie@wutiantian.github.io ~]$  

打印当前PS1变量
```
echo $PS1
\u@wutiantian.github.io:\w\$
```
修改为自己定制的 shell 提示符步骤:
(1)打开配置文件，非登录 shell 会话的启动文件。
vi ~/.bashrc  
(2)修改命令提示符  
PS1='\u:\W\$'

保存即可设置为：[当前登陆用户@主机名 当前工作目录的最后部分]\$


|转义字符|Shell 提示符中用到的    意义|
|---|---|
|W|当前工作目录名的最后部分|
|w|当前工作完整目录名|
|\H|完整的主机名。|
|\u|当前用户名。|
|\[|标志着一系列一个或多个非打印字符的开始。这被用来嵌入非打印 的控制字符，这些字符以某种方式来操作终端仿真器，比方说移动光标或者是更改文本颜色。|
|\]|标志着非打印字符序列结束。|   

## 别名alias-创建你自己的命令


>command1; command2; command3...

把**多个命令放在同一行上，命令之间 用”;”分开**。




|命令|含义|示例|
|---|---|---|
|alias|Create an alias for a command<br>创建命令别名|alias列出机器上所有的别名<br>alias name='command string'新建别名<br>unalias foo 删除别名为foo|


```
cd /usr; ls; cd  三个命令依次执行，分好做间隔<=>alias foo='cd /usr; ls; cd'
```
注意：**若不保存配置到配置文件中，则重启后丢失别名内容**

|步骤|内容|操作|
|---|---|---|
|1|打开配置文件|vi .bashrc|
|2|添加别名行内容|alias la='ls -al'|
|3|**让配置文件起作用**|**source .bashrc**|
|4|运行，测试|la|


# 写脚本

## 注释第一行

- "!"是一个约定的标记，它告诉系统这个脚本需要什么解释器来执行

```
#!/usr/bin/bash
```

- 井号为单行注释符。
  
- 没有多行注释符。


注释提示，去系统的PATH目录中查找。


## 变量



```
my_name="jack"
my_name='jack';
```

**变量名和等号之间不能有空格,变量后面不能有;**

Shell中的引号和PHP类似，字符串可以用单引号，也可以用双引号

单引号字符串的限制：

* 单引号里的任何字符都会原样输出，单引号字符串中的**变量是无效的**（详细见单引号-禁止展开，章节）
* 单引号字串中不能出现单引号（对单引号使用转义符后也不行

双引号：

* 双引号里**可以有变量**
* 双引号里可以出现转义字符



## 使用变量

对于**已经定义过的变量，使用的适合在前面添加$**

```
echo $my_name
echo ${my_name}
```

变量名外面的**花括号**是可选的，加不加都行,建议使用第二种形式


## 声明数组

```
array_name=(value0 value1 value2 value3) 
# 或
array_name[0]=value0
array_name[1]=value1
array_name[n]=valuen
# 读取数组 ${数组名[下标]}
echo ${array_name[@]}
# 取得数组元素的个数
echo ${#array_name[@]}
# 取得数组单个元素的长度
echo ${#array_name[n]}
```



## 表达式

```
左值    右值
空间  =  值

                赋值的等号两边不能有空格
传参=传值            形参=实参
                判断的等号两边有空格
```
a=b表示**赋值**，等号前后**无空格**

a = b表示**判断**，等号前后**有空格**

[ a=b ]中括号内部字符，两边都需要有空格


## 数学运算

Shell 的数学运算和我们高级语言中的语法完全不一样。

>int a = 10 + 5;

你以为是这么写的：

```
#!/bin/bash
a=10+5
echo $a
```
Shell 中把所有东西都当成是一个字符串，所以这里它并不知道我们要它进行数学运算。

实际上在 Shell 中你要进行这样的数学运算，你应该这么写：

```
#!/bin/bash
a=`expr 10 + 5`
echo $a
```
你还可以这么写：

```
#!/bin/bash
let a=10+5
echo $a
```
我更推荐用下面这种形式：

```
(( a = 10 + 5 ))
echo $a
```


将需要运算的内容放在两对中括号里面。因为这种方式更加简洁，并且功能也是最为完整，也是最为接近高级语言的写法。


## 流程控制-if


- if

特别需要注意的是 if 后面的表达式，其左右两边都要留有一个空格，这是 Shell 的语法。
```
a=10
b=20

# if
if [ $a==$b ] 
then 
  echo "true"; 
fi

# if-else
if [$a==$b]
then
    echo 'true'
else
    echo 'false'
fi

# if-elseif-else
if [ $a == $b ]
then
   echo "a 等于 b"
elif [ $a -gt $b ]
then
   echo "a 大于 b"
elif [ $a -lt $b ]
then
   echo "a 小于 b"
else
   echo "没有符合的条件"
fi
```

## 流程控制-循环

```
#for循环
for loop in 1 2 3 4 5
do
    echo "The value is: ${loop}"
done
# 或
for ((i=0;i<100;i++))
do
    echo "The value is: ${loop}"
done
#while循环
int=0
while(( $int<=5 ))
do
    echo $int
    let "int++"
done
```


- for循环

```
for var in item1 item2 ... itemN
do
	command1
	command2
	...
	commandN
done
```
for var in item1 item2 ... itemN; do command1; command2… done;




- 无限循环

- for (( ; ; ))

- while

```
while condition
do
	command
done
```


while循环用于不断执行一系列命令，也用于从输入文件中读取数据；命令通常为测试条件。

```
int=1
while(( $int<=5 ))
do
    echo $int
    let "int++"
done
```

## 语句
## 脚本习题



- 解压imagenet2012的标注数据, 数据在/home/studyer/course/第一篇-编程基础/linux基础/作业4 批量解压。
建立文件夹test1，将压缩包放在下面
```
for dir in test1/*
do
     if test -f $dir
     then
       brr=$(echo $dir | tr "." "\n")
       brrs=( $brr )
       fileid=${brrs[0]}
       echo $fileid
       mkdir $fileid
       tar -xvf $dir -C $fileid
    fi
done
```
分析：
批量解包+右击解压Extract Here

for 变量 in 列表  

为test1/*路径下的各文件解包,dir变量文件名

do循环  

if 判断，如果dir变量文件名 ，是一个普通文件则结果为真，执行then内容

一个文件夹下循环到的可能是文件或文件夹，判断循环到的是不是文件夹

打印提取的dir变量文件名，删除"."与换行符，赋值给brr变量

brrs接收brr变量值

把brrs数组下的名称分次给fileid变量名

打印出每次的fileid变量名

创建fileid变量名的文件夹

进行解x包tar操作,过程中信息v显示在输出屏幕上，每次解包到指定的创建的fileid变量名的文件夹中。



# 附录：如何查看 man 帮助手册



一、 内容结构（说明书页的格式）

|标题|含义|
|---|---|
|Name|命令的名称和用途（摘要）|
|Synopsis|命令语法（摘要）|
|Descripition|完整描述|
|Environment|命令使用的环境变量|
|Author|作者|
|Files|对该命令重要的文件列表|
|See also|查看相关的信息位置|
|Diagnostics|诊断。可能的错误和警告|
|Bugs|错误、缺点、警告|

二、 命令语法的形式描述

（1）**方括号**中的项是**可选的**
（2）不在方括号或者大括号中的想是**必选项**
（3）**粗体字**必须按**原样**准确**键入**。这一类可能是命令名、标志和文字字符。
（4）**斜体字**必须用**适当的值代替**（不显示斜体字的系统上，通常用**下划线**代替，就如同变量一般，需要根据自己添加适当的值）
（5）后面接省略号（...）的参数可以多次重复。
（6）如果一个单独的选项和一个参数组合在一起，那么该选项和参数必须**同时使用**
（7）由|竖线字符分开的两个或多项，表示可以从这个列表中选择一个项。

三、 man 手册的章节

1、Standard commands （标准命令）
2、System calls （系统调用）
3、Library functions （库函数）
4、Special devices （设备说明）
5、File formats （文件格式）
6、Games and toys （游戏和娱乐）
7、Miscellaneous （杂项）
8、Administrative Commands （管理员命令）

四、 命令

>man man 

查看man 手册的说明

```
MAN(1)                        Manual pager utils                        MAN(1)

NAME
       man - an interface to the on-line reference manuals

SYNOPSIS
       man  [-C  file]  [-d]  [-D]  [--warnings[=warnings]]  [-R encoding] [-L
       locale] [-m system[,...]] [-M path] [-S list]  [-e  extension]  [-i|-I]
       [--regex|--wildcard]   [--names-only]  [-a]  [-u]  [--no-subpages]  [-P
       pager] [-r prompt] [-7] [-E encoding] [--no-hyphenation] [--no-justifi‐
       cation]  [-p  string]  [-t]  [-T[device]]  [-H[browser]] [-X[dpi]] [-Z]
       [[section] page ...] ...
       man -k [apropos options] regexp ...
       man -K [-w|-W] [-S list] [-i|-I] [--regex] [section] term ...
       man -f [whatis options] page ...
       man -l [-C file] [-d] [-D] [--warnings[=warnings]]  [-R  encoding]  [-L
       locale]  [-P  pager]  [-r  prompt]  [-7] [-E encoding] [-p string] [-t]
       [-T[device]] [-H[browser]] [-X[dpi]] [-Z] file ...
       man -w|-W [-C file] [-d] [-D] page ...
       man -c [-C file] [-d] [-D] page ...
       man [-?V]

```

>man ls


查看ls 命令手册的默认第一页

>man 1 ls


查看ls 命令手册的默认第一页

```
LS(1)                            User Commands                           LS(1)

NAME
       ls - list directory contents

SYNOPSIS
       ls [OPTION]... [FILE]...

DESCRIPTION
       List  information  about  the FILEs (the current directory by default).
       Sort entries alphabetically if none of -cftuvSUX nor --sort  is  speci‐
       fied.

       Mandatory  arguments  to  long  options are mandatory for short options
       too.

       -a, --all
              do not ignore entries starting with .

       -A, --almost-all
              do not list implied . and ..

       --author

```


>man 1 gcc 

用gcc编译器编译程序，查看gcc命令手册第一页
```
GCC(1)                                GNU                               GCC(1)

NAME
       gcc - GNU project C and C++ compiler

SYNOPSIS
       gcc [-c|-S|-E] [-std=standard]
           [-g] [-pg] [-Olevel]
           [-Wwarn...] [-Wpedantic]
           [-Idir...] [-Ldir...]
           [-Dmacro[=defn]...] [-Umacro]
           [-foption...] [-mmachine-option...]
           [-o outfile] [@file] infile...

       Only the most useful options are listed here; see below for the
       remainder.  g++ accepts mostly the same options as gcc.

DESCRIPTION
       When you invoke GCC, it normally does preprocessing, compilation,
       assembly and linking.  The "overall options" allow you to stop this
       process at an intermediate stage.  For example, the -c option says not
       to run the linker.  Then the output consists of object files output by
       the assembler.


```

>man 2 open 

查看系统调用open 的man 手册说明


```
OPEN(2)                    Linux Programmer's Manual                   OPEN(2)

NAME
       open, openat, creat - open and possibly create a file

SYNOPSIS
       #include <sys/types.h>
       #include <sys/stat.h>
       #include <fcntl.h>

       int open(const char *pathname, int flags);
       int open(const char *pathname, int flags, mode_t mode);

       int creat(const char *pathname, mode_t mode);

       int openat(int dirfd, const char *pathname, int flags);
       int openat(int dirfd, const char *pathname, int flags, mode_t mode);

   Feature Test Macro Requirements for glibc (see feature_test_macros(7)):

       openat():
           Since glibc 2.10:
               _XOPEN_SOURCE >= 700 || _POSIX_C_SOURCE >= 200809L

```


五、 使用范例


# 附录：学习方法

命令行与指令紧密结合，大量的命令需要记忆。想要快速得掌握，背诵和看资料是没有用的，脑子记忆不深刻，必须练习犯错才能使得脑得到异常信号来加强记忆。把A文件移动到B文件夹下，方式有很多种，选择你认为简单的那种熟练操作就好。大多数的初学者，错误都在拼写，和脑子思考深度无关。熟练了之后，再进行操作则像肌肉般，不过大脑就已经敲出代码，解决问题。

前期只有通过大量的练习，才能在复杂情况下有老司机般应急处理能力。若是连敲错一个字母这类低级语法错误的提示语句都不能立即判断出故障原因，那就不要想着处理高级任务。

**主动给自己出题**。出题意图、考察点、任务目标，自己先过一遍。

我本科期间学了一门《微机原理与接口技术》课程非常好。起步就是八大指令 MOV 的汇编跳转，后面的内容则是定时器完成40行的小程序。很多同学败在了起步，虽然只有八大指令，但指令限制导致组合很多，移动跳转都不会更无法进行后续程序编写。书上题目并不多，有的甚至因为排版是错的答案，大多数人就放弃了。而我就不同，我会在图书馆找几本同类书对比作补充。虽然每本书都有可能错一部分内容，但不可能所有书的所有题目都是错的。题目做的对不对，自己心里是有数的，几本书即使错也不会错法完全相同，所以发现错并跳过错题还是有谱的。实在没有题目时，我会自己出题，更有目标感去钻研，不会还可以上网查。通过一定数量的训练，找出规律，得出自己的正确模型进而掌握该知识。切忌停止脚步！

- 关于学习资料的选择

特别是初学编程者，敲代码的行数少于1万行，学习顺序“与任务目标一致**视频**>专门该领域**书本**>散乱的**博客**”>瞎学。

要解决的任务比较灵活，无法直接抄，或者拿来主义却完全看不懂甚至还需要做裁剪时，往往稍微翻书的三脚猫功夫是不能应付的，如果有分值，大概要70分以上。

初学者对编程思想领悟力很弱，很多地方考虑不周全，学了却有很多遗漏，应付不来任务。此时理解概念通过人讲授效果最好。至于看谁的视频，没有非得某一个人不可的说法，找前3个**有名的、有趣方便记忆的、成体系、周边练习配套完善的，新的能用的上的**（这是我学习考研政治的学法类比出来的）。认真学习一套，远比比较评价 N 套视频有效果。每个讲师其实都有各自优点，只有虔诚认真深入地掌握才能达到好的效果。

初学者书读得太快，合上书可能等于没读。太厚的书容易陷入其中，迷茫，导致章节分配时间没有规划，处处是重点草木皆兵，最后放弃。

非初学者，对该知识有所涉猎，此时时间为王。当书很厚，只缘身在此山中时，微博或 书的PPT 都能尽快**拎得清**主线，抓住重点，重点地方各个击破，快速阅读与仔细阅读结合。之后再有针对性地看某几节的视频。

关于视频，是人的经验总结。里面只要有一句话对你有用，那么就足够了。这句话往往是核心思想之一，有的是自己总结的，这是初学者巧妇难为无米之炊，脑子里的独创性。有的书中有却没注意的，往往需要看第二遍以后才发现，这时候已经花费很多时间，看视频旧能节省时间。例如，王顶老师在视频里提及的：图形让简单的任务更简单，命令行让复杂的任务成为可能。简单的两句比看多少条的优点罗列明了。

关于好书，总是要读上几遍的，温故知新，不羞耻。


# 附录：鸣谢

鸣谢王顶老师（河北经贸大学老师）！

因为我要写脚本完成批量处理的任务，所以我在腾讯课堂上观看了他的课程。网上也有其他教程，例如老男孩的运维视频节数百节之多，真心没时间看，而且与我需要的内容并不是完全重合。王顶老师的视频是13小时，39课时，长度适中，有一半课程是可以试看，我看了几节感觉独创的成语穿插知识点容易理解记忆，于是就学了下去，用QQ积分免费兑换总价15元课程，没花钱学了课程。线下我 QQ 向王顶老师请教关于脚本的学习，老师推荐我用他 github仓库上的几个脚本仓库源文件来分析练习，并在网上找了一些理论素材给我做补充。王顶老师一直以来都是有问必答，回复及时。有些与课程无关的技术问题，王老师尽最大可能把知道的知识告诉我，帮助我。因为有他，我在跨领域的学习勇敢学习应用提升自己技能与效率。感谢良师益友的陪伴！


