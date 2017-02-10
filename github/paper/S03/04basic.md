# Git 基本操作

各位小伙伴大家好，咱们接着前面的课程，继续讲解 Github 开源之旅第三季：Git 进阶课程。咱们现在聊一聊 Git 基本操作这个话题。虽然说是基本操作，但是这些基本操作相比较 Github 开源之旅第一季：启程中的操作，还是有很多提升，所以，咱们这门课程叫 Git 进阶嘛。大致会涉及的 Git 命令，小伙伴们可以看一下课程大纲。这个话题打算分成五个课程视频来讲解：

- [几个新命令](04basic.md#git-新命令)
- [git add](04basic.md#git-add-命令)
- [git commit](04basic.md#git-commit)
- [信息查看](04basic.md#信息查看)
- [回撤操作](04basic.md#回撤操作)

首先，会讲几个新命令给大家热热身。git、git clean 和 git blame。然后深入讲解一下 git add，主要是把各种文件变更的场景给大家再现一下。git commit 专门讲一下，重点是 commit 的颗粒度和 commit message 怎么写。信息查看，git diff 和 git log。重点是回撤操作，第五个课程视频专门讲一下。

好，先看一下这几个 Git 新命令。

## Git 新命令

```bash
git
git help -a
git --version
git clean
git blame
git status -sb
```
- git or git help -a

  git 命令列出了五组常用的命令，这些命令大部分咱们都讲过，没有讲过的命令，咱们这个 Git 进阶课程都会讲到。git help -a 你会看到所有的 git 子命令。其实我们常用的 Git 命令很少，这就是二八原理，我们百分之八十的时间，经常使用的就是那百分之二十的命令。很多高级命令，例如：reset、rebase，等，用的却不多。但是，这些高级命令，我们不掌握一些，到用的时候我们往往会手忙脚乱。

- git blame 命令用来逐行查看文档的变更

  ```bash
  # 逐行查看 <filename> 的历史
  git blame <filename>

  # 从第 100 行开始查看 10 行
  git blame -L 100,10 <filename>
  ```

- git clean 命令用来砍掉 untracked 档案

  ```bash
  # 列出打算要清除的档案
  git clean -n

  # 真正的删除
  git clean -f

  # 连 .gitignore 中忽略的档案也清除
  git clean -x
  ```

- git status -sb

  git status 命令输出的提示信息太多了，如果对 Git 掌握的比较熟练了，就是前面课程讲的三个区域，四种状态比较清楚了。就不需要这么啰嗦的提示信息了。可以用 -sb 参数，屏蔽这些提示信息，只保留最少的有用信息。

  ```bash
  # -s short
  # -b branch
  # 减少输出的提示信息，在 status 命令熟悉的情况下
  git status -sb
  ```

## git add 命令

**对文件的各种操作**

- 添加新文件
- 删除文件
- 编辑文件（增加内容、修改内容、删除内容）
- 文件改名
- 文件移动
- 文件夹的操作（添加、删除、改名、移动）

```bash
# 添加新文件 a
touch a
git st
git ad
git ci -m "add a"

# 删除文件 a
git rm a
# 等价于直接操作 rm a
git st
git ci -m "remove a"

# 编辑文件，找一个现成的文件 vim 修改一下

# 文件改名，找一个现成的文件，例如：abc
git mv abc def
git st
git ci -m "rename abc"

# 文件移动，找一个现成的文件，例如：abc
git mv abc ./demo/abc
git st
git ci -m "move abc"

# 文件夹操作跟文件类似，基本上都反映到文件上
# 新建文件夹，没有文件检测不到变更
# 在新建文件夹下，添加一个文件，提交变更
# 修改文件夹名字，提交变更
# 其他略
```

```bash
# 添加 file1 和 file2 到暂存区
git add <file1> <file2>

# 添加所有文件到暂存区
git add .

# 一个文件多个提交
git add -p <file name>

# Git 假定所有的改变都是针对同一件事情的，因此它把这些都放在了一个块里。
# 你有如下几个选项：
# 输入 y 来暂存该块
# 输入 n 不暂存
# 输入 e 手工编辑该块
# 输入 d 退出或者转到下一个文件
# 输入 s 来分割该块
```

## git commit

```bash
# add & commit Mothed 1
git add .
git commit -m "message"

# add & commit Mothed 2
git commit -a -m "message"

# add & commit Mothed 3
git commit -am "message"
```
### commit 提交的颗粒度  

每个提交要保证适当的颗粒度、相关性和独立性。
- 以一个小功能、小改进或一个 bug fix 为单位  
- 对应的 unit test 程序在同一个 commit  
- 无相关的修改不在同一个 commit  
- 语法错误的半成品程序不能 commit  

### commit message 的书写规范  

- 参考阮一峰老师的仓库  
- 尽早规范起来，规矩今早养成，会习惯养成了，改起来就困难了  
- 尽早开始写英文提交信息，Github 是跟全世界接轨的  


Git 每次提交代码，都要写 commit message（提交说明），否则就不允许提交。

```bash
$ git commit -m "hello world"
```

上面代码的`-m`参数，就是用来指定 commit mesage 的。

如果一行不够，可以只执行`git commit`，就会跳出文本编译器，让你写多行。

```bash
$ git commit
```

基本上，你写什么都行。

![](http://www.ruanyifeng.com/blogimg/asset/2016/bg2016010601.png)

但是，一般来说，commit message 应该清晰明了，说明本次提交的目的。

![](http://www.ruanyifeng.com/blogimg/asset/2016/bg2016010602.png)

目前，社区有多种 Commit message 的[写法规范](https://github.com/ajoslin/conventional-changelog/blob/master/conventions)。我们介绍[Angular 规范](https://docs.google.com/document/d/1QrDFcIiPjSLDn3EL15IJygNPiHORgU1_OOAqWjiDU5Y/edit#heading=h.greljkmo14y0)（见上图），这是目前使用最广的写法，比较合理和系统化，并且有配套的工具。

#### 一、Commit message 的作用

格式化的 Commit message，有几个好处。

**（1）提供更多的历史信息，方便快速浏览。**

比如，下面的命令显示上次发布后的变动，每个 commit 占据一行。你只看行首，就知道某次 commit 的目的。

```bash
$ git log <last tag> HEAD --pretty=format:%s
```

![](http://www.ruanyifeng.com/blogimg/asset/2016/bg2016010604.png)

**（2）可以过滤某些commit（比如文档改动），便于快速查找信息。**

比如，下面的命令仅仅显示本次发布新增加的功能。

```bash
$ git log <last release> HEAD --grep feature
```

**（3）可以直接从 commit 生成 Change log。**

Change Log 是发布新版本时，用来说明与上一个版本差异的文档，详见后文。

![](http://www.ruanyifeng.com/blogimg/asset/2016/bg2016010603.png)

#### 二、Commit message 的格式

每次提交，Commit message 都包括三个部分：Header，Body 和 Footer。

```bash
<type>(<scope>): <subject>
// 空一行
<body>
// 空一行
<footer>
```

其中，Header 是必需的，Body 和 Footer 可以省略。

不管是哪一个部分，任何一行都不得超过72个字符（或100个字符）。这是为了避免自动换行影响美观。

##### 2.1 Header

Header部分只有一行，包括三个字段：`type`（必需）、`scope`（可选）和`subject`（必需）。

**（1）type**

`type`用于说明 commit 的类别，只允许使用下面7个标识。

> - feat：新功能（feature）
> - fix：修补bug
> - docs：文档（documentation）
> - style： 格式（不影响代码运行的变动）
> - refactor：重构（即不是新增功能，也不是修改bug的代码变动）
> - test：增加测试
> - chore：构建过程或辅助工具的变动

如果`type`为`feat`和`fix`，则该 commit 将肯定出现在 Change log 之中。其他情况（`docs`、`chore`、`style`、`refactor`、`test`）由你决定，要不要放入 Change log，建议是不要。

**（2）scope**

`scope`用于说明 commit 影响的范围，比如数据层、控制层、视图层等等，视项目不同而不同。

**（3）subject**

`subject`是 commit 目的的简短描述，不超过50个字符。

> - 以动词开头，使用第一人称现在时，比如`change`，而不是`changed`或`changes`
> - 第一个字母小写
> - 结尾不加句号（`.`）

##### 2.2 Body

Body 部分是对本次 commit 的详细描述，可以分成多行。下面是一个范例。

```
More detailed explanatory text, if necessary.  Wrap it to 
about 72 characters or so. 

Further paragraphs come after blank lines.

- Bullet points are okay, too
- Use a hanging indent
```

有两个注意点。

（1）使用第一人称现在时，比如使用`change`而不是`changed`或`changes`。

（2）应该说明代码变动的动机，以及与以前行为的对比。 

##### 2.3 Footer

Footer 部分只用于两种情况。

**（1）不兼容变动**

如果当前代码与上一个版本不兼容，则 Footer 部分以`BREAKING CHANGE`开头，后面是对变动的描述、以及变动理由和迁移方法。

```bash
BREAKING CHANGE: isolate scope bindings definition has changed.
    
    To migrate the code follow the example below:
    
    Before:
    
    scope: {
      myAttr: 'attribute',
    }
    
    After:
    
    scope: {
      myAttr: '@',
    }
    
    The removed `inject` wasn't generaly useful for directives so there should be no code using it.
```

**（2）关闭 Issue**

如果当前 commit 针对某个issue，那么可以在 Footer 部分关闭这个 issue 。

```bash
Closes #234
```

也可以一次关闭多个 issue 。

```bash
Closes #123, #245, #992
```

## 信息查看

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

## 回撤操作

回撤操作是必须要掌握的重要操作。我们使用版本系统就是把工作的过程，每个版本逐一保存到仓库中，保存的目的就是，我们可以在任何时间，以任何方式，到达仓库提交历史的任何一个点。这样，版本库的威力才能显示出来，版本库的价值才能发挥出来。

- git reset  

![回撤原理](https://raw.githubusercontent.com/xirong/my-git/master/_image/2016-07-14%2020-31-39.png)

```bash
# 回撤暂存区，将变更放到工作目录
git reset HEAD

# 回撤提交，将变更放到暂存区
git reset HEAD^ --soft

# 回撤提交，并丢弃变更
git reset HEAD^ --hard

# 回撤远程仓库，-f --force
git push -f
```

**注意：**  
git checkout 是切换分支，不是回撤。
git revert 回撤会产生一个新的提交，不建议使用。

- git commit --amend -m 

用来回撤上一个提交。

- git rebase 变基操作

