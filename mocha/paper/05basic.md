# mocha 的基本用法

各位小伙伴大家好，咱们接着前面的课程，继续讲解《基于 Mocha 的自动化测试框架》，现在咱们来讲解 mocha 的基本用法这个话题。

【在 mocha-demo 目录下 ll -A . test】  
前面两次课程我们首先实现了被测项目，分别是 mocha-demo 项目根目录的 index.js 主程序和 calc.js 模块。然后，在 test 目录下编写了自动化测试脚本 calc.test.js。有了自动化测试脚本以后，就可以用 Mocha 来执行测试了。我们在 mocha-demo 目录下，执行下面的命令。

```bash
node_modules/mocha/bin/mocha test/calc.test.js
```

上面的运行结果表示，测试脚本通过了测试，一共有 20 个测试用例，耗时 12 毫秒。这个命令看着很长，每次都这样来执行测试脚本显然很不方便。本次课程讲解 mocha 命令行的基本用法，小伙伴们学习之后，你就会发现 mocha 的设计还是很人性化的，操作起来可以非常简单，甚至可以不用人工干预来执行自动化测试脚本，我们后面会讲持续化集成，到时候小伙伴们就会明白了。刚才输入的命令其实包括两部分，前面是 mocha 的可执行程序包括这个可执行程序所在的路径，后面跟着自动化测试脚本的文件名和路径，当然，mocha 可以指定多个测试脚本，执行测试的时候，自动化测试脚本之间用空格隔开。

```bash
mocha file1 file2 file3
```
前面我们提到过，我们的自动化测试脚本一般都放到项目目录的 test 子目录下面。为什么要制定这样的规范呢？因为 mocha 默认会运行 test 子目录下的所有测试脚本。所以，一般我们都会把测试脚本放在 test 目录里面，这样我们再执行 mocha 时，就不需要再指定自动化测试脚本这个参数了。我们在 mocha-demo 目录下面，运行下面的命令。

```bash
node_modules/mocha/bin/mocha
```

是不是效果一样啊？这时你会看到，test 子目录里面的测试脚本都执行了。这样，为了能让演示更到位一些，咱们再增加一个自动化测试脚本。我们添加一个新的模块 date.js，代码如下所示：

```javascript
/**
 * 返回今天的日期，格式为：YYYY-MM-DD，例如：2017-04-26
 * @return {string} 返回当前的日期，格式为：YYYY-MM-DD
 */
function today() {
  var d = new Date(Date.now());

  return d.toISOString().slice(0, 10);
}
```
我们来给这个模块写一个自动化测试脚本，date.test.js，代码如下所示：

```javascript
var today = require('../date').today;   
var expect = require('chai').expect;

describe('today 函数的测试', function() {
  it('today is 2017-04-26', function() {
    expect(today()).to.be.equal('2017-04-26');
  });
});
```

我们如果运行两个自动化测试脚本，原来我们可以 mocha file1 file2，现在我们 mocha，是不是两个脚本都运行了啊？是不是感觉 mocha 很强大啊？被着急，后面还有更强大的功能会给大家讲解。

我们做一个小实验，如果我们在 test 目录下面再创建一个 dir 子目录，然后把 date.test.js 放到这个子目录下面，看看会怎样？

```bash
cd test
mkdir dir
mv date.test.js dir/
ls -R
..
node_modules/mocha/bin/mocha
```

看到了吗？原来，Mocha 默认只执行 test 子目录下面第一层的测试用例，不会执行更下层目录的用例。为了改变这种行为，就必须加上 --recursive 参数，这时 test 子目录下面所有的测试用例（不管在第几层）都会被执行。

最后，再给小伙伴们讲一下 mocha 命令行的通配符。mocha 命令行测试指定脚本时，可以使用通配符，利用通配符来同时指定多个文件。例如：

```javascript
mocha test/{calc,date}.test.js
mocha test/unit/*.js
```
上面的第一行命令，指定执行 test 目录下面的 calc.test.js 和 date.test.js 两个自动化测试脚本。第二行命令，指定执行 test/unit 目录下面的所有 js 文件。

除了支持 Shell 通配符，mocha 还可以使用 Node 通配符。
```bash
mocha 'test/**/*.@(js|jsx)'
```

上面代码指定运行 test 目录下面任何子目录中、文件后缀名为 js 或 jsx 的测试脚本。注意，Node 的通配符需要放在单引号之中，否则星号（\*）会先被 Shell 解释。上面这行 Node 通配符，如果改成 Shell 通配符，要写成下面这样。

```bash
mocha test/{,**/}*.{js,jsx}
```

好，咱们这个小节的内容就讲这么多。最后，我想问小伙伴们一个问题，看看大家能不能回答上来。咱们打开一个自动化测试的脚本代码看一下，请问大家这些自动化测试代码中 mocha 在哪里呢？你看咱们代码第二行有对 chai 的 expect 对象的导入，it 块中也有 expect 对象的调用来完成断言。我们代码中有没有对 mocha 对象的导入？和使用呢？没有嘛。那么 mocha 作为自动化测试框架起什么作用呢？其实 mocha 的作用是用来组织整个自动化测试脚本的。这些 describe 块和 it 块都是 mocha 所支持和识别的。所以 mocha 是负责组织测试脚本的。而一旦写好自动化测试脚本之后，执行自动化测试脚本，包括打印报表，也都是 mocha 的事情，而 chai 则只是起到断言的作用。我们一定要把这几个组件他们之间的作用和关系搞清楚。

好，咱们一块看一下本小节的通关任务。【略】好咱们稍事休息再讲下一个话题。
