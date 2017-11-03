# 上篇闯关任务

## 任务0 环境准备

要求如下：
- 下载并安装火狐浏览器，注意一下火狐浏览器的版本问题；
  - 不要安装最新版本的火狐浏览器  
  - 最新版本的火狐浏览器可能和 Selenium IDE 插件不兼容  
  - 火狐浏览器的版本最好不要超过 50  
  - 火狐浏览器各个版本的下载地址：http://ftp.mozilla.org/pub/firefox/releases/  
- 安装 Selenium IDE 插件；  
- 安装 Firebug 插件；  
- 安装 Vimperator 插件；  

## 任务1 制作 Hello World 自动化测试脚本

要求如下：
- 用 echo 命令打印 Hello World 字符串；
- 用 store 命令定义变量 msg，其值为 Hello World，echo 打印 msg 变量；

查看脚本：
- [helloWorld1.html](http://seide.wangding.in/hello/helloWorld1.html)
- [helloWorld2.html](http://seide.wangding.in/hello/helloWorld2.html)

## 任务2 制作百度自动化测试脚本

要求如下：
- 用 open 命令打开百度网站；
- 搜索关键字“王顶”；
- 验证搜索结果页面的标题是否为“王顶\_百度搜索”；
- 验证搜索结果页面是否有文字“百度为您找到相关结果”
- 注意：需要用\*通配符来模糊匹配文字；

查看脚本：
- [search.html](http://seide.wangding.in/baidu/search.html)

## 任务3 制作 hostedredmine 自动化脚本

要求如下：
- 制作登录脚本；
- 制作退出登录脚本；
- 制作 issue 功能的 CRUD 操作的脚本；
- 将上述脚本放到测试套件中；

查看脚本：
- [redmine.html](http://seide.wangding.in/hostedredmine/redmine.html)

## 任务4 制作某网站的自动化测试脚本

要求如下：
- 被测网站可根据个人喜好自由选择；
- 被测网站需要在互联网上能访问到；
- 被测的功能点需要相对完整而独立；
- 自动化测试脚本需要有必要的注释；

