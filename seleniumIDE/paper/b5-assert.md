# 验证页面元素

验证 UI 元素是否出现在网页上，是最常见的自动化测试任务之一。Selenese 有多种手段来检查 UI 元素。重要的是，你要了解这些不同的方法，因为这些方法定义了你的测试行为。

例如，你会测试……

1. 元素是否出现在页面上？
2. 特定的文本是否出现在页面上？
3. 特定的文本是否出现页面的指定位置？

例如，如果您正在测试一个文本标题，文本和它的位置在页面的顶部，对于你的测试可能很重要。然而，如果您正在测试一个主页，这个主页面上有一个图片，网页设计师经常改变页面上的图片文件以及图片出现的位置，这时你只需要测试图片（而不是特定的图像文件）在页面上是否出现就可以了。

**补充**
这涉及到我们设计的自动化测试案例脚本是否健壮，是否能尽可能少的变动。检查的条件越宽泛，将来修改脚本的可能性就越小。

# 断言和验证

在“assert”（断言）和“verify”（验证）之间选择的关键点，取决于对测试失败如何管理以及管理的便利性。如果在检查浏览器显示的是否是预期页面时，测试已经失败，那么在此基础上再检查页面的第一个段落是否正确几乎没有意义了。如果打开的页面不对，你可能想立刻中止测试用例，检查原因并修复问题。另一种情况，你可能希望检查页面上的许多属性，在测试用例碰到第一个失败后并不终止执行，这将允许你检查所有页面上的失败，然后采取适当的行动。“assert”测试失败会中止当前的测试用例，而“verify”测试失败，会继续运行测试用例。

使用这个功能的最佳实践是将测试命令进行逻辑上的分组，在每组命令开始前有一个“assert”，后面跟着一个或多个“verify”测试命令。举个例子:
  
```
Command   Target  Value
open  /download/   
assertTitle   Downloads    
verifyText  //h2  Downloads
assertTable   1.2.1   Selenium IDE
verifyTable   1.2.2   June 3, 2008
verifyTable   1.2.3   1.0 beta 2
```

上面的例子首先打开一个页面，然后比较当前页面的title与期望值是否一致，来asserts（断言）当前加载的页面是正确的。只有这个断言测试通过后，才执行以下的命令并“verify”（验证）文本出现在预期的位置。接下来的测试用例继续“asserts”（断言）第一个表的第二行第一列包含预期的值，只有当这个断言测试通过，才继续验证这一行剩余的单元格。

## verifyElementPresent

---
使用这个命令来测试特定的UI元素，而不是其内容，出现在页面上。这个验证不检查文本而是检查HTML标记。一个常见的用法是检查一个图片的存在。

```
Command   Target  Value
verifyElementPresent  //div/p/img    
```

这个命令验证一个图片，由img HTML标签指定的，是否在页面上存在，而且它在一个div标签和一个p标签下面。第一个（也是惟一一个）参数是一个定位器告诉Selenese命令如何找到这个元素。定位器会下一节中解释。

verifyElementPresent可以被用来检查页面中存在的任何HTML标签。您可以检查链接、段落、块等是否存在。下面是几个例子。

```
Command   Target  Value
verifyElementPresent  //div/p    
verifyElementPresent  //div/a    
verifyElementPresent  id=Login   
verifyElementPresent  link=Go to Marketing Research    
verifyElementPresent  //a[2]   
verifyElementPresent  //head/title   
```
这些例子说明了UI元素可能被测试的各种方式。定位器是在下一节中解释。

## verifyText

---
当文本和它的UI元素都必须被测试时使用verifyText命令。verifyText必须使用定位器。如果你选择XPath或DOM定位器，您可以验证在页面上特定的文本相对于其他UI组件出现在页面上的特定的位置。**注意：**这里说的文本的位置，并不是指文本块在页面上的坐标位置，而是在网页代码中的位置，这个位置用 XPath 来标示。

```
Command   Target  Value
verifyText  //table/tr/td/div/p   This is my text and it occurs right after the div inside the table.
```

## 案例 ATOOL

---
被测网站：ATOOL
网站地址：http://www.atool.org
被测内容：便民工具-便民服务 类工具下的八个页面
演示要点：用录制的方式生成脚本，在录制脚本的基础上，修改脚本。有三个修改的地方，第一，修改定位器，让定位器用简单的 LinkText 类型的定位器，第二，添加返回主页的命令动作，第三，添加注释，并在源视图修改代码，增加脚本的可读性。

## verifyTextPresent（略）

---
命令verifyTextPresent用于验证页面上存在指定的文本。此命令需要一个文本模式参数，用来做验证。（**此命令已经失效**）例如：
```
Command   Target  Value
verifyTextPresent   Marketing Analysis   
```
这将导致Selenium去搜索，并验证文本字符串"Marketing Analysis"出现在被测页面的某个地方。当你只考虑页面上是否出现特定的文本时，请使用verifyTextPresent命令。当您还需要测试页面上文本出现的位置时，不要用这个命令。
```
```
```
```
```
```
```
```
```
```
