# 操作文件和目录

各位小伙伴大家好，咱们接着前面的课程，继续讲解 GitHub 开源之旅第九季：Linux Bash 入门，现在咱们讲解第四个话题：一见钟情之操作文件和目录。

现在，我们应该开始在 linux 上创建一些东西，留下我们学习的脚印了。本次课程将会介绍以下五个命令：

- cp copy— 复制文件和目录
- mv move — 移动/重命名文件和目录
- mkdir make directory — 创建目录
- rm remove - 删除文件和目录
- ln link — 创建硬链接和符号链接

这五个命令最常使用的 Linux 命令。它们用来操作文件和目录。

现在，说实在的，对于当学习使用 Linux 的小伙伴来说。现在你用图形界面的资源管理器来完成一些文件和目录操作的任务会更容易些。使用文件管理器，我们可以把文件从一个目录拖放到另一个目录，复制和粘贴文件，删除文件等等。那么，为什么还使用原始的命令行程序呢？

答案是，命令行程序功能强大，而且灵活。虽然资源管理器能轻松地实现简单的文件操作，但是对于复杂的文件操作任务，则使用命令行程序比较容易完成。所以，我们有一句很经典的结论：图形界面让简单的任务更简单。o而命令行界面，让复杂的任务成为可能。这一点随着大家深入的学习 linux，并积极的使用 linux，慢慢你就会有所体会的。到时候，你会真正的爱上 linux。

## 通配符

在开始介绍这五个命令之前，我们先给小伙伴们介绍一个重要的知识点，这个知识点可以让命令行变得更加强大。因为 shell 频繁地使用文件名，shell 提供了特殊字符来帮助你快速指定一组文件名。这些特殊字符叫做通配符。通配符允许你依据字符类型来选择文件名。下表列出这些通配符以及它们所选择的对象：

| 通配符 |  意义 |
| ---    | ---   |
| *      |  匹配任意多个字符（包括零个或一个）  |
| ?      |  匹配任意一个字符（不包括零个）      |
| [characters]  |  匹配任意一个属于字符集中的字符  |
| [!characters] |  匹配任意一个不是字符集中的字符  |
| [[:class:]]   |  匹配任意一个属于指定字符类中的字符 |


表5-2列出了最常使用的字符类：

|  字符类  |  意义  |
| ---      | ---    |
| [:alnum:] |  匹配任意一个字母或数字  |
| [:alpha:] |  匹配任意一个字母        |
| [:digit:] |  匹配任意一个数字        |
| [:lower:] |  匹配任意一个小写字母    |
| [:upper:] |  匹配任意一个大写字母    |

借助通配符，为文件名构建非常复杂的选择标准成为可能。下面是一些类型匹配的范例:

| 模式   |  匹配对象  |
| ---    | ---        |
|  \*    |  所有文件  ls /etc/\*.conf |
| g\*    |  文件名以“g”开头的文件  |
| b\*.txt |  以"b"开头，中间有零个或任意多个字符，并以".txt"结尾的文件 ls /etc/d\*.conf |
| Data??? |  以“Data”开头，其后紧接着3个字符的文件  |
| [abc]\* |  文件名以"a","b",或"c"开头的文件      ls /etc/[dm]\*.conf  |
| BACKUP.[0-9][0-9][0-9]  |  以"BACKUP."开头，并紧接着3个数字的文件  |
| [[:upper:]]\*  | 以大写字母开头的文件  |
| [![:digit:]]\* |  不以数字开头的文件  ls /etc/rc[[:digit:]].d |
| \*[[:lower:]123] |  文件名以小写字母结尾，或以 “1”，“2”，或 “3” 结尾的文件  |

接受文件名作为参数的任何命令，都可以使用通配符，我们后面还会开展这个知识点。

## mkdir - 创建目录

mkdir 命令 (make directory) 是用来创建目录的。它这样工作：

    mkdir directory...

注意表示法: 在描述一个命令时（如上所示），当有三个圆点跟在一个命令的参数后面，这意味着那个参数可以重复，就像这样：

    mkdir dir1

