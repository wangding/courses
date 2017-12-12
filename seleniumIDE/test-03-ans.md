# Selenium IDE WEB 自动化测试测验题和答案

1. 在 Selenium IDE 中添加时间等待（暂停）的命令是什么？   
```
pause
```
2. 三种弹窗及其函数分别是什么？   
```
Alert 警告
Cofirmations 确认
Prompts 提示
```
3. 和弹窗相关的五条常用命令分别是什么？   
```
assert Foo （pattern）
如果模式不匹配弹窗的文本，抛出错误。
assert Foo Present
如果没有弹窗，抛出错误。
assert Foo Not Present
如果存在任何弹窗，抛出错误。
assert Foo （variable）
把弹窗中的文本储存在一个变量中。
assert Foo Present （variable）
把弹窗中的文本存储在一个变量中并返回真假。
```
4. 在自动化测试脚本中，confirmations 
确认弹窗选择取消应该用什么命令？   
```
choose CanSel On Next Confirmation
```
5. 在自动化测试脚本中，给提示弹窗输入内容用什么命令？   
```
answer On Next Prompt
```
6. 文本模式匹配的是命令的什么参数？   
```
Pattern
```
7. 在自动化测试脚本中，文本模式有哪三种？   
```
Globbing
Regular Expression 正则表达式
exact 准确
```
8. 在正则表达式中，‘[]’ 匹配什么内容？   
```
字符类，出现在方程括号中的任意单个字符。
```
9. 在正则表达式中，‘{}’ 匹配什么内容？   
```
数量，{1，n} 1 至 n 前面的字符（或者组）。
```
10. 在正则表达式中，‘+’ 匹配什么内容？   
```
数量，1 个或多个前面的字符（或者组）。
```
11. 常用的带 script 参数的命令有哪些 ？   
```
storeEval、waitFroEval、storedVars。
```
12. 运行 JavaScript 代码的命令是什么？   
```
runscript
```
13. JavaScript 参数隐式的使用语法是怎样的？   
```
JavaScript{  }
```
14. 在使用隐式 JavaScript 参数是应该注意什么？   
```
替代的参数是符合的。
```
15. 流程控制的三种情况分别是什么？   
```
顺序、分支、循环。
```
16. 自动化测试脚本中，实现流程控制的三种方法是什么？   
```
Wed Driver 开发
Store Eval 前端
流程控制扩展
```
17. 在分支流程中经常用到的命令有哪些？   
```
go to if、label、go to label。
```
18. 在循环六成中经常用到的命令有哪些？   
```
while、endwhile。
```
19. 数据驱动测试中，三种数据文件类型时什么？   
```
JS、CSV、XML。
```
20. DDT 是什么？   
```
Data Driven Testing 数据驱动测试。
```
21. 若用 JS 类型数据文件做数据驱动测试，有哪些常用命令？   
```
store
while
storeEval
store Eval
endWhile
```
22. 若用 CSV 类型数据文件做数据驱动测试，有哪些常用命令？   
```
read csv
while
store cell value
store location
go to if
storeEval
end while
```
23. 若用 XML 类型数据文件做数据驱动测试，有哪些常用命令？   
```
load Test Date
while
next Test Data
end while
```
