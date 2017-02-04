# protocols

经过这一段时间的使用，可能很多小伙伴都在抱怨，有人说：https 协议的远程仓库的推送速度太慢了，有人说，https 协议每次推送的时候都需要输入 Github 网站的用户名和密码，都要呕吐了。那这次课程就来解决大家的问题。

## 四种协议

- git deamon
- file
- https
- ssh

## git deamon 略

git deamon 不具有安全性，不做讲解。

## 演示用 file 协议的克隆

说明不建议在路径前面加上 file 协议，这样他走的是网络传输的协议栈，效率低。当然，直接复制也可以，但是，复制和克隆的区别是什么？克隆会建立远程的关系，可以 push 和 pull。

## https 和 ssh 的优劣

- https 可以穿越防火墙，一般只有在不支持 ssh 的前提下才考虑使用 https  
- ssh 有更好的压缩率和安全性，传输速度比较快  

## 重点讲解 ssh 的实现

```bash
# 生成密钥
ssh-Keygen -t rsa -C "your email"

# 查看用户主目录的 .ssh/ 文件夹中创建的私钥文件（注意备份）
ls ~/.ssh
# 目录中两个文件：id_rsa （私钥）  和   id_rsa.pub (公钥)

# 打印公钥文件内容
cat ~/.ssh/id_rsa.pub
# 把文件内容复制到剪贴板中

# 在 github.com 的 Settings 中找 SSH and GPG keys, new SSH key

# 利用 SSH 协议来克隆仓库
git clone git@github.com:wangding/test

# 利用 SSH 协议来添加远程链接
git remote add origin git@github.com:wangding/test
```

## key 的备份

如果重新安装电脑的操作系统，导致 rsa key 的丢失，怎么办？两个办法：

方法一：把 .ssh 文件夹下面的两个文件：公钥和私钥做好备份，比如放到百度网盘上。重新安装操作系统之后，把这两个文件，还原到 .ssh 文件夹下面。

方法二：重新安装操作系统后，直接重新生成 rsa key，把上面的流程重新走一遍。把 Github 上的旧 key 删除。
