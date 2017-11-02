# node.js 第九次测验题和答案

## 一、web 应用：更轻更快

1. 响应报文的结构是怎样的？
```
状态行
响应头部字段列表
空行
响应主体
```
2. 状态行中包含哪三个信息？
```
HTTP 版本，响应的状态码，响应的状态信息
```
3. 响应头部字段列表以什么形式呈现？
```
键值对
```
4. 状态码有几种？分别表示什么信息？
```
1xx——Informational 基本信息
2xx——Successful 成功信息
3xx——Redirection 重定向
4xx——Client Error 客户端错误
5xx——Server Error 服务器错误
```
5. 请求报文的结构是怎样的？
```
请求行
请求头部字段列表
空行
请求主体
```
6. 请求行中有哪三个信息？
```
请求方法
请求的资源
HTTP 协议版本
```
7. HTTP 协议原生支持的两个基本认证是什么？
```
基本认证
摘要认证
```
8. 从本质上来说 Apache 服务的作用是什么？
```
相当于一个静态网站文件服务程序
```
9. REST 缩写于什么？是什么意思？
```
缩写于 Representational State Transfer
表现层状态转换
```
10. 表现层是什么意思？
```
资源具体呈现出来的形式
```
11. URL 是什么的缩写？
```
Uniform Resource Locator
(只代表资源的实体，不代表它的表现形式)
```
12. HTTP 协议中四个表示操作方式的方法分别是什么？
```
GET —— 获取资源
POST —— 创建新资源
PUT —— 更新资源
DELETE —— 删除资源
```
13. 在 Linux 命令行用 GET 方法获取数据的命令是怎样的？
```
curl URL
```
14. 在 Linux 命令行用 POST 方法上传数据的命令是怎样的？
```
curl -d 'data' URL
```
15. 在 Linux 命令行用 DELETE 方法删除数据的命令是怎样的？
```
curl -X DELETE URL
```
16. 在 Linux 命令行用 PUT 方法替换数据的命令是怎样的？
```
curl -X PUT -d 'data' URL
```
17. 在前端代码中调用 HTPP API 的方法有什么？
```
1. XMLHTTPRequest 对象发起 http 请求
2. fetch 函数
```
18. 怎样用 fetch 函数通过 PUT 方法替换数据？
```
fetch('URL',{method:'PUT',item:value})
```
19. 怎样用 fetch 函数通过 POST 方法上传数据？
```
fetch('URL',{method:'POST',item:value})
```
20. 怎样用 fetch 函数通过 DELETE 方法删除数据？
```
fetch('URL',{method:'DELETE'})
```
21. SSL 是什么的缩写？是什么意思？
```
Secure Sockets Layer 
安全套接层
```
22. 在 Linux 命令行产生一个密钥的命令是怎样的？
```
openssl genrsa 1024 > key.pem
```
23. 在 Linux 命令行生成证书的命令是怎样的？
```
openssl req -x509 -new -key key.pem > key-cert.pem
```
