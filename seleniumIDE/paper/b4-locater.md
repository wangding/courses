# 导入

---
定位元素的本质是什么？找到UI用户界面上需要操作的对象（或者称为 GUI 小部件），如何找到呢？人眼是可以识别的，对于程序呢？如果模仿人眼的识别就坏事儿了，控件位置一旦改变了，测试就通不过了，因为程序针对图片做比对的话，精度可以达到像素级。一个界面上的按钮，在前后两个开发版本上调整了1个像素，在做图片比对上，都是不一致的，都会导致自动化测试脚本测试失败。幸好，这个方法不是主流，估计早先考虑过这种方法，应该慢慢被淘汰了。现在都是基于编程信息的比对。当然，编程信息如果在两个版本上有差异，也会出错，当然，相对与图片比对来说这样的脚本，健壮性已经增强很多了。

**【打开一些做过的案例，比如：百度】**对于许多 Selenium 命令，target（目标）是必需的。这个目标用来标识网站页面中的指定元素，他是用 locatorType = location 格式所描述。这就是我们上节课中提到的 Selenese 的四种常见参数类型中的第二种，也是我们中篇课程的重点。Selenium 支持的定位器参数，总共有七种类型，如 PPT 上所示，有identifier、ID、Name、XPath、DOM、LinkText 和 CSS，这七种定位器中，我们前面案例中用的最多的就是 ID，当然其他类型的定位器我们也用到一些，只不过没有过多的解释。下面我们结合案例为大家逐一讲解每种定位器类型。

**【打开locator案例，并平铺展开】**下面所有定位器的案例讲解都是基于sample.html这个被测页面来展开的，我们有必要先把这个页面的结构和代码给大家介绍一下。这个代码可以从github上下载。

