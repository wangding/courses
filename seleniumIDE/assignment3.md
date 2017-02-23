# 下篇闯关任务

## 任务1 制作手机归属地查询的自动化脚本

要求如下：
- 网站地址：http://www.atool.org/phonenumber.php
- 测试案例数据请参考[测试案例设计思维导图](http://processon.com/view/581805e0e4b09047a82bd47c)

## 任务2 制作弹窗自动化测试脚本

要求如下：
- 被测对象：http://sample.wangding.in/selenium/alert.html
- 手工测试页面的弹窗效果；
- 制作警告弹窗的自动化测试脚本；
- 制作确认弹窗的自动化测试脚本；
- 制作提示弹窗的自动化测试脚本；

## 任务3 制作时间校准网自动化任务脚本

要求如下：
- 网站地址： http://time.tianqi.com/
- 制作脚本用 Globbing 模式验证时间；
- 制作脚本用正则表达式验证时间；

## 任务4 制作两数求和自动化脚本

要求如下：
- 利用 store 命令定义两个变量并初始化值；
- 利用 echo 命令和隐式 JavaScript 代码打印两个变量求和；
- 利用 storeEval 计算两个数求和，用 echo 打印求和结果变量；
- 利用 runScript 在 alert 弹窗中打印求和结果；

## 任务5 制作定位器参数化的自动化测试脚本

要求如下：
- 被测网站：http://www.hostedredmine.com
- 对登录功能做三种情况的自动化测试脚本；
  - 用户名正确，密码错误；
  - 用户名错误，密码正确；
  - 用户名正确，密码正确；
- 在前面的基础上，把脚本中的定位器参数放到 js 文件中；
- 在 Options 选项对话框中设置 js 文件的用户扩展；
- 利用隐式 JavaScript 参数加载定位器参数

## 任务6 制作自定义扩展自动化测试脚本

要求如下：
- 被测网站：http://time.tianqi.com/
- 编写用当前时间日期做文件名的函数，放到 js 文件中；
- 将 js 文件作为 Selenium IDE 的用户扩展加载到 Options 对话框中；
- 利用自定义的函数对时间校准网的页面进行截图操作；

## 任务7 制作百度首页自动化测试脚本

要求如下：
- 被测网站： http://www.baidu.com
- 打开百度首页；
- 判断百度账户是否登录；
- 如果登录，则退出登录；
- 在未登录的状态下，获取百度首页信息；

## 任务8 制作四个网站的 csv DDT 自动化测试脚本

要求如下：
- 被测网站：
  - 百度网站，搜索功能
  - ATOOL网站，手机归属地查询
  - HostedRedmine 网站，登录验证
  - 51CTO 学院，学习时长统计
- 数据文件：
  - https://github.com/wangding/seIDE/blob/master/DDT/CSV/baiduSearchData.csv
  - https://github.com/wangding/seIDE/blob/master/DDT/CSV/mobileData.csv
  - https://github.com/wangding/seIDE/blob/master/DDT/CSV/loginHRedmineData.csv
  - https://github.com/wangding/seIDE/blob/master/DDT/CSV/51ctoLensData.csv
  
## 任务9 制作四个网站的 js DDT 自动化测试脚本

要求如下：
- 被测网站：
  - 百度网站，搜索功能
  - ATOOL网站，手机归属地查询
  - HostedRedmine 网站，登录验证
  - 51CTO 学院，学习时长统计
- 数据文件：
  - https://github.com/wangding/seIDE/blob/master/DDT/JS/baiduSearchData.js
  - https://github.com/wangding/seIDE/blob/master/DDT/JS/mobileData.js
  - https://github.com/wangding/seIDE/blob/master/DDT/JS/redmineLoginData.js
  - https://github.com/wangding/seIDE/blob/master/DDT/JS/51ctoLensData.js
  
## 任务10 制作四个网站的 xml DDT 自动化测试脚本

要求如下：
- 被测网站：
  - 百度网站，搜索功能
  - ATOOL网站，手机归属地查询
  - HostedRedmine 网站，登录验证
  - 51CTO 学院，学习时长统计
- 数据文件：
  - https://github.com/wangding/seIDE/blob/master/DDT/XML/baiduSearchData.xml
  - https://github.com/wangding/seIDE/blob/master/DDT/XML/mobileData.xml
  - https://github.com/wangding/seIDE/blob/master/DDT/XML/loginHRedmineData.xml
  - https://github.com/wangding/seIDE/blob/master/DDT/XML/studyLensData.xml
