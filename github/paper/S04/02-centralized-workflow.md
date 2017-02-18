# 集中式工作流

各位小伙伴大家好，咱们接着前面的课程，继续讲解 Github 开源之旅第四季：Git 团队协作。现在咱们讲解四种团队协作方式中的第一种，也是最简单的一种，我们把这种团队协作方式称为，集中工作流，即：centralized workflow。

如果大家熟悉`svn`，集中式工作流让你无需去适应一个全新流程就可以体验`Git`带来的利益。这个工作流是最简单的工作流，很容易上手，可以作为学习其他工作流的过渡或者基础。当然，学会这种工作流之后，不建议大家长期在这种工作流上工作，因为，他太初级了，发挥不出来 Git 以及 Github 的强大优势。

<img src="https://www.atlassian.com/dam/jcr:c27e646e-0b66-49bd-9f85-ee9205e295d6/01.svg" alt="Git Workflows: SVN-style Workflow" class="">

下面咱们开门见山，直接进入正题，来讨论集中式工作流的工作方式，冲突解决以及实际操作。

## 1 工作方式

像`svn`一样，集中式工作流，以中央仓库，作为项目所有修改的中心。`SVN`缺省的开发分支叫`trunk`，`Git`叫做`master`，所有修改提交到`master`分支上。

开发人员开始先克隆中央仓库。在自己的本地项目仓库中编辑文件并提交修改；但修改是存在本地的，和中央仓库是完全隔离的。开发者可以自由决定何时把本地仓库的变更同步到中央仓库。当然，一般来说，同步的频率跟本地变更的频率保持一致，如果本地变更比较频繁，同步操作就应该比较频繁，否则，版本冲突的可能性会加大，而且冲突解决的成本会提高。如果，本地变更的频率较低，则，同步的频率也相对较低。这个大家理解吗？可以举例，具体说明一下。同步操作就是本地仓库向远程仓库 push 推送操作，这个不用多说了，大家应该都掌握了。

<img src="https://www.atlassian.com/dam/jcr:24d40389-e44e-4c28-b01b-be389d52506d/02.svg" alt="Central and local repositories" class="">

## 2 冲突解决

中央仓库代表了正式项目，所以提交历史应该被尊重且是稳定不变的。如果开发者本地的提交历史和中央仓库有分歧，`Git`会拒绝`push`提交否则会覆盖已经在中央库的正式提交。

<img src="https://www.atlassian.com/dam/jcr:466a59b3-9175-47f7-85d5-48c926ed9555/03.svg" alt="Managing Conflicts" class="">

在开发者提交自己功能修改到中央库前，需要先`fetch`在中央库的新增提交，`rebase`自己提交到中央库提交历史之上。
这样做的意思是在说，『我要把自己的修改加到别人已经完成的修改上。』最终的结果是一个完美的线性历史，就像以前的`SVN`的工作流中一样。

