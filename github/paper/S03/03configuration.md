# configuration

Git 配置

## 换行

- 问题
  大家是不是每次修改完文件之后，在

- Git 文件换行问题  
  http://www.cnblogs.com/flying_bat/archive/2013/09/16/3324769.html  

## 凭证

- 问题：每次 push 都需要输入凭证，效率低下
- 解决办法：两个，一，存储凭证；二，换协议
- 如何存储凭证

```bash
git config --global credential.helper wincred
```
## 别名

- 问题：效率低下
- 前提：基本命令已经玩熟了
- 解决办法：别名
- 如何实现


## .gitignore

- 如何屏蔽一些文件，不被提交  
- 哪些文件需要被屏蔽  

