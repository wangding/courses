# Mocha 和代码覆盖工具的整合

各位小伙伴大家好，咱们接着前面的课程，继续讲解《基于 Mocha 的自动化测试框架》，现在咱们来讲解 Mocha 和代码覆盖率工具的整合这个话题。

在测试工作中，如果我们做的稍微专业一些，通常会要求测试工程师对项目的质量做定量分析，比如，代码覆盖率，千行代码 bug 率，等。这时，我们常常关心，是否所有的代码都测试到了。这个指标就叫做"代码覆盖率"（code coverage）。它有四个测量维度。

- 行覆盖率（line coverage）：是否每一行都执行了？
- 函数覆盖率（function coverage）：是否每个函数都调用了？
- 分支覆盖率（branch coverage）：是否每个 if 代码块都执行了？
- 语句覆盖率（statement coverage）：是否每个语句都执行了？

Istanbul 是 JavaScript 程序的代码覆盖率工具，本主题来介绍它和 Mocha 的整合用法。这个代码覆盖工具的名字为什么叫伊斯坦布尔呢？我们给小伙伴们八卦一下。伊斯坦布尔是土耳其最大的城市，土耳其生产的地毯世界闻名，而地毯是用来覆盖地面的。而这款软件是用来做代码覆盖率测试的，因此，用伊斯坦布尔这个城市的名字来命名，就是这样一个由来。

## 安装

我们首先进入 mocha-demo 项目目录，安装一下 Istanbul 工具。

```bash
npm install istanbul -D
```

## 覆盖率测试

我们先做一个简单的例子，来看一下，怎么使用 Istanbul。下面是脚本文件 simple.js。

```javascript
var a = 1;
var b = 1;
if ((a + b) > 2) {
  console.log('more than two');
}
```
使用 istanbul cover 命令，就能得到覆盖率。

```bash
istanbul cover simple.js

# 运行结果

===== Coverage summary =====
Statements   : 75% ( 3/4  )
Branches     : 50% ( 1/2  )
Functions    : 100% ( 0/0  )
Lines        : 75% ( 3/4  )
=============================
```

返回结果显示，simple.js 有 4 个语句（statement），执行了 3 个；有 2 个分支（branch），执行了 1 个；有 0 个函数，调用了 0 个；有 4 行代码，执行了 3 行。

这条命令同时还生成了一个 coverage 子目录，其中的 coverage.json 文件包含覆盖率的原始数据，coverage/lcov-report 是可以在浏览器打开的覆盖率报告，其中有详细信息，到底哪些代码没有覆盖到。

## 覆盖率门槛

完美的覆盖率当然是 100%，但是现实中很难达到。需要有一个门槛，衡量覆盖率是否达标。istanbul check-coverage 命令用来设置门槛，同时检查当前代码是否达标。

```bash
istanbul check-coverage --statement 90
```
    ERROR: Coverage for statements (75%) does not meet global threshold (90%)

上面命令设置语句覆盖率的门槛是 90% ，结果就报错了，因为实际覆盖率只有 75%。除了百分比门槛，我们还可以设置绝对值门槛，比如只允许有一个语句没有被覆盖到。

```bash
istanbul check-coverage --statement -1
```
上面命令使用负数，表示绝对值门槛。这样一来，上面的例子就通过了覆盖率测试，不会再报错了。

百分比门槛和绝对值门槛，可以结合使用。

```bash
istanbul check-coverage --statement -5 --branch -3 --function 100
```
上面命令设置了 3 个覆盖率门槛：5 个语句、3 个 if 代码块、100% 的函数。注意，这三个门槛是"与"（and）的关系，只要有一个没有达标，就会报错。

## 与 Mocha 测试框架的结合

上面我们介绍了 Istanbul 的基本用法。实际开发时，istanbul 总是与测试框架结合使用，下面我们讲一下 Mocha 测试框架和 Istanbul 的整合应用。

我们还是拿之前的 calc.js 被测模块为例，来讲解 Mocha 与 Istanbul 的整合应用。我们先修改一下 index.js 主程序，看看 calc.js 模块是不是已经经过了严格测试，没有丝毫问题了。

假如我们在调用 add 函数的时候，我们传入 'abc' 和 4，一个字符串和一个数字，我们看一下主程序的运行效果，你会看到，结果是 'abc4'，显然不是我们想要的结果。我们希望程序告诉我们，这样的输入参数，不能参与运算。可见我们的测试案例设计的还是不够，当然，主要问题还是被测模块写的有问题，没有考虑到数据合法性校验的问题。

我们开始修改 calc.js 模块。

```javascript
function add(x, y) {
  if(((typeof x) === 'number') && ((typeof y) === 'number'))
    return x + y;
  else
    return NaN;
}
```
我们再运行 index.js 主程序的时候，已经看到 add 函数的返回信息已经正常了。到现在我们为止，我们还没有修改自动化测试脚本，我们修改了被测模块，我们来运行一下自动化测试脚本，看看会有什么反应吗？好像一切正常。那我们把代码覆盖率和自动化测试脚本一块运行一下，看看代码覆盖率的数据怎样。

```bash
node_modules/.bin/istanbul cover node_modules/.bin/_mocha -- test/calc.test.js

先解释一下上面命令，istanbul cover 命令后面跟的是 _mocha 命令，前面的下划线是不能省略的。因为，mocha 和 _mocha 是两个不同的命令，前者会新建一个进程执行测试，而后者是在当前进程（即 istanbul 所在的进程）执行测试，只有这样， istanbul 才会捕捉到覆盖率数据。其他测试框架也是如此，必须在同一个进程执行测试。

如果要向 mocha 传入参数，可以写成下面的样子。

```bash
istanbul cover _mocha -- tests/test.sqrt.js -R spec
```

上面命令中，两根连词线后面的部分，都会被当作参数传入 Mocha 。如果不加那两根连词线，它们就会被当作 istanbul 的参数。

你会发现测试覆盖率的数据不好，有一个 if 分支没有覆盖到，语句覆盖也不完全。什么原因呢？是因为我们的测试案例设计的不好，没有把异常情况考虑进去。我们接着修改自动化测试脚本，在脚本中增加一些测试用例。

```javascript
it('abc + 1 = NaN', function() {
    expect(isNaN(add('abc', 1))).to.be.ok;
});
```

然后我们在运行自动化测试脚本，我们看到代码覆盖率指标上去了。所以，我们从代码覆盖率指标上，只要能看到我们测试用例设计的够不够。如果有不测代码没有被覆盖的情况出现，我们一般会认为，没有被测试到的代码出现 bug 的风险会更高一些。

当然，在浏览器上也是可以运行 Istanbul 进行覆盖率测试的，这个内容我们就简略了。这样，我们 Mocha 和代码覆盖率功能整合的话题就讲到这里，我们一块看一下本小节的通关任务。略。
