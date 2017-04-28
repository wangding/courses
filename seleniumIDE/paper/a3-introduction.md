## Selenium介绍
### 是什么

Selenium到底是什么，很难用一句话来说清楚。

* Selenium 是一套测试 Web应用程序用户界面的常用框架，直接运行在浏览器中，模拟用户的操作。可以用于单元测试、回归测试、冒烟测试、集成测试、验收测试。
* Selenium 1.0 的核心是用JavaScript写的。
* Selenium 支持各种操作系统：windows、mac、linux。
* Selenium 支持多种浏览器：IE、chrome、firefox、Safari、Android手机浏览器等。
* Selenium 支持多种编程语言：C#、Java、Python、Ruby、PHP、Perl，等。
* Selenium 是开源免费的。

**八卦**

在这里，我还想说一下关于Selenium名字的来源，很有意思的：Selenium的中文名为“硒”，是一种化学元素，在元素周期表中原子序数34，原子质量78.96，它对汞 （Mercury）有天然的解毒作用，实验表明汞暴露水平越高，硒对汞毒性的拮抗作用越明显，所以说硒是汞的克星。大家应该知道Mercury（美科利公司）的测试工具系列吧（QTP，QC，LR，WR...），他们功能强大，但却价格不菲，大家对此又爱又恨！故thoughtworks特意把他们的Web开源测试工具命名为Selenium，以此帮助大家脱离汞毒。

### 发展过程

* 2004年在ThoughtWorks 公司， 一个叫做Jason Huggins为了减少手工测试的工作， 自己写了一套JavaScript的库， 这套库可以进行页面交互， 并且可以重复的在不同浏览器上进行重复的测试操作。这套库后来变为了Selenium Core。为Selenium Remote Control (RC) 和Selenium IDE 提供了坚实的核心基础能力Selenium 的作用是划时代的，因为他允许你使用多种语言来控制浏览器。
* 但是浏览器的对JavaScript的安全限制也对Selenium的发展带来了困扰，并且Web程序也越来越大，特性也越来越多，都对selenium的发展来说带来了不少困难。2006年Google 的工程师Simon Stewart开启了一个叫做WebDriver的项目，此项目可以直接让测试工具使用浏览器和操作系统本身提供的方法， 借此来绕过JS环境的沙盒效应，WebDriver 项目目标就是为了解决Selenium的痛处。
* 2008年，Selenium 和 WebDriver 这两个项目进行了合并， Selenium 2.0 出现了，也就是大家说的WebDriver。

### 组成

#### Selenium 的组成

* Selenium IDE
* Selenium RC
* Selenium WebDriver
* Selenium Grid

![Selenium的组成](http://www.way2automation.com/selenium/tutorial/images/banner.jpg)

![Selenium 的发展及组成](http://seleniumtutorialpoint.com/wp-content/uploads/2015/04/Picture1.bmp)

这里面我们重点掌握Selenium IDE，因为我们是Web自动化测试入门课程，进阶课程，我们会学习2和4。所以除了Selenium IDE，其他的我们只要了解就好了。

#### Selenium RC

Selenium 1.0中 RC（Remote Control）是Selenium家族的核心工具， 支持多种不同的语言编写自动化测试脚本，通过 Selenium RC的服务器作为代理服务器去访问应用从而达到测试的目的。

**工作原理**

![selenium RC 工作原理](http://docs.seleniumhq.org/selenium-rc.png)

Selenium RC 分 Client Libraries 和 Selenium Server，Client Libraries库主要主要用于编写测试脚本，用来控制Selenium Server。Selenium Server负责控制浏览器行为，总的来说，Selenium Server 主要包括3个部分：Launcher、HTTP Proxy、Core。 其中Selenium Core是被Selenium Server嵌入到浏览器页面中的，其实就是一堆 JavaScript 函数的集合，通过这些JavaScrpit函数实现用程序对浏览器进行操作，Launcher用于启动浏览器，把 Selnium Core 加载到浏览器页面当中，并把浏览器的代理设置为Selenium Server的HTTP Proxy。这些都是Selenium 1.0 中技术，现在基本上已经不用了。关于Selenium RC的内容我们知道这些就足够了，如果市面上有讲Selenium RC的书，大家就不要买了。而且大家去企业面试自动化测试职位的时候，基本上也没有Selenium RC方面的面试题。

#### Selenium WebDriver

这是全代码形态的自动化测试，需要调用的库函数，都封装在这里。



#### Selenium Grid

Selenium Grid是一种自动化的测试辅助工具， 利用Grid可以很方便地同时在多台机器上和异构环境中并行运行多个测试事例。 其特点为：并行执行；通过一个主机统一控制用例在不同环境、不同浏览器下运行；灵活添加变动测试机。

#### Selenium IDE

Selenium IDE（Integrated Development Environment，集成开发环境）是用来开发Selenium测试用例的工具。他是一个易于使用的火狐插件，通常是开发测试用例最有效的方法。它还包含一个上下文菜单，允许你首先从浏览器当前显示的页面中选择一个UI元素，然后从Selenium的命令列表中选择命令，依据网页中选择的UI元素的上下文使用预定义的参数。这不仅节省时间，而且是学习Selenium 脚本语法的一个好方法。

# 环境准备

## 安装配置 firefox

### 安装 firefox
百度搜索并下载安装包。
我已经提前下载好了，现在直接演示一下安装过程。
安装后期，常用插件的勾选。

安装成功之后，启动firefox。发现主页很乱，需要设置一下firefox。

### 配置 firefox
1. 主页设置
空白页，打开浏览器的速度快。
about:blank
about:newtab
这两个大家根据自己的喜好来设置。

2. 需要新建窗口时以新标签页替代
勾选。

3. 自动更新设置
不选择 自动安装更新
选择    检查更新，但是我选择是否安装

4. 删除无用的搜索栏
只保留 百度、bing

5. 数据反馈
都不勾选。


## 安装配置 firebug 插件 
用来查看页面元素和分析网页代码，以后用到的时候再做讲解。

演示安装过程，配置（略）。

## 安装配置 vimperator 插件
以后用到一些快捷键的时候，给大家临时介绍，帮助大家提高工作效率。

演示安装过程，配置（略）。

装好之后演示一个 gh 快捷键，回到主页。

## 安装配置 Selenium IDE 插件
Selenium IDE 是今后主要讲解的工具，用来做自动化测试脚本的录制和回放。

### 安装Selenium IDE 插件
在firefox浏览器中安装插件，搜索Selenium IDE。

**补充**
把搜索到的插件分一下类，基本上都是对Selenium IDE的扩展。有很大一类是对Selenium IDE 导出编程语言代码的支持，本身支持的编程语言代码有C#、Python、Java、Ruby，扩展的有PHP、Perl，等

这些插件本课程并不涉及，课程里只涉及到Selenium IDE本身。

### 启动Selenium IDE
在工具菜单或者Web开发者子菜单下。
firefox默认不显示菜单，按住键盘的Alt键，会显示菜单。
启动 Selenium IDE 看一下。播放一下录制好的脚本。

配合browser.link.open_newwindows.restriction 参数设置。录制的脚本不开新窗口了，开的是新标签页，设置项：browser.link.open_newwindow.restriction=0(默认为2，作用让脚本开的新窗与 browser.link.open_newwindow=3相同，即用新标签页开新窗口 )，不是脚本录制的问题。
