# Mocha 和 webdriver 整合

各位小伙伴大家好，咱们接着前面的课程，继续讲解《基于 Mocha 的自动化测试框架》，现在咱们来讲解 Mocha 与 webdriver 整合这个话题。

从前面的课程讲解中我们其实已经看出，Mocha 主要是对被测模块做自动化的单元测试，可能很多小伙伴会有疑问，Mocha 难道只能做单元测试吗？其实，不是这样的。这里我们在【幻灯片】上给出了一幅图，说明了自动化测试的三个主要应用场景：自动化单元测试、自动化接口测试和自动化 web ui 测试。你会看到 Mocha 作为自动化测试框架来说，他的作用是基础性的。这就意味着，Mocha 既可以做自动化单元测试，也可以做自动化接口测试，甚至可以做 WEB UI 的自动化功能测试。单元测试，我们已经说得很多了，前面我们对 calc.js 和 date.js 两个模块的测试就是单元测试。至于，接口测试，其实我们也讲到了，只是没有明确的提出。不知道小伙伴们是否还有印象，我们讲异步测试的时候，用到 node-fetch 模块，当时案例是对 GitHub 的 WEB API 做的测试，被测网站是 https://api.github.com。其实在那个案例上稍微深入一些，我们完全可以做一个完整的 WEB 接口自动化测试。现在我们来给小伙伴们讲讲 Mocha 和 Selenium webdriver 整合，做 WEB UI 自动化测试。

## webdriver 简介

关于 Selenium webdriver 是什么，相信学习过 Selenium IDE WEB 自动化测试（上篇）课程的小伙伴应该有印象，如果印象不深刻了，也可以把课程的第四个视频——Selenium 的前世今生再回顾一下。这里我就不再赘述了。我们直接拿 Selenium IDE WEB 自动化测试（上篇）课程中的一个案例来讲解，这个案例是 hostedredmine 网站的登录功能的自动化测试，当时我们是用 Selenium IDE 工具对登录功能做的录制回放的自动化测试。现在我们用 JavaScript 结合 webdriver 来编写自动化测试脚本，来对网站登录功能做全代码的自动化测试。

## 安装

我们首先进入 mocha-demo 项目目录，安装一下 selenium-webdriver 第三方库。

```bash
npm install selenium-webdriver -D
```

## 写测试脚本

我们先做一个简单的例子，看一下怎么使用 webdriver。webdriver 的代码跑通了我们再说如何跟 mocha 整合。我们在 test 目录下面创建脚本文件 hostedredmine-login.test.js。编写这个脚本的时候，我们需要参考之前做的 Selenium IDE 的自动化测试脚本，因为里面有定位信息。所以，我们之前一直给小伙伴们强调，做全代码的 WEB 自动化测试一定离不开 Selenium IDE 工具的掌握，录制回放工具是基础，录制回访工具多简单啊，如果连录制回放工具都不会用，能把自动化测试脚本写的很棒，这是说不通的，因为纯代码的测试脚本写起来难度更高一些。当然，难度再高也是有方法和套路的。【这里面我们采用增量开发的方式，另外，因为我们开发环境是命令行界面，不是图形界面，所以不能运行带窗口的浏览器，所以我们使用的是 phantomjs 这个无头浏览器，而不是 firefox 或者 google chrome 浏览器。】

