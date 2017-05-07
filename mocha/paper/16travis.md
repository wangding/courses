# Mocha 与 travis-ci 整合

各位小伙伴大家好，时间过得飞快，一转眼咱们《基于 Mocha 的自动化测试框架》下篇课程就要和小伙伴们说再见了，现在咱们讲解下篇课程中的最后一个话题 Mocha 与 travis-ci 整合。

学习过上篇课程的小伙伴一定还有印象，我们在上篇课程的最后，详细讲解了 mocha 执行测试的方式，我们当时是这样一步一步讲解的：

```bash
node_modules/mocha/bin/mocha test/calc.test.js
node_modules/mocha/bin/mocha
node_modules/.bin/mocha
npm test
```

首先是 mocha 命令和路径，后面跟着测试脚本。这是我们最早介绍的执行测试用例的方式。当然，这也是最麻烦和最啰嗦的方式。  
然后，我们把 mocha 命令后面的测试脚本去掉，只留下 mocha 命令和路径，因为 mocha 会自动执行 test 目录下的所有测试脚本。  
然后再缩减，我们把 mocha 命令的路径改成 node_module/.bin/ 隐藏目录，因为这个隐藏目录下的 mocha 是指向 node_modules/mocha/bin/mocha 的软连接。这样整个命令又进一步缩短了。  
最后，我们给出了执行自动化测试的正确姿势，就是用 npm test 命令来执行自动化测试。因为 npm 的 test 脚本里，我们写的是 mocha 命令，这时，npm 会自动找 node_modules/.bin/ 下面的 mocha 程序来执行。这就回到了上面我们说的执行方式了，.bin 目录下的 mocha 是一个软链接，指向 mocha 程序的实际路径 node_modules/mocha/bin/mocha，然后 mocha 再去执行 test 目录下的所有自动化测试脚本。

当时我们说 npm test 是执行自动化测试的正确姿势。其实，这还不算是自动化测试执行的终极形态，为什么这么说呢？因为，这个命令还是需要我们手工在命令行下面输入命令，来执行自动化测试。是不是需要输入 npm test 命令啊？真正的自动化测试，连这个 npm test 命令都不需要我们手工输入。也就是说，终极形态的自动化测试，什么时候来执行自动化测试，根本不需要人工干预。只要我们把自动化测试脚本写好之后，被测模块的代码一旦发生变化，就会立刻执行自动化测试。这才是自动化测试的终极形态，当然这就需要我们引入持续集成工具了。开源社区里面用的比较多的持续集成工具是 Travis-CI。Travis-ci 和 GitHub 版本控制系统紧密集成在一起。企业内部闭源开发环境用 Jenkins 比较多，但是原理上大同小异。本小节我们给小伙伴们讲解 Mocha 与 Travis-CI 整合应用。我们还是以之前做的 calc.js 被测项目为例来讲解。

那废话不多说了，咱们直接进入正题。

## 准备 GitHub 仓库

我们首先需要在 GitHub 上创建一个项目仓库，项目仓库的名字叫 mocha-travis-demo，里面的内容都是空。然后在本地创建项目文件夹 mocha-travis-demo，git init 初始化 git 仓库。 把我们之前做的代码复制到 mocha-travis-demo 目录下面，包括 calc.js, test/calc.test.js, package.json, index.js, .gitignore 这几个文件就行。我们可以在本地目录手动执行以下 npm test，看看测试是否能正常执行。然后，把本地目录和远程仓库建立连接，并将代码推送到远程仓库上。到这里我们的 GitHub 仓库就算准备好了，也就是我们的仓库里，有被测模块 calc.js 也有自动化测试脚本 calc.test.js 还有 package.json 项目配置文件。

## 登录 travis-ci

接下来，需要登录 travis-ci 网站，我们用 GitHub 集成身份验证就。登录成功之后，我们需要启动 mocha-travis-demo 仓库的 travis-ci 持续集成。

## 编写 .travis.yml

设置好之后，我们需要在项目仓库中增加一个 Travis-CI 持续集成的配置文件：.travis.yml。如果没有这个文件，就不会触发 Travis CI 的自动构建。简单的 nodejs 项目，.travis.yml 文件非常简单，不用写很多脚本。反过来，如果项目规模比较大，比较复杂，我们的 .travis.yml 文件中可能根据需要会写比较多的脚本代码。我们把 .travis.yml 文件准备如下：

```
language: node_js
node_js:
  - "node"
```

我们稍微解释一下，配置文件中的两行代表什么。第一行是我们项目的编程语言是什么，第二行是我们所使用的 nodejs 版本环境是什么。这里没有指定具体版本号，那么会使用 nodejs 最新的稳定版。

Travis CI 默认依次执行以下九个脚本。

- before_install
- install
- before_script
- script
- after_success 或者 after_failure
- after_script
- before_deploy（可选）
- deploy（可选）
- after_deploy（可选）

用户需要用到哪个脚本，就需要提供该脚本的内容。至于脚本里的内容是什么？一般就是用来完成相应的安装、部署和配置任务的 linux shell 命令。

对于 Node 项目，以下两个脚本有默认值，可以不用自己设定。

"install": "npm install",
"script": "npm test"

我们把 .travis.yml 文件创建好之后，我们就可以提交 commit 了，然后推送到远程仓库中。在 travis-ci 网站我们就可以看到持续集成的效果。小伙伴们注意哦，这里的自动化测试是自动发生的，注意到了吗？这就是我要说的自动化测试执行的终极形态。

## 修改被测模块

现在，我们把被测模块的代码故意改错，引入 bug。来观察一下持续集成的效果。把 add 函数的加法运算改成乘法运算。再提交远程仓库。当我们一旦提交代码之后，持续集成就自动发生了，自动化测试也自动发生了。你会看到持续集成没有通过，而且还会给我的邮箱发送邮件。是不是很厉害啊。这就是我们说的自动化测试的终极形态。好，关于持续集成的更多内容，我们后续将会开专门的课程来讲解，在这个 mocha 自动化测试课程中，我们就不在深入讲解了。好，这样我们本小节的内容就讲到这里。我们一块儿看一下通关任务。略。

到这里，我们基于 Mocha 的自动化测试框架课程就全部结束了。最后，希望学习到这里的小伙伴们给课程五分评价，评价的方式请见幻灯片的截图说明。技术成就梦想，小伙伴们加油啊！
