# 使用命令

各位小伙伴大家好，咱们接着前面的课程，继续讲解 GitHub 开源之旅第九季：Linux Bash 入门，现在咱们讲解第四个话题：一见钟情之使用命令。

到目前为止，我们已经知道了一系列神秘的命令，每个命令都有自己奇妙的选项和参数。本小节，我们将试图去掉一些神秘性，甚至创建我们自己的命令。这次课将介绍以下命令：

- type – 说明怎样解释一个命令名
- which – 显示会执行哪个可执行程序
- man – 显示命令手册页
- apropos – 显示一系列适合的命令
- info – 显示命令 info
- whatis – 显示一个命令的简洁描述
- alias – 创建命令别名

## 到底什么是命令？

我们在命令行提示符下面，输入的命令，到底是什么呢？命令可以是下面四种形式之一：

1. 是一个可执行程序，就像我们所看到的位于目录/usr/bin 中的文件一样。属于这一类的程序，可以编译成二进制文件，诸如用 C 和 C++语言写成的程序，也可以是由脚本语言写成的程序，比如说 shell，perl，python，ruby，等等。

2. 是一个内建于 shell 自身的命令。bash 支持若干命令，内部叫做 shell 内部命令 (builtins)。例如，cd 命令，就是一个 shell 内部命令。

3. 是一个 shell 函数。这些是小规模的 shell 脚本，它们混合到环境变量中。在后续的课程中，我们将讨论配置环境变量以及书写 shell 函数。但是现在，仅仅知道到它们的存在就可以了。

4. 是一个命令别名。我们可以定义自己的命令，建立在其它命令之上。

## 识别命令

能够识别一个命令是上面四种的哪一类，这是一项非常有用的技能。Linux 提供了一对方法来弄明白命令类型。

## type － 显示命令的类型

type 命令是 shell 内部命令，它会显示命令的类别，给出一个特定的命令名（做为参数）。它像这样工作：

    type command

"command"是你要检测的命令名。这里有些例子：

    [wangding@LAB ~]$ type type
    type is a shell builtins
    [wangding@LAB ~]$ type ls
    ls is aliased to `ls --color=tty`
    [wangding@LAB ~]$ type cp
    cp is /usr/bin/cp
    [wangding@LAB ~]$ ls /usr/bin/c?
    [wangding@LAB ~]$ ls -l /usr/bin/c?

我们看到这三个不同命令的检测结果。注意，ls 命令（在 Fedora 系统中）的检查结果，ls 命令实际上是 ls 命令加上选项"-\-color=tty"的别名。现在我们知道为什么 ls 的输出结果是有颜色的！

## which － 显示一个可执行程序的位置

有时候在一个操作系统中，不只安装了可执行程序的一个版本。然而在桌面系统中，这并不普遍，但在大型服务器中，却很平常。为了确定所给定的执行程序的准确位置，使用 which 命令：

    [wangding@LAB ~]$ which ls
    /bin/ls

这个命令只对可执行程序有效，不包括内部命令和命令别名，别名是真正的可执行程序的替代物。当我们试着使用 shell 内部命令时，例如，cd 命令，我们或者得不到回应，或者是个错误信息：

    [wangding@LAB ~]$ which type
    /usr/bin/which: no cd in
    (/opt/jre1.6.0_03/bin:/usr/lib/qt-3.3/bin:/usr/kerberos/bin:/opt/jre1
    .6.0_03/bin:/usr/lib/ccache:/usr/local/bin:/usr/bin:/bin:/howangding/wangding/bin)

说“命令没有找到”，真是很奇特。

## 得到命令文档

知道了什么是命令，现在我们来寻找每一类命令的帮助信息。

## help － 得到 shell 内部命令的帮助文档

bash 有一个内建的帮助工具，可供每一个 shell 内部命令使用。输入“help”，接着是 shell 内部命令名。例如：

    [wangding@LAB ~]$ help cd
    cd: cd [-L|-P] [dir]
    Change ...

