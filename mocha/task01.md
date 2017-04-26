# 上篇闯关任务

## 任务一：了解 Mocha

要求：
- 浏览[Mocha 官方网站](http://mochajs.org)
- 浏览[Mocha GitHub 仓库](https://github.com/mochajs/mocha)
- 浏览[课程资料页面](README.md)

## 任务二：搭建开发环境

要求：
- 下载 vmware workstation Pro 12
- 安装 vmware workstation Pro 12
- 下载 [mocha.ova][mocha_ova] 开发环境
- 导入 [mocha.ova][mocha_ova] 开发环境
- 配置 mocha 虚拟机的网卡 IP 地址
- 下载 xshell 5
- 安装 xshell 5，并连接 mocha 虚拟机
- 配置 mocha 虚拟机的 git 参数，包括：user.name 和 user.email

## 任务三：创建被测项目

要求：
- 创建 mocha-demo 项目文件夹
- 初始化 Git 仓库
- npm init 初始化 nodejs 项目
- 编写 calc.js 模块，实现加法函数、减法函数、乘法函数和除法函数
- 编写 index.js 模块，对 calc.js 模块进行调用
- 运行被测项目
- 安装 mocha
- 安装 chai
- 提交代码到 Git 仓库

参考：
- 初始化代码：[calc.js][calc_js_origin]
- 完成后代码：[calc.js][calc_js_final]

## 任务四：编写测试脚本

要求：
- 编写 calc.js 模块的自动化测试脚本 calc.test.js
- 编写加法函数的测试套件及测试用例
- 编写减法函数的测试套件及测试用例
- 编写乘法函数的测试套件及测试用例
- 编写除法函数的测试套件及测试用例
- 执行自动化测试
- 查看自动化测试报告，包括：测试用例总数，通过的测试用例数，失败的测试用例数，总的测试耗时
- 根据需要修改 calc.js 中的 bug，或者修改 calc.test.js 中的代码
- 把自动化测试脚本提交 Git 仓库

参考：
- 自动化测试脚本代码：[calc.test.js][calc_test_js]

## 任务五：mocha 的基本用法

要求：
- 参考初始 date.js 代码，实现 date.js 模块的各个函数
- 编写 date.js 各个函数的测试套件及测试用例
- 把代码提交 Git 仓库

参考：
- 初始化代码：[date.js][date_js_origin]
- 完成后代码：[date.js][date_js_final]

## 任务六：命令行参数

要求：
- 生成 mochawesome 网页格式的报告
- 提交 Git 仓库

<!-- 本文档中的链接 -->
[mocha_ova]: http://pan.baidu.com/s/1o8a3E3o 
[calc_js_origin]: https://github.com/wangding/mocha-demo/blob/6340e47606d092d4e338956a486d6ad123e3286b/calc.js
[calc_js_final]: https://github.com/wangding/mocha-demo/blob/dc22176b6e615034fe3f770328ca7425690b4ffb/calc.js
[calc_test_js]: https://github.com/wangding/mocha-demo/blob/dc22176b6e615034fe3f770328ca7425690b4ffb/test/calc.test.js
[date_js_origin]: https://github.com/wangding/mocha-demo/blob/cae1d4f0354c034577a93ab08eaaa9da690c8f61/date.js