会创建一个名为"dir1"的目录，而

    mkdir dir1 dir2 dir3

会创建三个目录，名为 dir1, dir2, dir3。

## 创建游戏场（实战演习）

下面我们将要做些真正的文件操作，让我们先建立一个安全地带，来玩一下文件操作命令。首先，我们需要一个工作目录。在我们的家目录下创建一个叫做“playground”的目录。

## 创建目录

mkdir 命令被用来创建目录。首先确定我们在我们的家目录下，来创建 playground 目录，然后创建这个新目录：

    [wangding@LAB ~]$ cd
    [wangding@LAB ~]$ mkdir playground

为了让我们的游戏场更加有趣，在 playground 目录下创建一对目录，分别叫做 “dir1” 和 “dir2”。更改我们的当前工作目录到 playground，然后执行 mkdir 命令：

    [wangding@LAB ~]$ cd playground
    [wangding@LAB playground]$ mkdir dir1 dir2

注意到 mkdir 命令可以接受多个参数，它允许我们用一个命令来创建这两个目录。

## cp - 复制文件和目录

cp 命令 (copy)，复制文件或者目录。它有两种使用方法：

    cp item1 item2

复制单个文件或目录"item1"到文件或目录"item2"，和：

    cp item... directory

复制多个项目（文件或目录）到一个目录下。

## 有用的选项和实例

这里列举了 cp 命令一些有用的选项（短选项和等效的长选项）：

| 选项 |  意义  |
| ---  |---     |
| -a, --archive |  复制文件和目录，以及它们的属性，包括所有权和权限。 通常，复本具有用户所操作文件的默认属性。 |
| -i, --interactive |  在重写已存在文件之前，提示用户确认。如果这个选项不指定， cp 命令会默认重写文件。 |
| -r, --recursive   |  递归地复制目录及目录中的内容。当复制目录时， 需要这个选项（或者-a 选项）。  |
| -u, --update  | 当把文件从一个目录复制到另一个目录时，仅复制 目标目录中不存在的文件，或者是文件内容新于目标目录中已经存在的文件。  |
| -v, --verbose |  显示翔实的命令操作信息  |

cp 实例

|  命令  |  运行结果  |
| ---    | ---        |
| cp file1 file2  |  复制文件 file1 内容到文件 file2。如果 file2 已经存在， file2 的内容会被 file1 的内容重写。如果 file2 不存在，则会创建 file2。   |
| cp -i file1 file2  |  这条命令和上面的命令一样，除了如果文件 file2 存在的话，在文件 file2 被重写之前， 会提示用户确认信息。   |
|  cp file1 file2 dir1 |  复制文件 file1 和文件 file2 到目录 dir1。目录 dir1 必须存在。  |
| cp dir1/\* dir2  |  使用一个通配符，在目录 dir1 中的所有文件都被复制到目录 dir2 中。 dir2 必须已经存在。  |
| cp -r dir1 dir2  |  复制目录 dir1 中的内容到目录 dir2。如果目录 dir2 不存在， 创建目录 dir2，操作完成后，目录 dir2 中的内容和 dir1 中的一样。 如果目录 dir2 存在，则目录 dir1 (和目录中的内容)将会被复制到 dir2 中。  |

##　复制文件

下一步，让我们得到一些数据到我们的游戏场中。通过复制一个文件来实现目的。使用 cp 命令，我们从 /etc 目录复制 passwd 文件到当前工作目录下：

    [wangding@LAB playground]$ cp /etc/passwd .

注意：我们怎样使用当前工作目录的快捷方式，命令末尾的单个圆点。如果我们执行 ls 命令，可以看到我们的文件：

    [wangding@LAB playground]$ ls -l
    total 12
    drwxrwxr-x 2  wangding  wangding   4096 2008-01-10 16:40 dir1
    drwxrwxr-x 2  wangding  wangding   4096 2008-01-10 16:40 dir2
    -rw-r--r-- 1  wangding  wangding   1650 2008-01-10 16:07 passwd

