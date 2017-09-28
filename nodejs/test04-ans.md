# node.js 第四次测验题和答案

## 一、事件：玩转 EventEmitter

1. node.js 提供的四种异步编程的机制分别是什么？  [相关链接](http://www.ruanyifeng.com/blog/2012/12/asynchronous%EF%BC%BFjavascript.html)
```
回调函数
事件
订阅者模式
promises 对象
```
2. 用回调函数实现异步操作的两种状态是什么？
```
开始和结束
```
3. 事件的三要素是什么？  
```
事件名称
on 绑定
事件处理函数
```
4. EventEmitter 引自哪个模块？
```
events
```
5. 如何引用某模块的某个接口（可用 EventEmitter 举例）？
```
var EventEmitter = require('events').EventEmitter;
```
6. EventEmitter 对象用来触发事件的方法是什么？
```
emit(eventName[,arguments])
```
7. 使自己的类有事件机制的两种方法分别是什么？
```
1. 让自己的类继承 EventEmitter 类
2. 把 EventEmitter 类中的方法复制到自己的类中（又叫混合方式）
```
8. 类的继承有哪两种方法？
```
JavaScript 原型继承方式
使用 node.js 的 util 模块中的 inherits 方法
```
9. util 的 inherits 方法的使用格式是怎样的？
```
util.inherits(继承者，被继承者);
```
10. 查看某个类的所有事件的方法是什么？
```
className.eventName();
```
11. 查看某个类的某个事件的所有监听个数的方法是什么？
```
className.listenerCount(eventName);
```
12. 查看某个类的某个事件的所有监听的方法是什么？
```
className.listeners(eventName);
```
13. 复制 EventEmitter 中的方法，如何实现？
```
用 for...in 循环
```
14. JavaScript 提供什么方式来进行错误处理？  
```
try catch
```
15. 在 node.js 中如何进行错误处理？
```
发生错误时，node.js 会产生 error 对象，在回调函数中对 error 进行捕获和处理即可
```
16. 我们如何获得 error 对象？  
```
在事件处理函数中传入一个形参获取 error 对象
```
17. 在代码中，如何对事件的名称进行有效的管理，避免发生名称引用错误？
```
给自定义的类增加一个 events 属性，events 是一个键值对，引用事件名称时其实是引用一个属性，这样在引用属性时就可以自动补全了
```
18. 复制 EventEmitter 中的方法的语句是什么？  
```
this[methodName] = EventEmitter.prototype[methodName];
```	
