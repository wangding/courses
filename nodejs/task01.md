# 上篇闯关任务

## 任务一：课程说明

要求：  
- 浏览[Node.js 官方网站](https://nodejs.org/)  
- 浏览[Node.js 中文网站](http://nodejs.cn/)  
- 浏览[Node.js 官方 API](https://nodejs.org/dist/latest-v8.x/docs/api/)  
- 浏览[Node.js 中文 API](http://nodejs.cn/api/)  
- 浏览电子书网盘链接: http://pan.baidu.com/s/1nuU6C8h 密码: h6jc  
- 浏览[课程资料页面](README.md)  

## 任务二：开发环境搭建

要求：  
- 下载并安装 vmware workstation Pro 12（**已经安装 vmware workstation，略过此任务**）  
- 下载并导入 [mocha.ova](http://pan.baidu.com/s/1o8a3E3o) 开发环境  
  - 说明：\*.ova 是 Open Virtualization Archive 三个单词的首字母缩写，是 [Open Virtualization Format](https://en.wikipedia.org/wiki/Open_Virtualization_Format) 镜像的单文件版本  
- 下载并安装 xshell 5  
- 配置 mocha 虚拟机的网卡 IP 地址  
- 配置 mocha 虚拟机的 git 参数，包括：user.name 和 user.email  
- 浏览 [vim 参考资料](https://github.com/wangding/note/blob/master/office/vim.md)，掌握 vim 的使用      
- 浏览 [vim 配置文件](https://github.com/wangding/tools/blob/master/.vimrc)，了解开发环境中自定义的快捷键  
- 创建 nodejs-demo 目录
- 把 [.tern-project](.tern-project) 代码自动补全配置文件，放到 nodejs-demo 目录下
- 阅读[Node.js 简介](http://javascript.ruanyifeng.com/nodejs/basic.html)  
- 创建 01-introduction 目录
- 编写 01-hello-world.js  
- 编写 02-hello-world-server.js  

## 任务三：全局之文件路径变量

要求：
- 创建 02-global-var 目录  
- 编写 01-file-dir-name.js 脚本，实现以下功能：  
  - 在控制台输出 '__filename' 和 '__dirname' 两个变量  
  - 完成项目目录下，'views' 子目录中，网页模板 'view.html' 的路径拼接  

## 任务四：全局之控制台

要求：  
- 阅读 [console API 资料](http://nodejs.cn/api/console.html)  
- 创建 03-console 目录  
- 编写 01-format.js 脚本，实现以下功能：  
  - 使用占位符输出变量  
  - 使用三种占位符，分别输出三种变量类型：字符串，整数和 JSON 数据  
  - 向标准错误流中输出信息  
  - 通过命令行重定向，观察 console.log 和 console.error 两个方法，所使用流的区别  
- 编写 02-time.js 脚本，实现以下功能：
  - 对耗时任务运行的时间进行采样  

## 任务五：全局之进程

要求：  
- 阅读 [process API 资料](http://nodejs.cn/api/process.html)  
- 阅读 [process 资料](http://javascript.ruanyifeng.com/nodejs/process.html)  
- 创建 04-process 目录  
- 编写 01-information.js 脚本，实现以下功能：  
  - 向控制台打印 CPU 架构信息以及操作系统版本信息  
  - 打印进程 id 信息以及 node.js 可执行文件的绝对路径信息  
  - 在脚本中增加标准输入流的读取操作，让程序暂停执行，用 linux 命令观察当前进程的 id 信息  
  - 打印 node.js 版本信息，当前登录用户 id 信息，当前登录用户所属组 id 信息以及当前脚本所在路径信息  
  - 在命令行执行 'node -v' 命令，核对程序输出的 node.js 版本信息是否正确  
  - 在命令行执行 'id' 命令，验证程序输出的登录账户 id 信息是否正确  
  - 在命令行执行 'pwd' 命令，验证程序输出的当前工作目录信息是否正确  
  - 打印内存使用情况  
  - 打印环境变量  
  - 在命令行执行 'env' 命令，验证程序输出的环境变量信息正确 
- 编写 02-cli-arguments.js 脚本，实现以下功能： 
  - 获取命令行参数  
  - 如果没有命令参数，打印程序的使用说明  
  - 如果命令行参数是 --help，打印程序的使用说明  
  - 如果命令行参数多于 3 个，多余的参数忽略  
  - 对命令行参数的表达式进行求值，打印求值结果  
  - 命令行参数的格式如下：  
```bash
./02-cli-arguments.js
usage: cmd-name [OPTION] [expression]
evaluate the expression.

Mandatory arguments to long options are mandatory for short options too.
  -h, --help output help information and exit
```
- 编写 03-exit-code.js 脚本，实现以下功能：  
  - 通过命令行参数获取程序的退出码，以该退出码退出程序  
  - 通过 echo 命令查看程序的退出码  
  - 对命令行参数的退出码，做数据合法性校验  
- 编写 04-standard-input-output.js 脚本，实现以下功能：  
  - 逐条打印提示信息  
  - 读取用户键盘输入信息，保存到对象中  
  - 用户键盘输入结束后，打印完整的对象信息  
  - 解决课上程序中的 bug  
- 编写 05-signal.js 脚本，实现以下功能：
  - 接收信号量，并对信号进行处理  
  - 用控制台快捷键，给程序脚本发送信号量，测试程序的功能逻辑  
  - 用 kill 命令，给程序脚本发送信号量，测试程序的功能逻辑  
- 编写 05-kill.js 脚本，实现以下功能：  
  - 获取命令行参数，得到进程 ID 信息和信号量标识符  
  - 向指定进程 ID 的进程发送特定的信号量  
  - 用 05-kill.js 脚本，向 05-signal.js 脚本发送信号量，测试两个程序的功能逻辑  

## 任务六：全局之定时器  

要求：  
- 阅读 [global API 资料](http://nodejs.cn/api/globals.html)  
- 阅读 [timer 资料](https://github.com/ruanyf/jstutorial/blob/gh-pages/nodejs/timer.md)  
- 创建 05-timer 目录  
- 编写 01-delay-call.js 脚本，实现以下功能：  
  - 定义一个定时炸弹对象  
  - 定时炸弹对象和 setTimeout 函数绑定  
  - 定时炸弹爆炸  
  - 在定时炸弹爆炸之前，拆除定时炸弹  
- 编写 02-timer.js 脚本，实现以下功能：  
  - 定时执行任务
  - 用三种方式取消定时器，分别是：设置定时器运行时间，取消定时器；设置定时器，重复执行任务次数，取消定时器；设置长耗时任务，任务结束时，取消定时器；

## 任务七：全局之 Buffer 类

要求：  
- 阅读 [Buffer API 资料](http://nodejs.cn/api/buffer.html)  
- 阅读 [Buffer 资料](http://javascript.ruanyifeng.com/nodejs/buffer.html)  
- 创建 06-buffer 目录  
- 编写 01-basic.js 脚本，实现以下功能：  
  - 实例化一个 buffer 对象，缓冲区的大小是 256 字节，初始化第一个字节为零，控制台打印该 buffer 的长度和内容  
  - 通过循环初始化 buffer 中的每个字节，控制台打印该 buffer 的内容  
  - 对 buffer 做切片操作，取出后 10 个字节，控制台打印该 buffer 的内容和长度   
  - 对切片的 buffer 做填充操作，所有字节填充为零，控制台打印该 buffer 的内容
  - 用数组初始化 buffer，控制台打印该 buffer 中的内容和长度  
  - 用字符串初始化 buffer，控制台打印该 buffer 中的内容和长度  
  - buffer 复制操作，打印复制后的 buffer 内容和长度  
- 编写 02-encode.js 脚本，实现以下功能：  
  - 从命令行参数获取，登录用户名和密码信息  
  - 将用户名和密码拼接，转化成 base64 编码，打印在控制台上  
- 编写 02-decode.js 脚本，实现以下功能：  
  - 从命令行参数获取，用户名和密码信息的 base64 编码字符串  
  - 将 base64 编码转换成 utf8 编码，将还原后的用户名和密码信息打印在控制台上  
- 编写 03-data-uri.js 脚本，实现以下功能：  
  - 阅读 [data URI scheme 资料](https://en.wikipedia.org/wiki/Data_URI_scheme)  
  - 执行 'wget http://sample.wangding.in/nodejs/nodejs-logo.jpg' 下载 nodejs-logo.jpg 图片  
  - 把 nodejs-logo.jpg 图片以 data URI scheme 的方式嵌入到 html 页面中  
  - 编写一个 http 服务，响应浏览器的请求，将嵌入图片数据的页面发送给浏览器  
- 编写 04-bitmap-info.js 脚本，实现以下功能：  
  - 阅读 [BMP 文件格式资料](https://en.wikipedia.org/wiki/BMP_file_format)  
  - 执行 'wget http://sample.wangding.in/nodejs/nodejs-logo.bmp' 下载 nodejs-logo.bmp 图片  
  - 获取图片的宽度、高度和颜色深度三个信息，并打印在控制台上  
- 编写 05-bitmap-write.js 脚本，实现以下功能：  
  - 写一个 64 * 64 像素，颜色深度为 32 位的位图文件  
  - 位图的所有像素为红色  

## 任务八：全局之模块管理

要求：  
- 阅读 [module API 资料](http://nodejs.cn/api/modules.html)  
- 阅读 [module 资料](http://javascript.ruanyifeng.com/nodejs/module.html)  
- 创建 07-module 目录  
- 编写 01-third-module.js 脚本，实现以下功能：  
  - 导入 date-now 模块  
  - 调用 date-now 模块的 now 方法，在控制台打印 now 的运行结果  
  - 安装 date-now 模块，运行程序  
  - 创建 package.json 文件，用 npm install module-name -S 安装模块  
  - 查看 package.json 文件中的依赖项  
- 编写 02-export-var.js 脚本，导出变量 Math.PI，打印 module 信息  
- 编写 02-export-function.js 脚本，实现以下功能：  
  - 导出 circle 函数  
  - 函数的入口参数是圆的半径  
  - circle 函数返回一个对象  
  - 对象中有两个成员函数，分别计算：圆的面积和周长  
  - 打印 module 信息  
- 编写 02-export-object.js 脚本，实现以下功能：  
  - 导出 Circle 类  
  - 函数的构造函数，入口参数是圆的半径  
  - 类有三个公开方法，分别计算圆的直径、面积和周长  
  - 打印 module 信息  
- 编写 02-main.js 脚本，分别导入上面三个模块，测试模块的接口  
- 编写 03-export-all.js 脚本，导入上面三个模块，把暴露出一个对象  
- 编写 03-main.js 脚本，对 03-export-all.js 脚本进行测试  

## 任务九：事件：玩转 EventEmitter

要求：  
- 阅读 [EventEmitter API 资料](http://nodejs.cn/api/events.html)  
- 阅读 [EventEmitter 资料](http://javascript.ruanyifeng.com/nodejs/events.html)  
- 创建 08-event 目录  
- 编写 01-event-emitter.js 脚本，发出自定义事件，并写事件处理函数  
- 编写 02-dog.js 以及 02-play-dog.js 脚本，实现以下功能：  
  - Dog 类原型继承 EventEmitter 类  
  - 在 Dog 类中，实现 engery 能量私有数据成员的逻辑
  - 在 Dog 类中，用构造函数对私有数据 energy 进行初始化
  - 在 Dog 类中，bark 事件跟 energy 数据进行逻辑关联，bark 一次 energy 数值减一
  - 在 Dog 类中，energy 数值为零时，不发出 bark 事件
  - 02-play-dog.js 实现多个 Dog 的对象，对多个对象采用相同的 bark 事件处理机制  
- 编写 03-radio.js 以及 03-listen-radio.js，实现以下功能：  
  - radio 类 util 的 inherits 方法继承 EventEmitter 类  
  - radio 类发出 play 事件和 stop 事件  
  - 03-listen-radio.js 脚本，实例化 radio 对象，并处理 play 和 stop 事件  
- 编写 04-mixing-event-emitter.js 脚本，实现以下功能：  
  - 实现一个 musicPlayer 类，拷贝 EventEmitter 原型中的方法  
  - musicPlayer 类，发出两个事件：play 和 stop  
  - 在 musicPlayer 的实例中，编写两个事件的事件处理代码  
- 编写 05-error.js 脚本，实现以下功能：  
  - 在 04-mixing-event-emitter.js 脚本的基础上实现  
  - 在 musicPlayer 类中发出 error 事件，在 musicPlayer 的实例上进行异常捕获，或者在进程级别上进行异常捕获  
- 编写 06-event-name.js 脚本，实现事件名称管理   

## 任务十：流：最强大和最易误解的功能

要求：  
- 阅读 [流 API 资料](http://nodejs.cn/api/stream.html)  
- 阅读 [流 资料](http://javascript.ruanyifeng.com/nodejs/stream.html)  
- 创建 09-stream 目录  
- 编写 01-stdin-stdout.js 脚本  
- 编写 02-static-http-server.js 脚本  
- 编写 02-static-http-server-stream.js 脚本  
- 编写 03-readable-push.js 脚本  
- 编写 03-readable-pull.js 脚本  
- 编写 03-my-readable.js 脚本  
- 编写 04-green-stream.js 脚本  
  - 阅读 [ANSI 转义码资料](https://en.wikipedia.org/wiki/ANSI_escape_code)  

