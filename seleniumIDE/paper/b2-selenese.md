【承前启后】前面课程对Selenium 的常用命令做了详细讲解，可能百分之七八十的脚本都依赖这些命令。其实，Selenium给我们准备了非常丰富的命令，这七个常用命令只是很小的一部分，只是庞大冰山的一个小角。

Selenium 提供了一组丰富的命令，以几乎任何你可以想象的方式，完全测试您的web应用。
  
例如，利用Selenese，你可以依据UI元素的HTML标记来测试该UI元素在页面上是否存在，测试页面上的具体内容，测试失效链接，输入字段，下拉列表选择，待提交的表单，表格数据，等等。此外，Selenium命令还能测试窗口大小，鼠标位置、alerts信息、Ajax功能，弹出窗口，事件处理，以及许多其他web应用程序的特性。等等。

通常命令被称为selenese。Selenese是用来运行测试的一个命令的集合，这些命令的序列是一个测试脚本，这些命令基本上可以说构造了一个测试语言。

因为Selenium IDE的自动化测试脚本都是由命令构成，所以掌握命令是最重要的内容。Selenium 命令总共有534个命令，所有的命令我们即使不能逐一讲解，但是也要把一些大类过一下。当然建议大家一定要找时间逐一浏览一下每个命令。

这些命令分成三个大类：Action 动作，Accessors 访问器和Assertions 判断。

* Action 动作类命令，一般操作应用程序的状态。他们做的事情，类似：点击这个链接、选择那个选项。如果动作失败，或者有错误，当前测试会停止执行。

许多动作会增加一个 AndWait 后缀，如：clickAndWait。这个后缀告诉selenium 动作将会导致浏览器发送请求到服务器，而selenium应该等待一个新页面被完全加载。

* Accessors 访问器类命令检查应用程序的状态，并将结果存储在变量中，如：storeTitle。他们也用于自动生成断言。

* Assertions 判断类命令很像访问器，但他们验证应用程序的状态符合预期的样子。例如：包括"make sure the page title is X" 和"verify that this checkbox is checked"。

所有Selenium 判断类命令又分三种使用方式：assert 断言类，verify 验证类，和waitFor 等待类。例如，您可以assertText，verifyText和waitForText。当一个assert失败时，测试会中止。当一个verify失败时，测试将继续执行，记录下失败信息。这允许一个单一assert以确保应用程序在正确的页面上，紧随其后的是一群verify 判断来测试表单字段值，标签，等等。

waitFor命令等待一些条件发生（在测试Ajax应用程序时，非常有用）。如果条件已经是正确的，他们马上会成功。如果条件在超时设置的范围内不成立，他们将失败并停止测试。

**补充**
命令的参数，只有三种情况（没有第四种）分别是：无参数，一个参数和两个参数。

有几种重要的参数类型：定位器，字符串模式以及js脚本参数。关于定位器的话题，我们在后面课程详细讲解。

【案例：百度】

![baidu.png](http://upload-images.jianshu.io/upload_images/3058932-274e485cc3f91d94.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

【教学策略】
1. 可以在command fild 字段上通过下拉列表浏览所有命令，可以对命令大致分类，例如断言类的，验证类的，等等。每一类挑几个典型的命令来演示一下用法。
2. **captureEntire PageScreenshot** 演示一下，这个神奇而强大的截屏功能
3. storeBodyText
4. storeHtmlSource   store 命令结合echo命令
