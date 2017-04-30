# 下篇闯关任务

## 任务一：ES6 测试脚本

要求：
- 用 ES6 来改写上篇闯关任务中的 calc.test.js 和 date.test.js 两个测试脚本
- 安装 babel
- 创建 babel 配置文件
- 用 --compilers 参数执行自动化测试脚本

## 任务二：测试用例钩子

要求：
- 改写 calc.test.js 脚本，在脚本中增加 befor，after，beforeEach，afterEach 四个钩子函数
- 钩子函数中实现 console.log 打印功能
- 执行 calc.test.js 自动化测试脚本，观察钩子函数的执行效果

## 任务三：异步测试

要求：
- 编写简单的异步测试脚本，设置超时时间为 3000ms
- 执行测试脚本，并观察超时报错
- 在执行测试脚本时增加 --timeout 参数，观察是否报错
- 在执行测试脚本时增加 --slow 参数，观察执行结果的高亮显示的区别
- 编写简单的异步测试脚本，测试 GitHub 网站的 API
- 编写 Comprise 方式的异步测试脚本，测试 GitHub 网站的 API

## 任务四：测试用例管理

要求：
- 改写 calc.test.js 脚本，skip 0 + 0 = 0 测试案例
- 改写 calc.test.js 脚本，only 0 + 1 = 1 测试案例
- 把代码提交 Git 仓库

## 任务五：测试前端代码 

要求：
- 在 mocha-demo 目录下，创建 browser 子目录
- 在 browser 子目录下，执行 mocha init 创建前端测试的脚手架代码
- 添加被测模块 add.js
- 编写 add.js 的测试脚本
- 修改 index.html 页面
- 用浏览器打开 index.html 页面执行前端代码的测试
- 把代码提交 Git 仓库

## 任务六：代码覆盖率

要求：
- 安装 istanbul 工具
- 创建 simple.js 代码
- 执行覆盖率测试
- 调整覆盖率边界，检查测试覆盖率报告
- 与 mocha 结合，对 calc.test.js 执行覆盖率测试

## 任务七：webdriver 整合

要求：
- 安装 selenium-webdriver
- 在 mocha-demo 目录下，创建子目录 webdriver
- 在 webdriver 目录下，编写 hosted-redmine-login.js 测试代码
- 将测试代码与 mocha 整合
- 把代码提交 Git 仓库

## 任务八：持续集成工具整合

要求：
- 用 GitHub 账户登录 travis-ci 网站
- 对 mocha-demo 项目启用持续集成
- 在 mocha-demo 项目目录下增加 .travis.yml 文件
- 调整 package.json 的测试脚本，让 npm test 只测试 calc.test.js 文件
- 提交 .travis.yml 文件到 GitHub 网站，并观察持续集成的过程报告
- 修改 clac.js 代码，引入 bug，将修改后的代码提交 GitHub 仓库
- 观察继续集成的过程报告

<!-- 本文档中的链接 -->