注意表示法：出现在命令语法说明中的方括号，表示可选的项目。一个竖杠字符表示互斥选项。在上面 cd 命令的例子中：

    cd [-L|-P] [dir]

这种表示法说明，cd 命令可能有一个“-L”选项或者“-P”选项，进一步，可能有参数“dir”。

虽然 cd 命令的帮助文档很简洁准确，但它决不是教材。正如我们所看到的，它似乎提到了许多我们还没有谈论到的东西！不要担心，我们会学到的。

## -\-help - 显示用法信息

许多可执行程序支持一个 -\-help 选项，这个选项是显示命令所支持的语法和选项说明。例如：

    [wangding@LAB ~]$ mkdir --help
    Usage: mkdir [OPTION] DIRECTORY...
    Create ...

一些程序不支持 -\-help 选项，但不管怎样试一下。这经常会导致输出错误信息，但同时能揭示一样的命令用法信息。

## man － 显示程序手册页

许多希望被命令行使用的可执行程序，提供了一个正式的文档，叫做手册或手册页(man page)。一个特殊的叫做 man 的分页程序，可用来浏览他们。它是这样使用的：

    man program

“program”是要浏览的命令名。

手册文档的格式有点不同，一般地包含一个标题，命令语法的纲要，命令用途的说明，和命令选项列表，及每个选项的说明。然而，通常手册文档并不包含实例，它打算作为一本参考手册，而不是教材。作为一个例子，浏览一下 ls 命令的手册文档：

    [wangding@LAB ~]$ man ls

在大多数 Linux 系统中，man 使用 less 工具来显示参考手册，所以当浏览文档时，你所熟悉的 less 命令都能有效。

## apropos － 显示适当的命令

如果你不知道完成某个特定任务所需要命令的名称，可以使用一个关键字通过 apropos 实用程序来搜索它。apropos 命令会搜索 man 参考手册页，每个 man 参考手册页都有一个简短的描述，appropos 搜索的就是这个内容。这个信息虽然比较简单，但有时很有用。下面是一个以"type"为关键词来搜索参考手册的例子：

    [wangding@LAB ~]$ apropos type 
    create_floppy_devices (8)   - udev callout to create all possible
    ...

输出结果每行的第一个字段是手册页的名字，第二个字段展示章节。注意，man 命令加上"-k"选项，和 apropos 完成一样的功能。

    [wangding@LAB ~]$ man -k type 

## whatis － 显示非常简洁的命令说明

whatis 程序显示匹配特定关键字的手册页的名字和一行命令说明：

    [wangding@LAB ~]$ whatis type 
    [wangding@LAB ~]$ whatis cp
    [wangding@LAB ~]$ whatis apropos

## info － 显示程序 Info 条目

