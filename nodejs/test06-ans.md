# node.js 第六次测验题和答案

## 一、文件系统：同步/异步操作

1. 对文件系统的操作用的是 node.js 中的哪个模块？
```
fs
```
2. fs 缩写于什么？
```
file system
```
3. fs 模块的操作对象有哪四种？  
```
文件、目录、链接、属性
```
4. cat 命令缩写于什么？
```
concatenate
```
5. fs 模块的方法分为哪两种操作方式？
```
异步和同步
异步方法的最后一个参数一般都是一个回调函数
回调函数的第一个参数会保留给异常
同步方法在函数名的后面加了 Sync 
使用同步方法时，任何异常会被立即抛出
```
6. 默认的文件描述符有哪三种？
```
0——stdin  1——stdout  2——stderr
```
7. 复制文件的 Linux 命令是什么？如何使用？
```
cp oldfileName newfileName
```
8. 编程实现文件复制功能的关键步骤是什么？
```
用原文件路径信息创建可读流
用目标文件路径信息创建可写流
把可读流 pipe 管道连接到可写流
```
9. 创建一个新文件的 Linux 命令是什么？
```
touch fileName
```
10. touch 命令除了创建新文件还有什么用途？
```
还可以修改文件的时间属性
```
11. 在 vim 编辑器中，如何打开另一个文件？
```
:e fileName
```
12. 用 Linux 命令如何修改文件名？
```
mv oldName newName
```
13. 用 Linux 命令如何移动文件位置？
```
mv oldSrc newSrc
```
14. 编程实现 mv 命令的功能时，可以用 fs 模块的哪个方法？  
```
renameSync() 和 rename()
```
15. 移除文件的 Linux 命令是什么？  
```
rm
```
16. 编程实现 rm 命令的功能时，可以用 fs 模块的哪个方法？
```
unlinkSync() 和 unlink()
```
17. 创建文件夹的 Linux 命令是什么？
```
mkdir
```
18. 编程实现 mkdir 命令的功能时，可以用 fs 模块中的哪个方法？  
```
mkdirSync() 和 mkdir()
```
19. 如何在 Linux 命令行删除一个文件夹？
```
rm -rf dir
```
20. 编程实现删除文件夹功能时，可以用 fs 模块的哪个方法？
```
rmdirSync() 和 rmdir()
```
21. 创建链接的 Linux 命令是什么？
```
ln [-s] srcfileName lnkfileName
```
22. 编程实现链接功能时，实现硬链接和符号链接分别用到了哪个方法？
```
硬链接：linkSync() 和 link()
符号链接：symlinkSync() 和 symlink()
```
23. 修改文件所有者信息的 Linux 命令是什么？
```
chown 缩写于 change owner
```
24. 编程实现 chown 命令的功能时，可以用哪个方法？
```
chownSync() 和 chown()
```
25. 修改文件权限的 Linux 命令是什么？
```
chmod 缩写于 change mode
```
26. 编程实现 chmod 命令的功能时，可以用哪个方法？
```
chmodSync() 和 chmod()
```
27. 查看文件详细信息的 Linux 命令是什么？
```
stat fileName （来源于 status ）
```
28. 编程实现 stat 命令的功能时，可以用哪个方法？
```
statSync() 和 stat()
```
29. 实现监视一个目录或一个文件的程序，可以用哪个方法？
```
watch()
```
30. 用管道的方式查看某进程的 ID 号的 Linux 命令是怎样的？
```
ps aux | grep matchString
```
31. fs 模块的同步方法适用什么样的场合？
```
文件比较小，文件数量比较少的场合
```