现在，仅仅是为了高兴，重复操作复制命令，使用"-v"选项（唠叨），看一个它的作用：

    [wangding@LAB playground]$ cp -v /etc/passwd .
    `/etc/passwd' -> `./passwd'

cp 命令再一次执行了复制操作，但是这次显示了一条简洁的信息，指明它进行了什么操作。注意，cp 没有警告，就重写了第一次复制的文件。这是一个案例，cp 假定你知道你的所作所为。为了得到警示信息，在命令中包含"-i"选项：

    [wangding@LAB playground]$ cp -i /etc/passwd .
    cp: overwrite `./passwd'?

响应命令提示信息，输入"y"，文件就会被重写，其它的字符（例如，"n"）会导致 cp 命令不理会文件。
`
## mv - 移动和重命名文件

mv 命令 (move) 可以执行文件移动和文件命名任务，这依赖于你怎样使用它。任何一种情况下，完成操作之后，原来的文件名不再存在。mv 使用方法与 cp 很相像：

    mv item1 item2

把文件或目录 “item1” 移动或重命名为 “item2”, 或者：

    mv item... directory

把一个或多个条目从一个目录移动到另一个目录中。

## 有用的选项和实例

mv 与 cp 共享了很多一样的选项：

mv 选项

|  选项 |  意义  |
| ---   | ---    |
| -i --interactive | 在重写一个已经存在的文件之前，提示用户确认信息。 如果不指定这个选项，mv 命令会默认重写文件内容。  |
| -u --update  |  当把文件从一个目录移动另一个目录时，只是移动不存在的文件， 或者文件内容新于目标目录相对应文件的内容。  |
| -v --verbose  | 当操作 mv 命令时，显示翔实的操作信息。 |

mv 实例

| 命令   |  作用  |
| ---    |  ---  |
| mv file1 file2 |  移动 file1 到 file2。如果 file2 存在，它的内容会被 file1 的内容重写。 如果 file2 不存在，则创建 file2。 每种情况下，file1 不再存在。   |
| mv -i file1 file2 |  除了如果 file2 存在的话，在 file2 被重写之前，用户会得到 提示信息外，这个和上面的选项一样。  |
| mv file1 file2 dir1 |  移动 file1 和 file2 到目录 dir1 中。dir1 必须已经存在。  |
| mv dir1 dir2  | 如果目录 dir2 不存在，创建目录 dir2，并且移动目录 dir1 的内容到 目录 dir2 中，同时删除目录 dir1。如果目录 dir2 存在，移动目录 dir1（及它的内容）到目录 dir2。  |


## 移动和重命名文件

现在，"passwd" 这个名字，看起来不怎么有趣，这是个游戏场，所以我们给它改个名字：

    [wangding@LAB playground]$ mv passwd fun

让我们来传送 fun 文件，通过移动重命名的文件到各个子目录，然后再把它移回到当前目录：

    [wangding@LAB playground]$ mv fun dir1

首先，把 fun 文件移动目录 dir1 中，然后：

    [wangding@LAB playground]$ mv dir1/fun dir2

再把 fun 文件从 dir1 移到目录 dir2, 然后：

    [wangding@LAB playground]$ mv dir2/fun .

最后，再把 fun 文件带回到当前工作目录。下一步，来看看移动目录的效果。首先，我们先移动我们的数据文件到 dir1 目录：

    [wangding@LAB playground]$ mv fun dir1

然后移动 dir1到 dir2目录，用 ls 来确认执行结果:

    [wangding@LAB playground]$ mv dir1 dir2
    [wangding@LAB playground]$ ls -l dir2
    total 4
    drwxrwxr-x 2 wangding wangding 4096 2008-01-11 06:06 dir1
    [wangding@LAB playground]$ ls -l dir2/dir1
    total 4
    -rw-r--r-- 1 wangding wangding 1650 2008-01-10 16:33 fun

