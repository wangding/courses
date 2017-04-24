# 创建被测项目

各位小伙伴大家好，咱们接着前面的课程，继续讲解《基于 Mocha 的自动化测试框架》，现在咱们讲解创建被测项目这个话题。

我们其实可以从 GitHub 上找到很多使用 mocha 作为自动化测试框架的开源项目，就像第一次课中给大家演示的 connect 项目类似。但是一般这类项目会比较复杂，为了把目光聚焦在自动化测试本身，而不是纠缠于项目的业务逻辑。我们下面自己创建一个简单的被测项目，把业务逻辑做的尽可能的简单，这样我们就可以把重点聚焦到 Mocha 的使用上来。

下面就带着小伙伴们一步一步的把被测项目创建出来，因为我们写自动化测试代码用的是 JavaScript 语言，所以被测项目也用 JavaScript 语言，做一个简单的 nodejs 程序。

```bash
# 首先创建一个项目目录
mkdir mocha-demo

# 把这个项目目录初始化成 git 仓库
git init

# 在项目仓库下创建 .gitignore 文件
# .gitignore 文件的内容是
node_modules

# 运行 npm init 初始化 nodejs 项目
npm init
```
package.json 文件的主要参数如下所示：

```javascript
{
  "name": "mocha-demo",
  "version": "1.0.0",
  "description": "基于 Mocha 的自动测试框架示例项目",
  "main": "index.js",
  "scripts": {
    "test": "mocha"
  },
```

添加 .tern-project 文件，设置 vim 编辑器的自动补全功能。代码如下：

```javascript
{
  "libs": [],
  "plugins": {
    "node": {},
  }
}
```
最后，添加代码文件 calc.js，代码如下：

```javascript
/**
 *  计算两个数 x 和 y 的和 
 *  @param {number} x 第一个求和的数 
 *  @param {mumber} y 第二个求和的数 
 *  @return {number}  返回 x + y 的求和结果
 */
function add(x, y) {
  return x * y;   // 这里故意写错
}

module.exports.add = add;
```

添加一个 index.js 代码文件，测试上面的运算：

```javascript
console.log('0 + 0 =' + add(0, 0));
```

这里我们写了一个模块 calc.js，然后在主程序 index.js 中对 calc.js 中的函数进行调用。问题是这些函数写的靠谱吗？我们是不是需要进行测试呢？这时候我们的主角 mocha 就闪亮登场了。

我们首先安装 mocha 和 chai 两个工具。

```bash
npm install mocha -D
npm install chai  -D
```

有了这两个测试工具，我们接下来就可以写自动化测试脚本了。那我们本小节的内容就先讲到这里，我们把刚才的所有代码提交到 Git 仓库中。我们一块儿看一下本小节的通关任务。
