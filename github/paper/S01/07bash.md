# Git Bash 命令

【教学目标】
- 配置 Git
- 初始化本地仓库
- 在本地仓库中，修改文件，提交版本，查看信息
- 创建 Github 远程仓库，将本地仓库与远程仓库关联
- 将本地仓库的文件推到远程仓库中
- 克隆远程仓库

【 教学方法】
- 完整的案例操作演示
- 结合着命令的讲解

## 配置命令
Git 的设置文件为 .gitconfig，它可以在用户主目录下（全局配置），也可以在项目目录下（项目配置）。

```bash
# 设置提交代码时的用户信息
git config --global user.name
git config --global user.email

# 显示当前的 Git 配置
# 记忆：-l，相当于 --list，列出 Git 的所有配置
git config -l
```

## 新建代码库

```bash
# 在当前目录新建一个Git代码库
git init

# 下载一个项目和它的整个代码历史
# url 格式: https://github.com/[userName]/reposName
git clone [url]
```

## 增加/删除文件

```bash
# 添加指定文件到暂存区
git add [file1] [file2] ...

# 添加指定目录到暂存区，包括子目录
git add [dir]

# 添加当前目录的所有文件到暂存区
git add .

# 删除工作区文件，并且将这次删除放入暂存区
git rm [file1] [file2] ...

# 停止追踪指定文件，但该文件会保留在工作区
git rm --cached [file]

# 改名文件，并且将这个改名放入暂存区
git mv [file-original] [file-renamed]
```

## 代码提交

```bash
# 提交暂存区到仓库区
git commit -m [message]

# 提交暂存区的指定文件到仓库区
git commit [file1] [file2] ... -m [message]

# 提交工作区自上次commit之后的变化，直接到仓库区
git commit -a
```

## 查看信息

```bash
# 显示有变更的文件
git status

# 显示当前分支的版本历史
git log
git log --oneline

# 【补充】：用 Git GUI 方式查看历史
# 【补充】：用 Github 查看历史
```

## 远程同步

```bash
# 显示所有远程仓库
$ git remote -v

# 显示某个远程仓库的信息
$ git remote show [remote]

# 增加一个新的远程仓库，并命名
$ git remote add [shortname] [url]

# 取回远程仓库的变化，并与本地分支合并
$ git pull [remote] [branch]

# 上传本地指定分支到远程仓库
$ git push [remote] [branch]
```
