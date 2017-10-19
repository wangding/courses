# node.js 第七次测验题和答案

## 一、网络系统：分布式应用基础

1. 创建一个 TCP 协议的服务器程序，用到了 node 的哪个模块？
```
net
```
2. 创建一个 TCP 协议的服务器程序，可以用哪个方法？
```
net.createServer()
```
3. createServer 方法的返回值是什么？
```
socket 对象
```
4. telnet 缩写于什么？
```
teletype network
```
5. telnet 是什么？作用是什么？
```
Telnet 是 Internet 远程登录服务的标准协议和主要方式。
现在主要用于 Internet 会话，它的基本功能是允许用户登录进入远程主机系统。
```
6. 如何安装 telnet？
```
sudo yum install -y telnet
```
7. 如何退出 telnet？
```
quit
```
8. 如何使用 telnet 访问服务器？
```
telnet [host-name [port]]
```
9. ftp 是什么？作用是什么？
```
FTP 是文件传输协议，缩写于 File Transfer Protocol。
用于 Internet 上文件的双向传输。
```
10. 如何安装 ftp？
```
sudo yum install -y ftp
```
11. 如何链接 ftp 服务器？
```
ftp [hostname| ip-address]
```
13. 匿名访问 ftp 服务器的用户 ID 是什么？
```
anonymous
```
14. 创建 TCP 客户端程序用哪个方法来实现？  
```
net.createConnection()
```
15. TCP 协议使用的是哪种数据流？  
```
双工流
```
16. UDP 协议适用于哪些场合？
```
实现查询类的系统，例如：DNS 解析，DHCP 动态 IP 地址分配
```
17. nc 是什么？缩写于什么？
```
缩写于 NetCat
NetCat 是一个非常简单的 Unix 工具
可以读、写 TCP 或 UDP 网络连接(network connection)
```
18. 实现一个 UDP 协议的服务器程序的原理是怎样的？  
```
通过 dgram 模块创建 socket 对象，在 socket 对象上，对 message 事件进行响应
```
19. 实现一个 UDP 协议的客户端程序，向 UDP 服务器发送文件数据可以用哪个方法？
```
socket.send()
```