注意：因为目录 dir2 已经存在，mv 命令移动 dir1 到 dir2 目录。如果 dir2 不存在，mv 会重新命名 dir1 为 dir2。最后，把所有的东西放回原处。

    [wangding@LAB playground]$ mv dir2/dir1 .
    [wangding@LAB playground]$ mv dir1/fun .

## rm - 删除文件和目录

rm 命令 (remove) 用来移除（删除）文件和目录：

    rm item...

"item"代表一个或多个文件或目录。

## 有用的选项和实例

下表是一些普遍使用的 rm 选项：

rm 选项

|  选项  |  意义   |
| ---    | ---     |
| -i, --interactive |  在删除已存在的文件前，提示用户确认信息。 如果不指定这个选项，rm 会默默地删除文件  |
| -r, --recursive   |  递归地删除文件，这意味着，如果要删除一个目录，而此目录 又包含子目录，那么子目录也会被删除。要删除一个目录，必须指定这个选项。  |
| -f, --force  |  忽视不存在的文件，不显示提示信息。这选项颠覆了“--interactive”选项。  |
| -v, --verbose |  在执行 rm 命令时，显示翔实的操作信息。  |


rm 实例

| 命令  |  运行结果  |
| ---   | ---        |
| rm file1 |  默默地删除文件  |
| rm -i file1 |  除了在删除文件之前，提示用户确认信息之外，和上面的命令作用一样。  |
| rm -r file1 dir1 | 删除文件 file1, 目录 dir1，及 dir1 中的内容。  |
| rm -rf file1 dir1  | 同上，除了如果文件 file1，或目录 dir1 不存在的话，rm 仍会继续执行。  |


>
> 小心 rm!
>
> 类 Unix 的操作系统，比如说 Linux，没有复原命令。一旦你用 rm 删除了一些东西，它就消失了。Linux 假定你很聪明，你知道你在做什么。
>
> 尤其要小心通配符。思考一下这个经典的例子。假如说，你只想删除一个目录中的 HTML 文件。输入：
>
>  _rm *.html_
>
> 这是正确的，如果你不小心在 “\*” 和 “.html” 之间多输入了一个空格，就像这样：
>
>  _rm * .html_
>
> 这个 rm 命令会删除目录中的所有文件，还会抱怨没有文件叫做 “.html”。
>
> _小贴士。_ 无论什么时候，rm 命令用到通配符（除了仔细检查输入的内容外！），用 ls 命令来测试通配符。这会让你看到要删除的文件列表。然后按下上箭头按键，重新调用刚刚执行的命令，用 rm 替换 ls。


## 移动和重命名文件

现在，"passwd" 这个名字，看起来不怎么有趣，这是个游戏场，所以我们给它改个名字：

    [wangding@LAB playground]$ mv passwd fun

让我们来传送 fun 文件，通过移动重命名的文件到各个子目录，然后再把它移回到当前目录：

    [wangding@LAB playground]$ mv fun dir1

首先，把 fun 文件移动目录 dir1 中，然后：

    [wangding@LAB playground]$ mv dir1/fun dir2

再把 fun 文件从 dir1 移到目录 dir2, 然后：

    [wangding@LAB playground]$ mv dir2/fun .

最后，再把 fun 文件带回到当前工作目录。下一步，来看看移动目录的效果。首先，我们先移动我们的数据文件到 dir1 目录：

    [wangding@LAB playground]$ mv fun dir1

然后移动 dir1到 dir2目录，用 ls 来确认执行结果:

    [wangding@LAB playground]$ mv dir1 dir2
    [wangding@LAB playground]$ ls -l dir2
    total 4
    drwxrwxr-x 2 wangding wangding 4096 2008-01-11 06:06 dir1
    [wangding@LAB playground]$ ls -l dir2/dir1
    total 4
    -rw-r--r-- 1 wangding wangding 1650 2008-01-10 16:33 fun

注意：因为目录 dir2 已经存在，mv 命令移动 dir1 到 dir2 目录。如果 dir2 不存在，mv 会重新命名 dir1 为 dir2。最后，把所有的东西放回原处。

    [wangding@LAB playground]$ mv dir2/dir1 .
    [wangding@LAB playground]$ mv dir1/fun .

