# 如何安装 Jmeter

## JMeter 支持的操作系统

JMeter 是一个纯 Java 编写的应用程序，可以运行在任何操作系统上，只要该操作系统有兼容的 Java 实现。

JMeter 支持的操作系统列表如下：

| 操作系统  | Java 虚拟机  | 体系结构 |
| -------  | ------------- | ------- |
| Free BSD 9.0 | Open JDK 6 | amd64  |
| Linux 2.4, 2.6, 3.1 |	Sun JDK 5, 6, 7 和 Open JDK 6 | i386, amd64 |
| Mac OS  | JDK6  | |
| windows XP | Sun JDK6, Sun JDK 7 | 32/64 位 |
| windows 7  | Sun JDK 5, 6, 7  | 32 位  |

本課程中，我们在 windows 操作系統上运行 JMeter

## 安装 JMeter 的步骤

步骤一：安装 Java

因为 JMeter 是纯 Java 桌面应用程序，它需要一个完全兼容的 JVM 7 或更高。你可以下载并安装最新版本的Java SE 开发工具包。

![](./images/JavaDownload.png)

[Java 平台(JDK)](http://www.oracle.com/technetwork/java/javase/downloads/index.html)

安装完成后，你可以使用下面的步驟来检查，Java JDK 是否成功的安裝在你的系统上

- 在 Window/Linux,去终端
- 输入命令 java -version

如果 Java 运行环境安装成功，你将看到下图的输出

How to install Jmeter in easy steps

如果没有显示,请重新安装Java SE运行时环境
步骤2)Jmeter下载

在撰写本文时,最新版本的JMeter是多少 Apache JMeter 2.9 。 你可以下载它 在这里

选择二进制文件(zip或tgz)下载如下图所示

How to install Jmeter in easy steps
步骤3)安装

JMeter安装是非常简单和容易的。 只需将zip / tar文件解压缩到您希望JMeter安装的目录。 没有繁琐的安装屏幕处理! 简单的解压缩和你做!

一旦完成了解安装目录结构应该类似于如下图

How to install Jmeter in easy steps

下面的描述是JMeter目录和它的重要性JMeter目录包含很多文件和目录

    / 本 :包含从JMeter的JMeter脚本文件
    / 文档 :JMeter文档文件
    /临时演员 :蚂蚁相关额外的文件
    / 自由 JMeter /:包含所需的Java库
    /lib/ext :包含核心JMeter jar文件和协议
    /lib/junit 用于JMeter:JUnit库
    / printable_docs :

步骤4)JMeter发射

你可以开始JMeter 3模式

    GUI模式
    服务器模式
    命令行模式

开始JMeter GUI模式

如果您使用的是窗口,运行文件 /bin/jmeter.bat 开始JMeter GUI模式如下所示

 How to install Jmeter in easy steps

以下图注释JMeter的各种组件的GUI

How to install Jmeter in easy steps
在服务器模式开始JMeter

用于服务器模式 分布式 测试。 这个测试工作 客户机-服务器 模型。 在这个模型中,JMeter服务器计算机上运行 服务器 模式。 客户端电脑上,运行JMeter GUI 模式。

启动服务器模式,运行bat文件本\ jmeter-server.bat 如下图

How to install Jmeter in easy steps
在命令行模式下JMeter开始

JMeter GUI模式消耗计算机内存。 为节约资源,您可以选择运行JMeter没有GUI。 为此,使用下面的命令选项

How to install Jmeter in easy steps

这是一个命令行例子

jmeter美元- n - t测试规划。 jmx - l日志。 8000年韩国乐团- h 127.0.0.1 - p

How to install Jmeter in easy steps
额外的包

根据你的要求,你需要一个或多个可选包下面列出。

    Java编译器

一万一千一百一十一Java编译器允许开发者建立JMeter源代码和其他JMeter插件

    SAX XML解析器

         SAX 是简单的API为XML,最初是一个纯java API。 您可以使用SAX XML解析器作为替代在JMeter XML解析器

    电子邮件支持

一万一千一百一十一JMeter有着丰富的电子邮件功能。 它可以根据测试结果发送电子邮件,有一个POP3 / IMAP的取样器。 它也有一个SMTP取样器。

    JDBC驱动程序

一万一千一百一十一如果你想测试数据库服务器,您必须安装JDBC驱动程序
在Linux中使用JMeter

    在Linux中使用JMeter是一样的窗口,只需运行以下 shell脚本 。
    运行脚本文件 jmeter (这个文件没有扩展名)——运行JMeter(默认在GUI模式)。
    运行脚本文件 jmeter-server ——开始JMeter服务器模式(与合适的参数调用JMeter脚本)
    jmeter.sh ——非常基本的JMeter脚本没有JVM选项指定。
    mirror-server.sh ——在非gui运行JMeter镜像服务器模式
    shutdown.sh ——非gui运行关闭客户端停止实例优雅
    stoptest.sh ——运行关闭客户端突然停止非gui实例
