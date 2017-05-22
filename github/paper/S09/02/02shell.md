# Shell 环境

各位小伙伴大家好，咱们接着前面的课程，继续讲解 GitHub 开源之旅第九季：Linux Bash 入门，现在咱们讲解第二个话题：共筑爱巢之 Shell 环境。

正如咱们之前所讨论到的，shell 在 shell 会话中维护着大量的信息，这些信息称为 (shell) 环境。存储在 shell 环境中的数据被程序用来确定配置参数。虽然大多数程序用配置文件来存储程序设置，某些程序也会查找存储在 shell 环境中的数值来调整他们的行为。知道了这些，我们就可以用 shell 环境来自定制 shell 体验。

在这一章，我们将用到以下命令：

- printenv - 打印部分或所有的环境变量
- set - 设置 shell 选项
- export — 导出环境变量，让随后执行的程序知道。
- alias - 创建命令别名

## 什么存储在环境变量中？

shell 在环境中存储了两种基本类型的数据，它们是环境变量和 shell 变量。Shell 变量是由 bash 存放的少量数据，而剩下的基本上都是环境变量。除了变量，shell 也存储了一些可编程的数据，命名为别名和 shell 函数。我们已经在上篇课程中讨论了别名，而 shell 函数（涉及到 shell 脚本）将会在后续的课程中讨论。

## 检查环境变量

我们既可以用 bash 的内部命令 set，或者是 printenv 程序来查看环境中存储了什么。set 命令可以显示 shell 和环境变量两者，而 printenv 只是显示环境变量。因为环境变量内容列表相当长，所以最好把每个命令的输出结果管道到 less 命令：

    [wangding@LAB ~]$ printenv | less

执行以上命令之后，我们应该能得到类似以下内容：

    KDE_MULTIHEAD=false
    SSH_AGENT_PID=6666
    ......

我们所看到的是环境变量及其数值的列表。例如，我们看到一个叫做 USER 的变量，这个变量值是"wangding"。printenv 命令也能够列出特定变量的数值：

    [wangding@LAB ~]$ printenv USER
    wangding

当使用没有带选项和参数的 set 命令时，shell 和环境变量二者都会显示，同时也会显示定义的 shell 函数。不同于 printenv 命令，set 命令的输出结果很礼貌地按照字母顺序排列：

    [wangding@LAB ~]$ set | less

也可以通过 echo 命令来查看一个变量的内容，像这样：

    [wangding@LAB ~]$ echo $HOME
    /home/me

如果 shell 环境中的一个成员既不可用 set 命令也不可用 printenv 命令显示，则这个变量是别名。输入不带参数的 alias 命令来查看它们:

    [wangding@LAB ~]$ alias
    alias l.='ls -d .* --color=tty'
    ...

## 一些有趣的变量

shell 环境中包含相当多的变量，不同的发行版 shell 环境中的信息可能有所不同，但是你可能会看到以下变量：

<table class="multi">
<caption class="cap">表12-1: 环境变量</caption>
<tr>
<th class="title">变量</th>
<th class="title">内容</th>
</tr>
<tr>
<td valign="top">SHELL</td>
<td valign="top">shell 程序的名字。</td>
</tr>
<tr>
<td valign="top">HOME</td>
<td valign="top">用户家目录。</td>
</tr>
<tr>
<td valign="top">LANG</td>
<td valign="top">定义了字符集以及语言编码方式。</td>
</tr>
</tr>
<tr>
<td valign="top">PATH</td>
<td valign="top">由冒号分开的目录列表，当你输入可执行程序名后，会搜索这个目录列表。
</td>
</tr>
<tr>
<td valign="top">PS1</td>
<td valign="top">Prompt String 1. 这个定义了你的 shell 提示符的内容。随后我们可以看到，这个变量内容可以全面地定制。
</td>
</tr>
<tr>
<td valign="top">PWD</td>
<td valign="top">当前工作目录。</td>
</tr>
<tr>
<td valign="top">TERM </td>
<td valign="top">终端类型名。类 Unix 的系统支持许多终端协议；这个变量设置你的终端仿真器所用的协议。
</td>
</tr>
<tr>
<td valign="top">USER</td>
<td valign="top">你的用户名</td>
</tr>
</table>

如果缺失了一些变量，不要担心，这些变量会因发行版本的不同而不同。

## 如何建立 shell 环境？

当我们登录系统后，启动 bash 程序，并且会读取一系列称为启动文件的配置脚本，这些文件定义了默认的可供所有用户共享的 shell 环境。然后是读取更多位于我们自己家目录中的启动文件，这些启动文件定义了用户个人的 shell 环境。精确的启动顺序依赖于要运行的 shell 会话类型。有两种 shell 会话类型：一个是登录 shell 会话，另一个是非登录 shell 会话。

登录 shell 会话会提示用户输入用户名和密码；例如，我们启动一个虚拟控制台会话。当我们在 GUI 模式下运行终端会话时，非登录 shell 会话会出现。