## ln — 创建链接

ln 命令既可创建硬链接，也可以创建符号链接。可以用其中一种方法来使用它：

    ln file link

创建硬链接，和：

    ln -s item link

创建符号链接，"item" 可以是一个文件或是一个目录。

## 硬链接

硬链接和符号链接比起来，硬链接是最初 Unix 创建链接的方式，而符号链接更加现代。在默认情况下，每个文件有一个硬链接，这个硬链接给文件起名字。当我们创建一个硬链接以后，就为文件创建了一个额外的目录条目。硬链接有两个重要局限性：

1. 一个硬链接不能关联它所在文件系统之外的文件。这是说一个链接不能关联与链接本身不在同一个磁盘分区上的文件。

2. 一个硬链接不能关联一个目录。

一个硬链接和文件本身没有什么区别。不像符号链接，当你列出一个包含硬链接的目录内容时，你会看到没有特殊的链接指示说明。当一个硬链接被删除时，这个链接被删除，但是文件本身的内容仍然存在（这是说，它所占的磁盘空间不会被重新分配），直到所有关联这个文件的链接都删除掉。知道硬链接很重要，因为你可能有时会遇到它们，但现在实际中更喜欢使用符号链接，下一步我们会讨论符号链接。

## 符号链接

创建符号链接是为了克服硬链接的局限性。符号链接生效，是通过创建一个特殊类型的文件，这个文件包含一个关联文件或目录的文本指针。在这一方面，它们和 Windows 的快捷方式差不多，当然，符号链接早于 Windows 的快捷方式很多年;-)

一个符号链接指向一个文件，而且这个符号链接本身与其它的符号链接几乎没有区别。例如，如果你往一个符号链接里面写入东西，那么相关联的文件也被写入。然而，当你删除一个符号链接时，只有这个链接被删除，而不是文件自身。如果先于符号链接删除文件，这个链接仍然存在，但是不指向任何东西。在这种情况下，这个链接被称为坏链接。在许多实现中，ls 命令会以不同的颜色展示坏链接，比如说红色，来显示它们的存在。

关于链接的概念，看起来很迷惑，但不要胆怯。我们将要试着练习这些命令，希望，它变得清晰起来。

    total 4
    drwxrwxr-x 2 wangding wangding 4096 2008-01-11 06:06 dir1
    [wangding@LAB playground]$ ls -l dir2/dir1
    total 4
    -rw-r--r-- 1 wangding wangding 1650 2008-01-10 16:33 fun

注意：因为目录 dir2 已经存在，mv 命令移动 dir1 到 dir2 目录。如果 dir2 不存在，mv 会重新命名 dir1 为 dir2。最后，把所有的东西放回原处。

    [wangding@LAB playground]$ mv dir2/dir1 .
    [wangding@LAB playground]$ mv dir1/fun .

## 创建硬链接

现在，我们试着创建链接。首先是硬链接。我们创建一些关联我们数据文件的链接：

    [wangding@LAB playground]$ ln fun fun-hard
    [wangding@LAB playground]$ ln fun dir1/fun-hard
    [wangding@LAB playground]$ ln fun dir2/fun-hard

所以现在，我们有四个文件"fun"的实例。看一下目录 playground 中的内容：

    [wangding@LAB playground]$ ls -l
    total 16
    drwxrwxr-x 2 wangding  wangding 4096 2008-01-14 16:17 dir1
    drwxrwxr-x 2 wangding  wangding 4096 2008-01-14 16:17 dir2
    -rw-r--r-- 4 wangding  wangding 1650 2008-01-10 16:33 fun
    -rw-r--r-- 4 wangding  wangding 1650 2008-01-10 16:33 fun-hard

注意到一件事，列表中，文件 fun 和 fun-hard 的第二个字段是"4"，这个数字是文件"fun"的硬链接数目。你要记得一个文件至少有一个硬链接，因为文件名就是由链接创建的。所以，我们怎样知道实际上 fun 和 fun-hard 是一样的文件呢？在这个例子里，ls 不是很有用。虽然我们能够看到 fun 和 fun-hard 文件大小一样（第五字段），但我们的列表没有提供可靠的信息来确定（这两个文件一样）。为了解决这个问题，我们更深入的研究一下。

