# 技术细节一

## 测试用例管理

各位小伙伴大家好，咱们接着前面的课程，继续讲解《基于 Mocha 的自动化测试框架》，现在咱们讲解技术细节一的两个话题。

一般来说，对于一个大型项目，一定会有很多个被测模块，而每个被测模块也可能会有很多测试用例。有时，我们希望只运行其中的几个，这时可以用 only 方法。describe 块和 it 块都允许调用 only 方法，表示只运行某个测试套件或测试用例。

我们进入 mocha-demo 目录，编辑测试脚本 test/calc.test.js。

```javascript
it.only('0 + 0 = 0', function() {
  expect(add(0, 0)).to.be.equal(0);    
});

it('0 + 1 = 1', function() {
  expect(add(1, 0)).to.be.equal(1);   
});
```

上面代码中，只有带有 only 方法的测试用例会运行。

```bash
mocha test/add.test.js
```

此外，还有 skip 方法，表示跳过指定的测试套件或测试用例。作用于 only 正好相反，only 是排他的，只执行 only 方法指定的测试套件或测试用例，而 skip 是不执行 skip 方法的测试套件和测试用例。实际上，从这两个英文单词的含义上，是很容易能看出这个区别来的。

```javascript
it.skip('1 + 1 = 2', function() {
  expect(add(1, 1)).to.be.equal(2); 
});
```

上面代码的这个测试用例不会执行。

## 测试用例钩子

Mocha 在 describe 块之中，提供测试用例的四个钩子：before()、after()、beforeEach() 和 afterEach()。它们会在指定时间执行。这四个钩子在进行测试的时候，往往可以用来提供测试环境的准备工作和测试环境的清理工作。我们在下面的示例代码中给小伙伴们演示一下这四个钩子执行的时间和顺序，在后面我们会结合 webdriver 做一个网页登录功能的测试，那是一个更真实和具体的案例，小伙伴们到时候会理解这些钩子的价值的。

```javascript
describe('hooks', function() {
  before(function() {
    // 在本测试套件的所有测试用例之前执行                  
  });

  after(function() {
    // 在本测试套件的所有测试用例之后执行               
  });

  beforeEach(function() {
    // 在本测试套件的每个测试用例之前执行               
  });

  afterEach(function() {
    // 在本测试套件的每个测试用例之后执行               
  });

  // test cases
                
});
```

进入 mocha-demo 目录，我们给小伙伴们演示一下钩子的用法。