正如我们刚才通过 man 命令所看到的，Linux 和类 Unix 的系统提供的手册页，只是打算作为参考手册使用，而不是教材。所以看起来比较晦涩难懂。因此 GNU 项目提供了一个命令程序手册页的替代物，称为"info"。info 内容可通过 info 阅读器程序读取。info 页是超级链接形式的，和网页很相似。这有个例子：

    File: coreutils.info,    Node: ls invocation,    Next: dir invocation,
     Up: Directory listing

    10.1 `ls': List directory contents
    ==================================
    ...

info 程序读取 info 文件，info 文件是树型结构，分化为各个结点，每一个包含一个题目。info 文件包含超级链接，它可以让你从一个结点跳到另一个结点。一个超级链接可通过它开头的星号来辨别出来，把光标放在它上面并按下 enter 键，就可以激活它。

输入"info"，接着输入程序名称，启动 info。下表中的命令，当显示一个 info 页面时，用来控制阅读器。

<table class="multi">
<caption class="cap">表 6-2: info 命令</caption>
<thead>
<tr>
<th class="title">命令</th>
<th class="title">行为</th>
</tr>
</thead>
<tbody>
<tr>
<td valign="top" width="25%">?</td>
<td valign="top">显示命令帮助</td>
</tr>
<tr>
<td valign="top">PgUp or Backspace</td>
<td valign="top">显示上一页 </td>
</tr>
<tr>
<td valign="top">PgDn or Space</td>
<td valign="top">显示下一页</td>
</tr>
<tr>
<td valign="top">n</td>
<td valign="top">下一个 - 显示下一个结点</td>
</tr>
<tr>
<td valign="top">p</td>
<td valign="top">上一个 - 显示上一个结点</td>
</tr>
<tr>
<td valign="top">u</td>
<td valign="top">Up - 显示当前所显示结点的父结点，通常是个菜单</td>
</tr>
<tr>
<td valign="top">Enter</td>
<td valign="top">激活光标位置下的超级链接</td>
</tr>
<tr>
<td valign="top">q</td>
<td valign="top">退出</td>
</tr>
</tbody>
</table>

例如：
    [wangding@LAB ~]$ info cp

## 用别名（alias）创建你自己的命令

现在是时候，感受第一次编程经历了！我们将用 alias 命令创建一个我们自己的命令。但在开始之前，我们需要展示一个命令行小技巧。可以把多个命令放在同一行上，命令之间用";"分开。它像这样工作：

    command1; command2; command3...

我们会用到下面的例子：

    [wangding@LAB ~]$ cd /usr; ls; cd -
    bin  gawangdings    kerberos  lib64    local  share  tmp
    ...
    [wangding@LAB ~]$

正如我们看到的，我们在一行上联合了三个命令。首先更改目录到/usr，然后列出目录内容，最后回到原始目录（用命令"cd -"）,结束在开始的地方。现在，通过 alias 命令把这一串命令转变为一个命令。我们要做的第一件事就是为我们的新命令构想一个名字。比方说"test"。在使用"test"之前，查明是否"test"命令名已经存在系统中，是个很不错的主意。为了查清此事，可以使用 type 命令：

    [wangding@LAB ~]$ type test
    test is a shell builtin

哦！"test"名字已经被使用了。试一下"foo":

    [wangding@LAB ~]$ type foo
    bash: type: foo: not found

太棒了！"foo"还没被占用。创建命令别名：

    [wangding@LAB ~]$ alias foo='cd /usr; ls; cd -'

注意命令结构：

    alias name``='string'

在命令"alias"之后，输入“name”，紧接着（没有空格）是一个等号，等号之后是一串用引号引起的字符串，字符串的内容要赋值给 nawangding。我们定义了别名之后，这个命令别名可以使用在任何地方。试一下：

    [wangding@LAB ~]$ foo
    bin   gawangdings   kerberos  lib64    local   share  tmp
    ...
    [wangding@LAB ~]$

我们也可以使用 type 命令来查看我们的别名：

    [wangding@LAB ~]$ type foo
    foo is aliased to `cd /usr; ls ; cd -'

删除别名，使用 unalias 命令，像这样：

    [wangding@LAB ~]$ unalias foo
    [wangding@LAB ~]$ type foo
    bash: type: foo: not found

虽然我们有意避免使用已经存在的命令名来命名我们的别名，但这是常做的事情。通常，会把一个普遍用到的选项加到一个经常使用的命令后面。例如，之前见到的 ls 命令，会带有色彩支持：

    [wangding@LAB ~]$ type ls
    ls is aliased to 'ls --color=tty'

要查看所有定义在系统环境中的别名，使用不带参数的 alias 命令。下面在 Fedora 系统中默认定义的别名。试着弄明白，它们是做什么的：

    [wangding@LAB ~]$ alias
    alias l.='ls -d .* --color=tty'
    ...

在命令行中定义别名有点儿小问题。当你的 shell 会话结束时，它们会消失。随后的章节里，我们会了解怎样把自己的别名添加到文件中去，每次我们登录系统，这些文件会建立系统环境。现在，好好享受我们刚经历过的，步入 shell 编程世界的第一步吧，虽然微小。

## 拜访老朋友

既然我们已经学习了怎样找到命令的帮助文档，那就试着查阅，到目前为止，我们学到的所有命令的文档。学习命令其它可用的选项，练习一下！
