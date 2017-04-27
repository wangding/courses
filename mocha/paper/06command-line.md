# 命令行参数

各位小伙伴大家好，时间过得飞快，一转眼咱们《基于 Mocha 的自动化测试框架》上篇课程就要和小伙伴们说再见了，现在咱们来讲解上篇课程的最后一个话题 mocha 的命令行参数。

咱们上次课讲了 mocha 命令行的基本用法，另外，增加了一个 date.js 模块，以及该模块的自动化测试脚本。我们已经可以将 mocha 命令行执行测试时的命令简短到只要 mocha 命令就可以了，后面的测试脚本的文件名都可以省略了。但是，小伙伴们可能觉得还是不爽，因为 mocha 命令前面的一大长串路径太让人恶心了，还有没有更简便的方式呢？其实是有的，接下面我们给小伙伴们讲讲 mocha 命令行使用的正确姿势。首先，给小伙伴们看看 node_modules 目录的结构。

```bash
la node_modules
la node_modules/mocha
la node_modules/mocha/bin

# node_modules/mocha/bin/mocha 是 mocha 应用程序的完整路径，当然是相对路径，所以我们之前执行测试用例的时候都是这样做的。不过，请注意 node_modules 目录下面有一个隐藏目录 .bin，小伙伴们看一下这个目录里的内容

la node_modules/.bin

# 大家是不是看到了 mocha 可执行程序了，其实他是一个软连接，链接到了 mocha 应用程序的实际路径，所以我们可以这样做了，用 node_modules/.bin/mocha  来代替 node_modules/mocha/bin/mocha 是不是更方便了一些呢？

node_modules/.bin/mocha

# 别着急，更方便的还在后面。其实 package.json 里面有一个 npm script，这个 npm 脚本可以会自动查找当前项目目录下的 node_modules/.bin 目录下的所有可执行程序。这样，我们修改一下 package.json 文件中的 test 测试脚本。改成 mocha，那么我们怎么执行这个 test 脚本呢？只要 npm test，我们试一下

npm test

# 这就是我们执行 mocha 自动化测试脚本的正确姿势，是不是很强大很方便啊？我们结合幻灯片上的图示，再把这个过程给小伙伴们顺一遍啊，我们执行 npm test 的时候，npm 会执行 package.json 文件中的 test 脚本，test 脚本里写着 mocha 命令，npm 就会到默认的项目目录下的 node_modules/.bin 目录下找 mocha 程序，找到的是 mocha 的软连接，这个软件链接指向到 node_modules/mocha/bin/mocha 这个可执行程序，这个可执行程序会默认执行项目目录下的 test 目录下的所有自动化测试脚本。小伙伴们明白这里面的机制了吧。这就是执行 mocha 测试的正确姿势，非常简便高效。
```

上次课程我们还讲了 mocha 命令的 recursive 参数，如果我们执行 mocha 命令的时候使用了 recursive 参数，那么 mocha 会把 test 目录以及其子目录下的所有 JavaScript 脚本视为自动化测试脚本。其实，除了前面介绍的 recursive 参数，Mocha 还支持很多其他命令行参数。下面咱们正式进入本次课程的内容，把 mocha 的命令行参数捡最常用和最重要的给小伙伴们讲一讲。

【幻灯片】

--help, -h
--help 或 -h 参数，用来查看 Mocha 的所有命令行参数。

```bash
mocha --help
# 你会看到 mocha 的参数非常多，这么多参数里面，我们只讲其中五个，算上上次课的 recursive 参数，总共讲六个参数。
```

参数一：--reporter, -R
--reporter 参数用来指定测试报告的格式，默认是 spec 格式。

```bash
mocha
# 等同于 mocha --reporter spec
```

除了 spec 格式，官方网站还提供了其他许多报告格式。

```bash
mocha --reporter tap
```

上面是 tap 格式报告的显示结果。

--reporters 参数可以显示所有内置的报告格式。

```bash
mocha --reporters
```
使用 mochawesome 模块，可以生成漂亮的 HTML 格式的报告。