登录 shell 会读取一个或多个启动文件，正如表12－2所示：

<table class="multi">
<caption class="cap">表12-2: 登录 shell 会话的启动文件</caption>
<tr>
<th class="title">文件</th>
<th class="title">内容</th>
</tr>
<tr>
<td valign="top" width="25%">/etc/profile</td>
<td valign="top">应用于所有用户的全局配置脚本。</td>
</tr>
<tr>
<td valign="top">~/.bash_profile </td>
<td valign="top">用户私人的启动文件。可以用来扩展或重写全局配置脚本中的设置。</td>
</tr>
</table>

非登录 shell 会话会读取以下启动文件：

<table class="multi">
<caption class="cap">表12-3: 非登录 shell 会话的启动文件</caption>
<tr>
<th class="title">文件</th>
<th class="title">内容</th>
</tr>
<tr>
<td valign="top" width="25%">/etc/bashrc </td>
<td valign="top">应用于所有用户的全局配置文件。</td>
</tr>
<tr>
<td valign="top">~/.bashrc</td>
<td valign="top">用户私有的启动文件。可以用来扩展或重写全局配置脚本中的设置。
</td>
</tr>
</table>

除了读取以上启动文件之外，非登录 shell 会话也会继承它们父进程的环境设置，通常是一个登录 shell。浏览一下你的系统，看一看系统中有哪些启动文件。记住－因为上面列出的大多数文件名都以圆点开头（意味着它们是隐藏文件），你需要使用带"-a"选项的 ls 命令。

在普通用户看来，文件 ~/.bashrc 可能是最重要的启动文件，因为它几乎总是被读取。非登录 shell 默认会读取它，并且大多数登录 shell 的启动文件会以能读取 ~/.bashrc 文件的方式来书写。

## 一个启动文件的内容

如果我们看一下典型的 .bash_profile 文件，它看起来像这样：

    # .bash_profile
    # Get the aliases and functions
    if [ -f ~/.bashrc ]; then
    . ~/.bashrc
    fi
    # User specific environment and startup programs
    PATH=$PATH:$HOME/bin
    export PATH

以"#"开头的行是注释，shell 不会读取它们。它们在那里是为了方便人们阅读。第一件有趣的事情发生在第四行，伴随着以下代码：

    if [ -f ~/.bashrc ]; then
    . ~/.bashrc
    fi

这叫做一个 if 复合命令，我们将会在 Shell 编程的课程中详细介绍它，现在我们对它翻译一下：

    If the file ~/.bashrc exists, then
    read the ~/.bashrc file.

我们可以看到这一小段代码就是一个登录 shell 得到 .bashrc 文件内容的方式。在我们启动文件中，下一件有趣的事与 PATH 变量有关系。

你是否曾经感到困惑，shell 是怎样知道，到哪里找到我们在命令行中输入的命令的？例如，当我们输入 ls 后，shell 不会查找整个计算机系统，来找到 /bin/ls（ls 命令的绝对路径名），而是，它查找一个目录列表，这些目录包含在 PATH 变量中。

PATH 变量经常（但不总是，依赖于发行版）在 /etc/profile 启动文件中设置，通过这些代码：

    PATH=$PATH:$HOME/bin

修改 PATH 变量，添加目录 $HOME/bin 到目录列表的末尾。这是一个参数展开的实例，参数展开我们在第八章中提到过。为了说明这是怎样工作的，试试下面的例子：

    [wangding@LAB ~]$ foo="This is some"
    [wangding@LAB ~]$ echo $foo
    This is some
    [wangding@LAB ~]$ foo="$foo text."
    [wangding@LAB ~]$ echo $foo
    This is some text.

使用这种技巧，我们可以把文本附加到一个变量值的末尾。通过添加字符串 $HOME/bin 到 PATH 变量值的末尾，则目录 $HOME/bin 就添加到了命令搜索目录列表中。这意味着当我们想要在自己的家目录下，创建一个目录来存储我们自己的私人程序时，shell 已经给我们准备好了。我们所要做的事就是把创建的目录叫做 bin。

最后，有下面一行代码：

    export PATH

这个 export 命令告诉 shell 让这个 shell 的子进程可以使用 PATH 变量的内容。

## 修改 shell 环境

既然我们知道了启动文件所在的位置和它们所包含的内容，我们就可以修改它们来定制自己的 shell 环境。

## 我们应该修改哪个文件？

按照通常的规则，添加目录到你的 PATH 变量或者是定义额外的环境变量，要把这些更改放置到 .bash_profile 文件中。对于其它的更改，要放到 .bashrc 文件中。除非你是系统管理员，需要为系统中的所有用户修改默认设置，那么则限定你只能对自己家目录下的文件进行修改。

## 使用文本编辑器

所有的文本编辑器都可以通过在命令行中输入编辑器的名字，加上你所想要编辑的文件来唤醒。如果所输入的文件名不存在，编辑器则会假定你想要创建一个新文件。下面是一个使用 vi 的例子：

    [wangding@LAB ~]$ vi some_file