![桌面布局](https://github.com/wangding/seIDE/raw/master/locator/manual.png)

```
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>元素定位教学案例页面</title>
    </head>
    <body>
    <h1><center>Selenium IDE WEB自动化测试入门</center></h1>
    <p>这是两个链接，你打算点开看一下吗？</p>
    <a href="sample.html">sample页面</a>
    <a href="locator.html">locator测试案例</a>
    <p>下面是表单：</p> <hr>
    <form id="loginForm">
        账户：<input class="required" name="username" type="text" /><br /><br />
        密码：<input class="required passfield" name="password" type="password" /><br /><br />
        <input name="continue" type="submit" value="Login" />
        <input name="continue" type="button" value="Clear" />
    </form>
</body>
<html>
```

# 标识符定位

---
这是最常用的定位元素的方法，当没有指定定位器类型时，默认使用这种定位器。这个策略会检索 id 属性值与 location 匹配的第一个元素。如果没有元素的 id 属性与之匹配，那么会检索 name 属性与 location 匹配的第一个元素。

例如：对于 sample.html 页面源代码中可能有 id 和 name 属性如上所示。

下面的定位策略将返回上面HTML片段中相匹配元素的行号：

* identifier = loginForm (12)
* identifier = password (14)
* identifier = continue (15)
* continue (15)

因为 identifier 类型的定位是默认的，前三个例子的 identifier = 不是必需的。

# ID 定位

---
这种类型的定位器比 identifier 定位器类型限制更多，也更加明确。当你知道一个元素的 id 属性时使用这个定位器。
 
 * id = loginForm (12)

# Name 定位

---
Name 定位器类型将定位与 Name 属性相匹配的第一个元素。**如果有多个名称属性相同的元素，那么您可以使用过滤器来进一步完善你的位置策略。**
 
* name = username
* name = password
* name = continue
* name = continue value=Clear
* name = continue Clear

**注意**

不像某些类型的定位器，如：XPath 和 DOM。上面三种类型的定位器允许Selenium 测试一个 UI 元素而不依赖其在页面上的位置。如果页面结构或者组织改变了，测试仍将通过。你有可能会对页面结构发生变化的页面进行测试。如果网页设计师经常改变页面，但其功能必须回归测试，通过 id 和 name 属性，或通过任何 HTML 属性进行测试就变得非常重要了。 

# XPath 定位

---
XPath 是用于定位 XML 文档中节点的语言。由于 HTML 可以实现为XML（XHTML），Selenium 的用户可以利用这个强大的语言来定位他们 web 应用程序中的元素。XPath 超出（并支持）简单的 id 或 name 属性定位，同时开辟了各种新的可能性，如定位页面上第三方的复选框。

使用 XPath 的主要原因之一是对于一个希望定位的元素，你没有合适的 id 或 name 属性来定位。可以用 XPath 绝对路径来定位元素（不建议），也可以使用相对于一个有 id 或 name 属性的元素来定位。XPath 定位器也可以通过使用 id 和 name 属性之外的其他属性来定位元素。

绝对的 XPath 包含从根（html）所有元素的位置，因此只要轻微的调整应用程序页面，XPath 就会失效。举例说明：把 sample.html 页面上的所有元素放到 <div> 中，页面开不出任何变化。绝对路径就变了。通过寻找附近的 id 或 name 属性的元素（理想情况下是一个父元素）可以基于这种位置关系来定位你的目标元素。这种位置关系通常不太可能改变，可以使你的测试脚本更加健壮。

因为只有 XPath 定位器从“//”开始，所以在指定 XPath 定位器时没有必要包含 xpath = label。

* xpath = /html/body/form[1]
* xpath = //form[@id='loginForm']
* xpath = //form[input/@name='username']
* //input[@name = 'username']
* //form[@id = 'loginForm']/input[1]
* //input[@name = 'continue'][@type='button']
* //form[@id = 'loginForm']/input[3]

**补充：**
1. XPath 额外的学习资料：W3School
2. Firebug 插件提供 XPath 提取功能，但是只支持绝对路径，需要手工修改成相对路径。【演示一下】

# Link Text 定位超链接

---
用链接文字来定位网页面上的超链接元素是一个很简单的方法。如果两个链接有相同的文本，那么第一个匹配的元素被定位。

* link = sample页面
* link = locator测试案例

# DOM 定位

---
文档对象模型用来表示一个 HTML 文档，可以使用 JavaScript 操作和访问。这个位置策略使用 JavaScript 来评估一个元素是否页面上，他通过使用分层的点号标记法，使得元素定位得到简化。

因为只有 DOM 定位器由 document 开始，所以当指定一个 DOM 定位器时没有必要包括 dom = label 。有四种基本的 DOM 方式来定位元素：

* getElementById
* getElementByName
* dom:name
* dom:index

* dom = document.getElementById('loginForm')
* dom = document.forms['loginForm']
* dom = document.forms[0]
* document.forms[0].username
* document.forms[0].elements['username']
* document.forms[0].elements[0]
* document.forms[0].elements[3]

您可以使用 Selenium 以及其他网站或者浏览器扩展来探索你的 web 应用程序的 DOM。W3Schools是一个好的参考。

# CSS 定位

---
CSS（Cascading Style Sheets，层叠样式表）是用于描述 HTML 和 XML 文档样式的语言。CSS 使用选择器来绑定文档中元素的样式属性。这些选择器可以使用 Selenium 作为另一个定位策略。CSS选择器的语法有很多，而在 Selenium 中我们常用的主要有五种，分别是：
* 标记和 ID 选择器（全称：标记选择器和 ID 选择器）（语法：css = tag#id）
* 标记和类选择器（语法：css=tag.class）
* 标记和属性选择器（语法：css=tag[attribute=value]）
* 标记、类和属性选择器（语法：css=tag.class[attribute=value]）
* 标记和内部文本选择器（语法：css=tag:contains("inner text”)）

举例说明：

* css = form#loginForm（标记和 ID 选择器）
* css = input.passfield（标记和类选择器）
* css = input[name="username"]（标记和属性选择器）
* css = input.required[type="text"]（标记、类和属性选择器）
* css = p:contains("下面是表单：")（标记和内部文本选择器）

关于 CSS 选择器的更多信息，请参考 W3C publication。你会在那里找到额外的资料。

**注意**

最有经验的 Selenium 用户推荐 CSS 作为他们的定位策略，因为 CSS 选择器速度大大快于 XPath 并且可以在一个 HTML 文档中找到最复杂的对象。

# 隐式定位器

---
在许多情况下定位器类型可以省略。以下三种情况你可以省略定位器类型：

* 定位器没有明确指定定位策略的默认使用 identifier 定位策略。
* 定位器开始与 // 将使用 XPath 定位策略。
* 定位器开始于 document 将使用 DOM 定位策略。

# 总结

---
1. 有同学会问，是不是 7 种定位器的语法都要记住？
答：如果能记住更好，不能记住，问题也不大。大多数情况 Selenium IDE 录制脚本的时候都替我们生成了定位器参数，不用我们手工编写定位器参数信息。只有个别情况，才需要我们手工编写。当我们真正需要用到的时候，忘了怎么写，再找这个课程案例文件，依葫芦画瓢比划就行。

2. CSS 可以多讲一点儿，CSS 比较直观。

3. XPath 可以用 firebug 帮助生成。注意，firebug 帮助生成的 XPath 都是绝对路径，需要手动修改成相对路径。

4. XPath、DOM 和 CSS 是高级定位方法，语法复杂一些，写错一个括号或者标点符号定位器都无法工作。其他四种语法简单容易掌握。

5. 页面上的同一个元素，可以用多种方法来定位。一般，我们都用最简单有效的方法来定位。ID 、XPath、CSS、DOM，都能定位的情况下，我们肯定优先使用 ID 定位。

教学方法：

---
* 从github上下载代码
* 铺好桌面
* 播放观察代码
* 逐一解释每种代码
* 我还需要重新敲一遍吗？
* 让学生课下：再敲一遍
- 把这个链接中的内容好好研究一下，再考虑录制课程。http://www.guru99.com/locators-in-selenium-ide.html"]")
```
```