```bash
npm install --save-dev mochawesome
../node_modules/.bin/mocha --reporter mochawesome

# 因为我们的开发环境是 linux 命令行，不可能有图形化界面的浏览器来浏览生成的 HTML 网页。
# 测试报告结果存放到 mochawesome-report 目录下，我们把整个文件夹打成压缩包。
# 下载到 windows 宿主环境上来查看。

tar -cf report.tar mochawesome-report
sz report.tar

# 选择存放 repot.tar 的本机路径，然后用 winrar 解压 tar 压缩包，查看相应的网页报告
``` 

参数二：--watch，-w
--watch 参数用来监视指定的测试脚本。只要测试脚本有变化，就会自动运行 Mocha。

```bash
mocha --watch
```

上面命令执行以后，并不会退出。你可以另外打开一个终端窗口，修改 test 目录下面的测试脚本 add.test.js，比如删除一个测试用例，一旦保存，Mocha 就会再次自动运行。

参数三：--bail, -b
--bail 参数指定只要有一个测试用例没有通过，就停止执行后面的测试用例。这对持续集成很有用。

```bash
mocha --bail
```

参数四：--grep, -g
--grep 参数用于搜索测试套件或测试用例的名称，然后只执行匹配的测试用例。

```bash
# 执行名称中包含“加法”的测试套件或测试用例
node_modules/.bin/mocha --grep 加法

# 执行名称中包含加号的测试套件或测试用例
node_modules/.bin/mocha --grep '\+'

# 执行名称中包含一的测试套件或者测试用例
node_modules/.bin/mocha --grep 1
```

参数五：--invert, -i
--invert 参数表示只运行不符合条件的测试脚本，必须与 --grep 参数配合使用。

```bash
mocha --grep 加法 --invert
```

了解了 mocha 的参数，小伙伴们可能就会想。哦，好不容易刚把 mocha 执行脚本的命令给简化了，现在又要增加命令行参数，又要把 mocha 执行脚本的命令复杂化了。要不说 mocha 很强大嘛，mocha 提供了配置文件 mocha.opts 的支持。Mocha 允许我们在 test 目录下面，放置配置文件 mocha.opts，把命令行参数写在里面。这样我们执行 mocha 的时候，不用跟任何参数，mocha 会自动从 test 目录中找 mocha.opts 参数文件，并把相应的参数添加上，再去执行。举个例子：

```bash
mocha --recursive --reporter tap --bail
```

上面这个命令有三个参数 --recursive、--reporter tap、--bail。现在，我们把这三个参数写入 test 目录下的 mocha.opts 文件中。然后，我们再执行 mocha 就能取得与第一行命令一样的效果。如果测试用例不是存放在 test 子目录，可以在 mocha.opts 写入以下内容。

server-tests
--recursive

上面代码指定运行 server-tests 目录及其子目录之中的测试脚本。

好，以上这些就是本小节的全部内容了。我们来一块看一下通关任务。略。

最后，我们对整个上篇课程稍微总结一下，通过上篇课程的学习，小伙伴们应该掌握了基于 mocha 框架的自动化测试脚本的编写，而且也能根据各种需求来高效的执行测试脚本。有了这些基础，我们下篇就可以讲解一些高级话题了，比如：Mocha 在异步环境下的测试，Mocha 和持续集成的整合，Mocha 和 ES6 的整合、Mocha 和代码覆盖工具的整合、Mocha 的钩子机制，甚至还有我们小伙伴们最感兴趣的 Mocha 和 selenium webdriver 对 web UI 做功能测试的内容。

好吧，就知道大家最想学 webdriver 的内容了，大家早就等不及了。下面，给小伙伴们演示一个 Mocha 和 selenium webdriver 对网站 UI 做自动化测试的例子。作为对下篇课程的预告吧。

hosted-redmine 网站登录模块的自动化测试。

最后，希望学习到这里的小伙伴们给课程五分评价，评价的方式请见幻灯片的截图说明。基于 Mocha 的自动化测试框架上篇课程收集到五十个五分评价后，我就会立刻发布下篇课程，我一定会信守承诺的。好的，我们下篇课程再见。