这条命令将会启动 vi 文本编辑器，同时加载名为 "some_file" 的文件，如果这个文件存在的话。

我们将集中精力在我们第一个基于文本的文本编辑器，vi。让我们启动 vi，并且编辑文件 .bashrc。但是在我们这样做之前，先练习一些"安全防护"。当我们编辑一个重要的配置文件时，首先创建一个这个文件的备份总是一个不错的主意。这样能避免我们在编辑文件时弄乱文件。创建文件 .bashrc 的备份文件，这样做：

    [wangding@LAB ~]$ cp .bashrc .bashrc.bak

备份文件的名字无关紧要，只要选择一个容易理解的文件名。现在我们有了一个备份文件，我们启动 vi 编辑器吧：

    [wangding@LAB ~]$ vi .bashrc

一旦 vi 编辑器启动后，我们将会得到一个像下面一样的屏幕：

    GNU nano 2.0.3
    ....

注意：如果你的系统中没有安装 nano 编辑器，你可以用一个图形化的编辑器代替。

这个屏幕由上面的标头，中间正在编辑的文件文本和下面的命令菜单组成。因为设计 nano 是为了代替由电子邮件客户端提供的编辑器的，所以它相当缺乏编辑特性。在任一款编辑器中，你应该学习的第一个命令是怎样退出程序。以 nano 为例，你输入 Ctrl-x 来退出 nano。在屏幕底层的菜单中说明了这个命令。"^X" 表示法意思是 Ctrl-x。这是控制字符的常见表示法，许多程序都使用它。

第二个我们需要知道的命令是怎样保存我们的劳动成果。对于 nano 来说是 Ctrl-o。尽然我们已经获得了这些知识，接下来我们准备做些编辑工作。使用下箭头按键和 / 或下翻页按键，移动鼠标到文件的最后一行，然后添加以下几行到文件 .bashrc 中：

    alias la='ls -la --color=auto'

注意：你的发行版可能已经包含其中的一些行，但是复制没有任何伤害。

下表是所添加行的意义：

<table class="multi">
<caption class="cap">表12-4:</caption>
<tr>
<th class="title">文本行</th>
<th class="title">含义</th>
</tr>
<tr>
<td valign="top" width="25%">alias la='ls -la --color=auto'
</td>
<td valign="top">创建一个叫做'la'的命令，这个命令会显示长格式目录列表。</td>
</tr>
</table>

正如我们所看到的，我们添加的许多代码的意思直觉上并不是明显的，所以添加注释到我们的文件 .bashrc 中是一个好主意，可以帮助人们理解。使用编辑器，更改我们添加的代码，让它们看起来像这样：

     # Add some helpful aliases
    alias ll='ls -l --color=auto'

啊，看起来好多了! 当我们完成修改后，输入 Ctrl-o 来保存我们修改的 .bashrc 文件，输入 Ctrl-x 退出 nano。

>
> _为什么注释很重要？_
>
> 不管什么时候你修改配置文件时，给你所做的更改加上注释都是一个好主意。的确，明天你会记得你修改了的内容，但是六个月之后会怎样呢？帮自己一个忙，加上一些注释吧。当你意识到这一点后，对你所做的修改做个日志是个不错的主意。
>
> Shell 脚本和 bash 启动文件都使用 "#" 符号来开始注释。其它配置文件可能使用其它的符号。大多数配置文件都有注释。把它们作为指南。
>
> 你会经常看到配置文件中的一些行被注释掉，以此防止它们被受影响的程序使用。这样做是为了给读者在可能的配置选项方面一些建议，或者给出正确的配置语法实例。例如，Ubuntu 8.04 中的 .bashrc 文件包含这些行：
>
>     # some more ls aliases
>     #alias ll='ls -l'
>     #alias la='ls -A'
>     #alias l='ls -CF'
>
> 最后三行是有效的被注释掉的别名定义。如果你删除这三行开头的 "#" 符号，此技术程称为 uncommenting (取消注释)，这样你就会激活这些别名。相反地，如果你在一行的开头加上 "#" 符号，你可以注销掉这一行，但会保留它所包含的信息。

## 激活我们的修改

我们对于文件 .bashrc 的修改不会生效，直到我们关闭终端会话，再重新启动一个新的会话，因为 .bashrc 文件只是在刚开始启动终端会话时读取。然而，我们可以强迫 bash 重新读取修改过的 .bashrc 文件，使用下面的命令：

    [wangding@LAB ~]$ source .bashrc

运行上面命令之后，我们就应该能够看到所做修改的效果了。试试其中一个新的别名：

    [wangding@LAB ~]$ la

## 总结

在这次课中，我们学到了用文本编辑器来编辑配置文件的必要技巧。随着继续学习，当我们读到命令的手册页时，记录下命令所支持的环境变量。可能会有一个或两个宝贝。在随后的课程中，我们将会学习 shell 函数，一个很强大的特性，你可以把它包含在 bash 启动文件里面，以此来添加你自定制的命令宝库。
