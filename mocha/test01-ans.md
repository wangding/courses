# 基于 Mocha 的自动化测试框架（上）测验题和答案

1. 自动化测试主要有哪三个应用场景？
```
自动化单元测试
自动化接口测试
自动化 UI 测试
```
2. 在 vim 编辑器中，如何展开代码折叠？
```
z+R
```
3. 搭建 mocha 测试环境要安装哪两个软件？
```
mocha
chai
```
4. 测试脚本中有两个可以被 mocha 识别的元素是什么？
```
describe 测试套件
it 测试用例
```
5. 如何运行测试脚本？
```
node_modules/mocha/bin/mocha test/测试脚本
```
6. chai 断言库中的断言有哪三种方式？
```
should，expect，assert
```
7. 如何简化执行测试脚本的命令？
```
1. mocha 默认执行 test 目录下的脚本，所以可把脚本的目录省略，即：
node_modules/mocha/bin/mocha
2. 通过符号链接调用 mocha，即：
node_modules/.bin/macha
3. 修改 package.json 文件中的信息："test":"mocha",然后执行命令：
npm test
```
8. 执行 test 目录下的所有测试脚本文件，用哪个命令参数？
```
--recursive
```
9. 如何查看 mocha 支持的命令行参数？
```
node_modules/.bin/mocha -h
```
10. 课程中学习了哪些 mocha 的命令行参数？
```
1. --reporter：报告格式设置
2. --watch：检视测试脚本
3. --bail：失败停止执行
4. --grep：搜索测试用例
5. --invert：执行非匹配用例
```
11. mocha 默认的报表格式是什么？
```
spec
```
12. 如何查看 mocha 支持的所有报表格式？
```
node_modules/.bin/mocha --reporters
```
13. 可以生成网页格式的报表格式是什么？
```
mochawesome
```
14. --grep 参数匹配哪些信息？
```
测试套件的名字和测试用例的名字
```
15. mocha.opts 配置文件怎样使用？
```
1. 放在 test 目录下
2. 配置文件中写 mocha 的命令行参数
3. 直接执行 mocha 命令即可，会自动加上 mocha.opts 配置文件中的命令行参数
```