如果本地修改和上游提交有冲突，`Git`会暂停`rebase`过程，给你手动解决冲突的机会。`Git`解决合并冲突，用和生成提交一样的[`git status`](https://www.atlassian.com/git/tutorial/git-basics#!status)和[`git add`](https://www.atlassian.com/git/tutorial/git-basics#!add)命令，很一致方便。还有一点，如果解决冲突时遇到麻烦，`Git`可以很简单中止整个`rebase`操作，重来一次（或者让别人来帮助解决）。

## 3 示例

下面我将一步一步带着大家，演示集中式工作流在团队协作中如何开展。假设有两个开发者王顶和王顶2，看他们两个人是如何利用集中式工作流开展工作的。王顶是本地 win 10 操作系统的用户，Github 账户是 wangding，王顶2是我前面上课建的小号，在 win 7 虚拟机里给大家操作演示，他的 Github 账户是 wangding2。

### 3.1 王顶2初始化中央仓库

<img src="https://www.atlassian.com/dam/jcr:4495bbe0-c932-4f82-afa2-3cdf275fe1f8/04.svg" alt="Git Workflows: Initialize Central Bare Repository" class="">

第一步，王顶2在 Github 服务器上创建好中央仓库。我之前创建过 hello-git 仓库，我就直接使用这个仓库来演示。

第二步，王顶2把王顶作为项目的协作者加入到仓库中。

第三步，王顶接受邀请。

### 3.2 所有人克隆中央仓库

<img src="https://www.atlassian.com/dam/jcr:59fe7131-1ffa-4a58-bcbe-eaecb1bf3ebb/05.svg" alt="Git Workflows: Clone Central Repo" class="">

下一步，每个开发者都克隆中央仓库。通过[`git clone`](https://www.atlassian.com/git/tutorial/git-basics#!clone)命令完成：

```bash
git clone ssh://user@host/path/to/repo.git
```

### 王顶开发功能

<img src="https://www.atlassian.com/dam/jcr:df3bad19-f053-4a79-8825-d0916c140d10/06.svg" alt="Git Workflows: Edit Stage Commit Feature Process " class="">

在王顶的本地仓库中，他使用标准的`Git`过程开发功能：编辑、暂存（`Stage`）和提交。
如果你不熟悉暂存区（`Staging Area`），这里说明一下：**暂存区**用来准备一个提交，但可以不用把工作目录中所有的修改内容都包含进来。
这样你可以创建一个高度聚焦的提交，尽管你本地修改很多内容。

```bash
git status # 查看本地仓库的修改状态
git add # 暂存文件
git commit # 提交文件
```

请记住，因为这些命令生成的是本地提交，王顶可以按自己需求反复操作多次，而不用担心中央仓库上有了什么操作。
对需要多个更简单更原子分块的大功能，这个做法是很有用的。

### 王顶2开发功能

<img src="https://www.atlassian.com/dam/jcr:a0aa8d1b-11a4-4aa4-a3a9-4f83f9be9a67/07.svg" alt="Git Workflows: Edit Stage Commit Feature" class="">

与此同时，王顶2在自己的本地仓库中用相同的编辑、暂存和提交过程开发功能。和王顶一样，她也不关心中央仓库有没有新提交；
当然更不关心王顶在他的本地仓库中的操作，因为所有本地仓库都是私有的。

### 王顶发布功能

<img src="https://www.atlassian.com/dam/jcr:6e5dc66d-b041-4013-b321-b1908fecfdbd/08.svg" alt="Git Workflows: Publish Feature" class="">

一旦王顶完成了他的功能开发，会发布他的本地提交到中央仓库中，这样其它团队成员可以看到他的修改。他可以用下面的[`git push`命令](https://www.atlassian.com/git/tutorial/remote-repositories#!push)：

```bash
git push origin master
```

注意，`origin`是在王顶克隆仓库时`Git`创建的远程中央仓库别名。`master`参数告诉`Git`推送的分支。
由于中央仓库自从王顶克隆以来还没有被更新过，所以`push`操作不会有冲突，成功完成。

### 王顶2试着发布功能

<img src="https://www.atlassian.com/dam/jcr:52e2347e-b8e0-49ab-9530-5d1e9129198e/09.svg" alt="Git Workflows: Push Command Error" class="">

一起来看看在王顶发布修改后，王顶2`push`修改会怎么样？她使用完全一样的`push`命令：

```bash
git push origin master
```

但她的本地历史已经和中央仓库有分岐了，`Git`拒绝操作并给出下面很长的出错消息：

```
error: failed to push some refs to '/path/to/repo.git'
hint: Updates were rejected because the tip of your current branch is behind
hint: its remote counterpart. Merge the remote changes (e.g. 'git pull')
hint: before pushing again.
hint: See the 'Note about fast-forwards' in 'git push --help' for details.
```

这避免了王顶2覆写正式的提交。她要先`pull`王顶的更新到她的本地仓库合并上她的本地修改后，再重试。

### 王顶2在王顶的提交之上`rebase`

<img src="https://www.atlassian.com/dam/jcr:25edd772-a30a-475a-a6ca-d1055ae61737/10.svg" alt="Git Workflows: Git Pull Rebase" class="">

王顶2用[`git pull`](https://www.atlassian.com/git/tutorial/remote-repositories#!pull)合并上游的修改到自己的仓库中。
这条命令类似`svn update`——拉取所有上游提交命令到王顶2的本地仓库，并尝试和她的本地修改合并：

```bash
git pull --rebase origin master
```

`--rebase`选项告诉`Git`把王顶2的提交移到同步了中央仓库修改后的`master`分支的顶部，如下图所示：

<img src="https://www.atlassian.com/dam/jcr:5165668f-b62d-4417-95e6-fde8ed97ec60/11.svg" alt="Rebasing to Master" class="">

如果你忘加了这个选项，`pull`操作仍然可以完成，但每次`pull`操作要同步中央仓库中别人修改时，提交历史会以一个多余的『合并提交』结尾。
对于集中式工作流，最好是使用`rebase`而不是生成一个合并提交。

### 王顶2解决合并冲突

<img src="https://www.atlassian.com/dam/jcr:eaad29a3-6d94-4916-8a2c-3dea71aea4c2/12.svg" alt="Git Workflows: Rebasing on Commits" class="">

`rebase`操作过程是把本地提交一次一个地迁移到更新了的中央仓库`master`分支之上。
这意味着可能要解决在迁移某个提交时出现的合并冲突，而不是解决包含了所有提交的大型合并时所出现的冲突。
这样的方式让你尽可能保持每个提交的聚焦和项目历史的整洁。反过来，简化了哪里引入`Bug`的分析，如果有必要，回滚修改也可以做到对项目影响最小。

如果王顶2和王顶的功能是不相关的，不大可能在`rebase`过程中有冲突。如果有，`Git`在合并有冲突的提交处暂停`rebase`过程，输出下面的信息并带上相关的指令：

```
CONFLICT (content): Merge conflict in <some-file>
```

<img src="https://www.atlassian.com/dam/jcr:adf8c8e3-4287-4ec1-acf7-2a052d61d03f/13.svg" alt="Conflict Resolution" class="">

`Git`很赞的一点是，任何人可以解决他自己的冲突。在这个例子中，王顶2可以简单的运行[`git status`](https://www.atlassian.com/git/tutorial/git-basics#!status)命令来查看哪里有问题。
冲突文件列在`Unmerged paths`（未合并路径）一节中：

```
# Unmerged paths:
# (use "git reset HEAD <some-file>..." to unstage)
# (use "git add/rm <some-file>..." as appropriate to mark resolution)
#
# both modified: <some-file>
```

接着王顶2编辑这些文件。修改完成后，用老套路暂存这些文件，并让[`git rebase`](https://www.atlassian.com/git/tutorial/rewriting-git-history#!rebase)完成剩下的事：

```bash
git add <some-file> 
git rebase --continue
```

要做的就这些了。`Git`会继续一个一个地合并后面的提交，如其它的提交有冲突就重复这个过程。

如果你碰到了冲突，但发现搞不定，不要惊慌。只要执行下面这条命令，就可以回到你执行[`git pull --rebase`](https://www.atlassian.com/git/tutorial/remote-repositories#!pull)命令前的样子：

```bash
git rebase --abort
```

### 王顶2成功发布功能

<img src="https://www.atlassian.com/dam/jcr:de2dabdd-542f-4f64-9be4-870abff06f60/14.svg" alt="Git Workflows: Synchronize Central Repo" class="">

王顶2完成和中央仓库的同步后，就能成功发布她的修改了：

```bash
git push origin master
```

如你所见，仅使用几个`Git`命令我们就可以模拟出传统`svn`开发环境。对于要从`SVN`迁移过来的团队来说这太好了，但没有发挥出`Git`分布式本质的优势。

如果你的团队适应了集中式工作流，但想要更流畅的协作效果，绝对值得探索一下 `功能分支工作流` 的收益。
通过为一个功能分配一个专门的分支，能够做到一个新增功能集成到正式项目之前对新功能进行深入讨论。

