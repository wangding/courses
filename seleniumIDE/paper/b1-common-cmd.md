作为对上篇课程Selenium IDE WEB自动化测试入门课程的总结性介绍，我们先讲几个常用的Selenium命令。这些是构建自动化测试脚本最常用的命令。

教学策略：
打开上篇中的几个测试脚本，在桌面平铺（最好在IDE中平铺，也可以在浏览器中平铺，IDE不支持平铺，已经测试过了），从这些脚本中我们看到一些常用的，出现频率高的命令。这些出现频率高的命令就是本次课程主要内容。命令的详细信息在Selenium IDE的参考面板中。在IDE中的参考面板讲解命令的参考资料时，要使用放大镜工具放大该区域。

#echo

---
**echo(message)**
Arguments:
message - the message to print

Prints the specified message into the third table cell in your Selenese tables.Useful for debugging.

echo命令可以在测试时打印输出文本。当您的测试在运行时，在控制台中打印显示你测试中的信息，这一点往往是非常有用的。这些信息可以用来提供你测试上下文的结果报告，当你在测试中发现问题时，这个结果报告经常用来报告测试页面时发现的缺陷。最后，可以使用echo语句打印Selenium变量的内容。

借助案例1：hello word来讲解echo命令。

**补充**
echo的四种用法：
这四种用法，其实就两种，打印变量，打印常量。

1. echo message，直接用echo在自动化测试案例执行过程中打印一些静态信息，如echo 当前测试登录功能。之前讲的 hello world 案例中 echo hello world，就是这种用法，只不过hello world没有什么实际意义。当然，这种信息Selenium IDE的log信息已经有不少，大家这一重视一下。

2. echo 自定义变量，echo ${msg}。前两种用法入门课程已经讲了。echo命令还是一个调试脚本的技术，可以在脚本调试中还会讲到。

3. echo 网页中的数据，演示一下，下篇还会展开讲解。

4. echo JavaScript代码片段，演示一下，下篇还会详细讲解。

#highlight

---
**highlight(locator)**
Arguments:
locator - an element locator

Briefly changes the backgroundColor of the specified element yellow. Useful for debugging.

highlight命令，调试的时候很有用。这个命令之前的脚本中没有用到这里面提示一下。后面尤其是讲定位器的时候会主要用这个命令来帮助大家可视化页面元素的定位。另外，计算器案例也有使用。

#open

---
打开一个URL指定的页面。

**open(url)**
Arguments:
url - the URL to open; may be relative or absolute

Opens an URL in the test frame. This accepts both relative and absoluteURLs.The "open" command waits for the page to load before proceeding,ie. the "AndWait" suffix is implicit.*Note*: The URL must be on the same domain as the runner HTMLdue to security restrictions in the browser (Same Origin Policy). If youneed to open an URL on another domain, use the Selenium Server to start anew browser session on that domain.

open命令一般是所有测试案例的第一个命令，打开某个网址，在测试案例面板中选择该命令，然后在参考面板中讲解该命令的详细资料。

相关的命令：openWindow 和 openWindowAndWait 。这两个命令大家自己下去学习一下参考资料。（作业）

#click

---
**click(locator)**
Arguments:
locator - an element locator

Clicks on a link, button, checkbox or radio button. If the click actioncauses a new page to load (like a link usually does), callwaitForPageToLoad.

执行一个点击操作或者执行点击操作并等待新页面加载完成。
另一个类似的命令是clickAndWait。

#assertTitle

---
**assertTitle(pattern)**
Generated from **getTitle()**
Returns:
the title of the current page

Gets the title of the current page.

检查一个页面的标题是否和预期的内容相符。
另一个类似的命令是verifyTitle。

#verifyText

---
**verifyText(locator, pattern)**
Generated from **getText(locator)**
Arguments:
locator - an element locator

Returns:
the text of the element

Gets the text of an element. This works for any element that containstext. This command uses either the textContent (Mozilla-like browsers) orthe innerText (IE-like browsers) of the element, which is the renderedtext shown to the user.

验证预期的文本和其相应的HTML标记是否出现在页面上。

#verifyElementPresent

---
**verifyElementPresent(locator)**
Generated from **isElementPresent(locator)**
Arguments:
locator - an element locator

Returns:
true if the element is present, false otherwise

Verifies that the specified element is somewhere on the page.

验证用HTML标签定义的，预期会出现的UI元素，是否在页面上存在。考虑一下，页面上的图片怎么验证呢？图片不是文字，当然不能验证文字了，但是我们知道图片都是img标记的HTML代码所包围的，所以可以用这个命令来验证图片元素。

#不讲的命令

---
下面这四个命令不太常用，不讲了。在源文档中是讲这四个常用命令的。以后找合适的机会再讲。

verifyTable
验证表格中是否包含预期的内容。

waitForPageToLoad
暂停执行，直到预期的新页面成功加载。当使用clickAndWait命令时此命令自动被调用。

waitForElementPresent
暂停执行，直到一个用HTML标签定义的预期的UI元素，在页面上出现。

verifyTextPresent
检查页面上是否在某处出现预期的文字。这个命令已经过时了，现在都用verifyText命令了。
