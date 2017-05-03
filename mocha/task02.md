# 下篇闯关任务

## 任务一：测试用例管理

要求：
- 改写 calc.test.js 脚本，skip 所有测试套件中 0 ? 0 = 0 的测试案例
- 改写 calc.test.js 脚本，only 加法、乘法和除法测试套件
- 执行 calc.test.js 测试脚本，观察执行效果
- 把代码提交 Git 仓库

参考：
初始的代码：[calc.test.js][calc_test_js_origin_task01]
完成后代码：[calc.test.js][calc_test_js_final_task01]

## 任务二：测试用例钩子

要求：
- 改写 calc.test.js 脚本，在加法测试套件中增加 befor，after，beforeEach，afterEach 四个钩子函数
- 钩子函数中实现 console.log 打印功能
- 执行 calc.test.js 自动化测试脚本，观察钩子函数的执行效果
- 把代码提交 Git 仓库 

参考：
初始的代码：[calc.test.js][calc_test_js_final_task01]
完成后代码：[calc.test.js][calc_test_js_final_task02]

## 任务三：异步测试

要求：
- 编写简单的异步测试脚本，设置超时时间为 3000ms
- 执行测试脚本，并观察超时报错
- 在执行测试脚本时增加 --timeout 参数，观察是否报错
- 在执行测试脚本时增加 --slow 参数，观察执行结果的高亮显示的区别
- 用 superagent 编写简单的异步测试脚本，测试 GitHub 网站的 API
- 用 node-fetch 编写 Promise 方式的异步测试脚本，测试 GitHub 网站的 API

参考：  
完成后代码：  
- [timeout.test.js][timeout_test_js]  
- [async.test.js][async_test_js]  
- [promise.test.js][promise_test_js]  

## 任务四：测试前端代码 

要求：
- 在 mocha-demo 目录下，创建 browser 子目录
- 执行 mocha init 创建前端测试的脚手架代码
- 在 browser 目录下添加被测模块 add.js
- 编写 add.js 的测试脚本
- 修改 index.html 页面
- 用浏览器打开 index.html 页面，执行前端代码的测试
- 把代码提交 Git 仓库

参考：
完成后的代码：
- [add.js][add_js]
- [index.html][index_html]
- [tests.js][tests_js]

## 任务五：ES6 测试脚本

要求：
- 用 ES6 来改写 calc.test.js 和 date.test.js 两个测试脚本
- 安装 babel
- 创建 babel 配置文件
- 用 --compilers 参数执行自动化测试脚本
- 改写 mocha.opts 文件，使得 npm test 脚本能生效
- 提交代码到 Git 仓库

参考：
完成后的代码：
- [.babelrc][babelrc]
- [calc.test.js][calc_test_js_es6]
- [date.test.js][date_test_js_es6]

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
- 编写 hosted-redmine-login.test.js 测试代码
- 将测试代码与 mocha 整合
- 把代码提交 Git 仓库

参考：
完成后的代码：
- [hosted-redmine-login.test.js][hosted-redmine-login-test-js]

## 任务八：持续集成工具整合

要求：
- 用 GitHub 账户登录 travis-ci 网站
- 对 mocha-demo 项目启用持续集成
- 在 mocha-demo 项目目录下增加 .travis.yml 文件
- 调整 package.json 的测试脚本，让 npm test 只测试 calc.test.js 文件
- 提交 .travis.yml 文件到 GitHub 网站，并观察持续集成的过程报告
- 修改 clac.js 代码，引入 bug，将修改后的代码提交 GitHub 仓库
- 观察继续集成的过程报告

参考：
完成后的代码：
- [.travis.yml][travis_yml]

<!-- 本文档中的链接 -->
[calc_test_js_origin_task01]: https://github.com/wangding/mocha-demo/blob/dc22176b6e615034fe3f770328ca7425690b4ffb/test/calc.test.js
[calc_test_js_final_task01]: https://github.com/wangding/mocha-demo/blob/c7d637a8c461888517f8dd1c473ddc8a654f29ba/test/calc.test.js
[calc_test_js_final_task02]: https://github.com/wangding/mocha-demo/blob/397a120ebb29158ed9aa107df901d56773ae9c03/test/calc.test.js
[timeout_test_js]: https://github.com/wangding/mocha-demo/blob/5979d6a661f4c0065b3f2c65f5c709e0ca66d5ec/test/timeout.test.js
[async_test_js]: https://github.com/wangding/mocha-demo/blob/5979d6a661f4c0065b3f2c65f5c709e0ca66d5ec/test/async.test.js
[promise_test_js]: https://github.com/wangding/mocha-demo/blob/5979d6a661f4c0065b3f2c65f5c709e0ca66d5ec/test/promise.test.js
[add_js]: https://github.com/wangding/mocha-demo/blob/304bbdd08ecda3f01731a9d83a97de268d1be863/browser/add.js
[index_html]: https://github.com/wangding/mocha-demo/blob/304bbdd08ecda3f01731a9d83a97de268d1be863/browser/index.html
[tests_js]: https://github.com/wangding/mocha-demo/blob/304bbdd08ecda3f01731a9d83a97de268d1be863/browser/tests.js
[babelrc]: https://github.com/wangding/mocha-demo/blob/bbb1c62e533b8c518714dc8ff9701ac6c25d5d0e/.babelrc
[calc_test_js_es6]: https://github.com/wangding/mocha-demo/blob/bbb1c62e533b8c518714dc8ff9701ac6c25d5d0e/test/calc.test.js
[date_test_js_es6]: https://github.com/wangding/mocha-demo/blob/bbb1c62e533b8c518714dc8ff9701ac6c25d5d0e/test/date.test.js
[hosted-redmine-login-test-js]: https://github.com/wangding/mocha-demo/blob/0c46b79fe422301b706dca86dc821d9f3903134c/test/hostedredmine-login.test.js
[travis_yml]: https://github.com/wangding/mocha-demo/blob/c912a65a02cf018aebe874d9bae7e63bd2d0e537/.travis.yml
