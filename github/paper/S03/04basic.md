# basic

## 基本的修改

- 添加新文件
- 编辑文件
- 文件重命名
- 文件删除
- 文件移动

把这些操作的效果演示一下，git add .

## 

Git 基本操作 
    git
    git add .
    git add -p
    git commit -am
    git commit
        最佳实践
            commit message
    git clean
    git blame
    git log file
    git diff
    回撤 stage
    回撤 commit



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