```javascript
var webdriver = require('selenium-webdriver'),
    By = webdriver.By,
    until = webdriver.until;

var driver = new webdriver.Builder()
    .forBrowser('phantomjs')
    .build();

driver.get('http://www.hostedredmine.com/login').then(function() {
  console.log('get ok');
});

driver.getTitle().then(function(title) {
  console.log(title);
});

driver.findElement(By.id('username')).sendKeys('test_2016_1');
driver.findElement(By.id('password')).sendKeys('123');
driver.findElement(By.name('login')).click().then(function(){
  console.log('click ok');
);

driver.findElement(By.id('flash_error')).getText().then(function(text) {
  console.log(text);
});

driver.findElement(By.id('username')).sendKeys('test_2016_2');
driver.findElement(By.id('password')).sendKeys('Passw0rd!');
driver.findElement(By.name('login')).click().then(function(){
  console.log('click ok');
});

driver.findElement(By.id('flash_error')).getText().then(function(text) {
  console.log(text);
});
 
driver.findElement(By.id('username')).sendKeys('test_2016_1');
driver.findElement(By.id('password')).sendKeys('Passw0rd!');
driver.findElement(By.name('login')).click().then(function(){
  console.log('click ok');
});

driver.wait(until.titleIs('我的工作台 - Online Project Management :: Free Redmine Hosting')).then(function() {
  console.log('title is ok');
});

driver.getTitle().then(function(title) {
  console.log(title);
});

driver.findElement(By.id('loggedas')).getText().then(function(text) {
  console.log(text);
  driver.quit();
});
```

上面的代码你一定会想，怎么没有断言啊，Selenium IDE 里面我们讲过两种断言，assert 断言和 verify 断言命令。但是 webdriver 的 api 里面就是没有断言函数，看到了吧。所以，我们必须和 Mocha 以及 Chai 断言库进行整合应用，这样的自动化测试才算完美。代码的结构其实很简单，开始是声明变量，后面是操作浏览器，打开页面，输入登录信息，进行登录验证。在登录验证上，我们执行了三次测试，分别是：用户名正确，密码错度的情况；用户名错误，密码正确的情况；以及用户名和密码都正确的情况。我们接下来修改上面的代码和 Mocha 结合起来。

```javascript
var expect = require('chai').expect;
var webdriver = require('selenium-webdriver'),
    By = webdriver.By,
    until = webdriver.until;

var driver = new webdriver.Builder()
    .forBrowser('phantomjs')
    .build();
    
describe('hosted redmine 网站登录测试', function() {
  before(function() {
    driver.get('http://www.hostedredmine.com/login');
  });

  it('用户名正确，密码不正确，登录失败', function() {
    driver.findElement(By.id('username')).sendKeys('test_2016_1');
    driver.findElement(By.id('password')).sendKeys('123');
    driver.findElement(By.name('login')).click();
    driver.findElement(By.id('flash_error')).getText().then(function(text) {
      expect(text).to.be.equal('无效的用户名或密码');
    });
  });

  it('用户名不正确，密码正确，登录失败', function() {
    driver.findElement(By.id('username')).sendKeys('test_2016_2');
    driver.findElement(By.id('password')).sendKeys('Passw0rd!');
    driver.findElement(By.name('login')).click();
    driver.findElement(By.id('flash_error')).getText().then(function(text) {
      expect(text).to.be.equal('无效的用户名或密码');
    });
  });

  it('用户名正确，密码正确，登录成功', function() {
    driver.findElement(By.id('username')).sendKeys('test_2016_1');
    driver.findElement(By.id('password')).sendKeys('Passw0rd!');
    driver.findElement(By.name('login')).click();
    driver.wait(until.titleIs('我的工作台 - Online Project Management :: Free Redmine Hosting'));
    driver.getTitle().then(function(title) {
      expect(title).to.be.equal('我的工作台 - Online Project Management :: Free Redmine Hosting');
    });
  });

  after(function() {
    driver.quit();
  });
});
```

我们运行一下上面的自动化测试脚本，大家看到 Mocha 的强大了吧，Mocha 和 Selenium webdriver 结合就可以做网站界面的自动化测试。在这个自动化测试脚本中，综合运用了下篇课程的很多知识点，小伙伴们发现了吗？这里面有基于 promise 的异步测试内容。有 before 和 after 钩子的使用。好，这样我们这个话题就讲到这里。就像我们前面在课程说明中提到的，webdriver 的 web ui 自动化测试的内容，我们是不可能通过一个视频，在短短的一二十分钟内，就能把整个 webdriver 的各种 api 和用法完全讲清楚的，我们在今后会开专门的课程来讲解这块内容的。换句话说，我们会专门开课程来讲 web 接口自动化测试的课程，以及 web ui 自动化测试的课程，希望小伙伴们保持关注。我们一块看一下通关任务。略。
