# 编写测试脚本

各位小伙伴大家好，咱们接着前面的课程，继续讲解《基于 Mocha 的自动化测试框架》，现在咱们讲解编写测试脚本这个话题。

前面的课程已经带着小伙伴们创建了被测项目，【ll -a 查看 mocha-demo 目录，边演示边讲解】一个主程序 index.js 和一个模块 calc.js。本次课程我们将带着小伙伴们对这个被测项目创建自动化测试脚本。废话不多说，我们就直接开干吧。

一般自动化测试脚本我们都放到当前项目文件夹下的 test 子文件下，自动化测试脚本的文件名有命名规范，一般测试脚本的文件名应该与被测模块的文件名相同，而扩展名是 .test.js。如果我们测试的是 calc.js 模块，那么我们的自动化测试脚本的文件名应该是 calc.test.js。我们启用 vim 编辑器来编写自动化测试脚本：

```bash
mkdir test
cd test
vim calc.test.js
```
自动化测试脚本的代码如下：

```jacascript
var add = require('../calc').add;
var expect = require('chai').expect;

describe('加法函数的测试', function() {
  it('0 + 0 = 0', function() {
    expect(add(0, 0)).to.be.equal(0);
  });
});
```

好了这就是我们的自动化测试脚本，我们来解释一下，自动化测试脚本的写法，其实是有章法可寻的。所谓章法，就是写文章的方法和套路，其实写程序也是有方法和套路的，当你掌握了这种方法和套路之后，写程序一点儿都不难。

第一行，我们需要把被测的模块引用进来，这个和我们之前写的 index.js 主程序的第一行很类似【可以分窗口比对一下】，唯一的区别是路径的问题。因为，index.js 和 calc.js 是在同一级目录下面，所以用相对路径的 . 表示当前路径，而测试脚本 calc.test.js 所在的目录是 test 子目录，所以 .. 表示上一级目录。

第二行，把断言库 chai 引用进来，断言库 chai 有三种断言风格，对应了三种断言对象，分别是：expect，assert 和 should。expect 比较符合自然语言的语法，所以我们使用 expect。我们程序中 expect(add(0, 0)).to.be.equal(0) 就是对断言库中的 expect 对象的使用。

接下来的 describe 块称为"测试套件"（test suite），表示一组相关的测试。它是一个函数，第一个参数是测试套件的名称（"加法函数的测试"），第二个参数是一个实际执行的函数。

it 块称为"测试用例"（test case），表示一个单独的测试，是测试的最小单位。它也是一个函数，第一个参数是测试用例的名称（"1 加 1 应该等于 2"），第二个参数是一个实际执行的函数。

刚才写的这段代码，就是自动化测试脚本，它可以独立执行。自动化测试脚本里应该包含一个或多个 describe 块，describe 块可以嵌套，每个 describe 块应该包含一个或多个 it 块。

可能有的小伙伴要问了，代码中 mocha 在哪里呢？好像我们代码的前面没有 require mocha 对象嘛。其实 mocha 的作用是用来组织整个自动化测试脚本的。这些 describe 块和 it 块都是 mocha 所支持和识别的。所以 mocha 是负责组织测试脚本的。而一旦写好自动化测试脚本之后，执行自动化测试脚本，包括打印报表，也都是 mocha 的事情，而 chai 则只是起到断言的作用。我们一定要把这几个组件他们之间的作用和关系搞清楚。

接下来就是执行自动化测试案例了 node_modules/mocha/bin/mocha test/calc.test.js 

这样咱们就把自动化测试脚本编写的章法和套路讲清楚了，换句话说咱们做自动化测试的大部分时间和精力都是放在 it 自动化测试用例代码的编写上，当然这就要考验小伙伴们设计测试用例的水平了。你看咱们设计的测试案例到现在都没有发现加法函数中的 bug。现在我们再增加一个测试案例，1 + 0 = 1，这个时候你再执行测试的时候发现出错了，其实我们的代码写的有问题。所以这涉及到我们测试案例设计的水平好坏，我们要保证有足够的测试用例，能够把软件中的各种问题测试出来。

```jacascript
  it('0 + 1 = 1', function() {
    expect(add(0, 1)).to.be.equal(1);
  });
```

可能又有小伙伴们要问了，我们的被测程序不可能都像 add 函数这样简单的返回一个数值，我们直接比较相等就可以了，如果我们返回的是一个布尔值，或者是字符串，甚至是对象怎么办呢？这个问题问的非常好。下面我们把断言库的用法给小伙伴们简单介绍一下。

```javascript
// 相等或不相等
expect(4 + 5).to.be.equal(9);
expect(4 + 5).to.be.not.equal(10);
expect(foo).to.be.deep.equal({ bar: 'baz'  });

// 布尔值为true
expect('everthing').to.be.ok;
expect(false).to.not.be.ok;

// typeof
expect('test').to.be.a('string');
expect({ foo: 'bar'  }).to.be.an('object');
expect(foo).to.be.an.instanceof(Foo);

// include
expect([1,2,3]).to.include(2);
expect('foobar').to.contain('foo');
expect({ foo: 'bar', hello: 'universe'  }).to.include.keys('foo');

// empty
expect([]).to.be.empty;
expect('').to.be.empty;
expect({}).to.be.empty;

// match
expect('foobar').to.match(/^foo/);
```
从这些断言的代码上能看出，基本上，expect 断言的写法都是一样的。头部是 expect 方法，尾部是断言方法，比如 equal、a/an、ok、match 等。两者之间使用 to 或 to.be 连接。

如果 expect 断言不成立，就会抛出一个错误。事实上，只要不抛出错误，测试用例就算通过。

好这样，我们本小节的内容基本上都讲完了。最后，我们把这次的代码提交到版本仓库。大家一块看一下本小节的通关任务。（略）

不知道小伙伴们注意到了没有，刚才我们在命令行下执行测试脚本的时候，那个命令写的很长，这样执行测试案例也太费劲了吧。如何才能提高工作效率呢？下次课咱们会讲 mocha 命令行的基本用法，以及后面课程会介绍更多的 mocha 命令的参数以及用法，这些命令用法，大家掌握之后，在将来编写持续集成脚本的时候会用，好我们稍事休息，再讲下面的话题。