当考虑到硬链接的时候，我们可以假设文件由两部分组成：包含文件内容的数据部分和持有文件名的名字部分，这将有助于我们理解这个概念。当我们创建文件硬链接的时候，实际上是为文件创建了额外的名字部分，并且这些名字都关系到相同的数据部分。这时系统会分配一连串的磁盘块给所谓的索引节点，然后索引节点与文件名字部分相关联。因此每一个硬链接都关系到一个具体的包含文件内容的索引节点。

ls 命令有一种方法，来展示（文件索引节点）的信息。在命令中加上"-i"选项：

    [wangding@LAB playground]$ ls -li
    total 16
    12353539 drwxrwxr-x 2 wangding  wangding 4096  2008-01-14  16:17  dir1
    12353540 drwxrwxr-x 2 wangding  wangding 4096  2008-01-14  16:17  dir2
    12353538 -rw-r--r-- 4 wangding  wangding 1650  2008-01-10  16:33  fun
    12353538 -rw-r--r-- 4 wangding  wangding 1650  2008-01-10  16:33  fun-hard

在这个版本的列表中，第一字段表示文件索引节点号，正如我们所见到的，fun 和 fun-hard 共享一样的索引节点号，这就证实这两个文件是一样的文件。

## 创建符号链接

建立符号链接的目的是为了克服硬链接的两个缺点：硬链接不能跨越物理设备，硬链接不能关联目录，只能是文件。符号链接是文件的特殊类型，它包含一个指向目标文件或目录的文本指针。

符号链接的建立过程相似于创建硬链接：

    [wangding@LAB playground]$ ln -s fun fun-sym
    [wangding@LAB playground]$ ln -s ../fun dir1/fun-sym
    [wangding@LAB playground]$ ln -s ../fun dir2/fun-sym

第一个实例相当直接，在 ln 命令中，简单地加上"-s"选项就可以创建一个符号链接，而不是一个硬链接。下面两个例子又是怎样呢？ 记住，当我们创建一个符号链接的时候，会建立一个目标文件在哪里和符号链接有关联的文本描述。如果我们看看 ls 命令的输出结果，比较容易理解。

    [wangding@LAB playground]$ ls -l dir1
    total 4
    -rw-r--r-- 4 wangding  wangding 1650 2008-01-10 16:33 fun-hard
    lrwxrwxrwx 1 wangding  wangding    6 2008-01-15 15:17 fun-sym -> ../fun

目录 dir1 中，fun-sym 的列表说明了它是一个符号链接，通过在第一字段中的首字符"l"可知，并且它还指向"../fun"，也是正确的。相对于 fun-sym 的存储位置，fun 在它的上一个目录。同时注意，符号链接文件的长度是6，这是字符串"../fun"所包含的字符数，而不是符号链接所指向的文件长度。

当建立符号链接时，你既可以使用绝对路径名：

    ln -s /howangding/wangding/playground/fun dir1/fun-sym

也可用相对路径名，正如前面例题所展示的。使用相对路径名更令人满意，因为它允许一个包含符号链接的目录重命名或移动，而不会破坏链接。

除了普通文件，符号链接也能关联目录：

    [wangding@LAB playground]$ ln -s dir1 dir1-sym
    [wangding@LAB playground]$ ls -l
    total 16
    ...省略

## 总结

在这一章中，我们已经研究了许多基础知识。我们得花费一些时间来全面的理解。反复练习 playground 例题，直到你觉得它有意义。能够良好的理解基本文件操作命令和通配符，非常重要。空闲时，通过添加文件和目录来拓展 playground 练习，使用通配符来为各种各样的操作命令指定文件。关于链接的概念，在刚开始接触时会觉得有点迷惑，花些时间来学习它们是怎样工作的。它们能成为真正的救星。

