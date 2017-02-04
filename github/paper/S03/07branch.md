# branch

## 


分支（重点）
    创建分支
    切换分支
    删除分支
    本地分支
    远程分支
    合并分支
    stash 操作
    变基合并


## 常见问题

- git 存储凭证  
  http://www.cnblogs.com/volnet/p/git-credentials.html
  $ git config --global credential.helper wincred
  这一行命令搞定，参考网址：https://help.github.com/articles/caching-your-github-password-in-git/

- git 撤销远程仓库的提交  
  http://www.cnblogs.com/chucklu/p/4661149.html

- Git 文件换行问题  
  http://www.cnblogs.com/flying_bat/archive/2013/09/16/3324769.html  

- 如何在 Github 的 pull request 中进行 code review
  参考：
  https://github.com/wangding/Sample/pull/1
  https://github.com/wangding/seIDE/pull/6
  https://github.com/wangding/seIDE/pull/11

- issue 过滤

  ![issue filter.png](http://upload-images.jianshu.io/upload_images/3058932-fbc953aaadb6cdf0.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

## Git 命令行配置

- 自动记忆凭证  
- 设置快捷键  
- 设置换行检查  

## Git 常用命令

- git 教学演示  

    ```bash
    # 目的命令简单，快捷，可以制造变更
    # 快速制造多个提交，看到版本路线
    # 先看一下命令的效果，然后就不用看了

    touch a
    touch b
    touch c
    
    echo 11 >> a
    echo 22 >> a
    
    git add .

    git commit -m "11"
    
    echo 33 >> a
    git commit -am "33"
    ```

- git rebase 操作  

    ```bash
    # -i 是交互操作
    git rebase -i <SHA>
    
    # 把当前分支在 master 的位置接上
    git rebase master
    ```

- git 基本操作1  

    ```bash
    # add & commit Mothed 1
    git add .
    git commit -m "message"

    #Git 假定所有的改变都是针对同一件事情的，因此它把这些都放在了一个块里。你有如下几个选项：
    #输入 y 来暂存该块
    #输入 n 不暂存
    #输入 e 手工编辑该块
    #输入 d 退出或者转到下一个文件
    #输入 s 来分割该块
    git add -p <file name>

    # add & commit Mothed 2
    git commit -a -m "message"

    # add & commit Mothed 3
    git commit -am "message"
    ```

- git 基本操作2  

    ```bash
    # diff working directory with repos 
    git diff

    # diff staging area with repos
    git diff --cached
    
    # 拿 working directory 和 SHA 比较
    git diff <SHA>

    # ?
    git diff <SHA 1> <SHA 2>
    
    # ?
    git diff --stat <SHA>
    ```

- git ssh 链接

    ```bash
    # diff working directory with repos 
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

- git branch 操作

    ```bash
    # 删除分支 foo 分支，前提 foo 已经合并过
    git branch foo -d

    # 强制删除分支 foo
    git branch foo -D

    # 创建分支 foo
    git branch foo

    # 切换到分支 foo
    git checkout foo

    # 创建分支并同时切换到 foo，一步做到
    git checkout -b foo

    # 修改分支名字
    git branch -m old_name new_name
    git branch -M old_name new_name

    # 列出远程分支
    git branch -r

    # 查看已经合并的分支
    git checkout --merged

    # 查看没有合并的分支
    git checkout --no-merged

    # 列出远程合并的分支
    git branch -r --merged

    # 取出远程的 foo 分支
    git checkout -t origin/foo

    # 删除远程分支 1
    # <space> 是空格，<remote branch> 是远程分支的名字
    # 把空内容推到远程的分支上，就是删除的意思
    git push origin <space> :<remote branch>

    # 删除远程分支 2
    # 在 github 上可以直接删除分支
    # 在本地 git pull 不能把远程分支的变化反应到本地
    # git pull 和 git fetch 不会清除已经删除的远程分支
    # git branch -r 还可以看到已经删除的远程分支
    # sourceTree 的线图还可以看到已经删除的远程分支
    # 可以执行下面的命令解决问题
    git fetch -p

    # 合并分支
    git merge <branch name>

    # 合并分支，拒绝 fast forward，产生合并 commit
    git merge --no-ff
    ```

- git blame 逐行查看文档

    ```bash
    # 逐行查看 <filename> 的历史
    git blame <filename>

    # 从第 100 行开始查看 10 行
    git blame -L 100,10 <filename>
    ```

- git clean 砍掉 untracked 档案

    ```bash
    # 列出打算要清除的档案
    git clean -n

    # 真正的删除
    git clean -f

    # 连 .gitignore 中忽略的档案也清除
    git clean -x
    ```

- git tag 操作

    ```bash
    # 给当前的 HEAD 指针处贴标签 foo
    git tag foo

    # 给任意的一个提交贴标签 foo
    git tag foo <SHAI>

    # 给当前的 HEAD 指针处贴标签 foo
    git tag foo -m "message"

    # 删除标签 foo
    git tag -d foo

    # 将所有标签推送到远程仓库中
    git push --tags

    # 将具体某个标签推送到远程仓库中
    git push origin v0.1
```

- git stash 操作  

    ```bash
    # 保存进度
    git stash

    # 弹出进度
    git stash pop

    # 查看 stash 列表
    git stash list

    # 删除所有进度
    git stash clear
    ```

- git 其他操作  

    ```bash
    # 查看某个文件的提交记录
    git log <file name>

    # 把 upstream 代表的远程仓库的 master 分支拽到本地
    git pull upstream master

    # 撤销上一个 commit，前提是没有 push 到远程仓库
    git add <something>
    git commit --amend -m "some comment"

    # 弹出 vim 输入多行 message
    git commit

    # 查看 log 日志，并过滤需要的信息
    git log --grep <filter word>
    ```