脚本是一个命令一个命令顺序执行的。

Selenese 本身不支持条件语句（if - else, 等）或循环迭代（for, while, 等）。没有流程控制也可以制作很多有用的测试案例。然而，对于动态内容的功能测试，可能涉及到多个页面，编程逻辑通常是必要的。

如果必须使用流程控制，有以下三种解决方案：

1. 使用 Selenium RC 运行脚本结合客户端库，如：Java 或 PHP 库，利用编程语言的流程控制功能。
2. 用 storeEval 命令从脚本中运行一个小的 JavaScript 代码片段。
3. 安装 [goto_sel_ide.js](http://www.seleniumhq.org/docs/02_selenium_ide.jsp#goto-sel-ide-js-extension) 扩展。

很多测试人员将测试脚本导出成一个编程语言的代码文件，结合 Selenium RC API 一起使用（参见Selenium IDE 章）。然而，有些组织更倾向于尽可能地用 Selenium IDE 运行测试脚本（例如，当他们有初级测试工程师，或当编程技能缺乏）。如果是这种情况，请考虑 JavaScript 代码片段或 goto_sel_ide.js 扩展。

【案例：百度】
检查百度首页登录状态，如果登录，则退出登录。
对百度首页非登录状态页面获取并验证信息。
