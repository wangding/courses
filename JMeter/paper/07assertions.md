# 如何使用JMeter断言

主张帮助验证测试您的服务器返回 预期 结果。

以下是一些常用的JMeter的断言:
 
   
    响应断言
    持续时间断言
    大小断言
    XML声明
    HTML断言

响应断言 88

![](./images/TestPlanAssertion.png)

响应断言允许您添加模式字符串比较对服务器响应的各个领域。

例如,您发送的用户请求的网站 http://www.google.com 服务器响应。 您可以使用响应断言验证服务器响应 包含 (如预期模式字符串。 “好”)。
持续时间断言

期间断言中的每个收到服务器响应的测试 给定 的时间。 任何响应,花费的时间超过给定的毫秒数(由用户指定)被标记为一个失败的反应。

例如,一个用户请求发送到 www.google.com JMeter和内得到回复 预期 时间5 ms然后测试用例通过,其他测试用例失败。

![](./images/HTTPRequestAssertion.png)

大小断言  

大小断言测试,每个服务器响应包含预期的字节数。 您可以指定大小等于,大于,小于或等于给定的字节数。

JMeter发送用户请求 www.google.com 并获得响应数据包大小不到 预期 一个测试用例通过字节5000字节。 如果其他测试用例失败。
XML声明

的 XML 断言测试响应数据由一个正式正确的XML文档。

![](./images/XMLAssertion.png)

HTML断言

HTML断言允许用户查看HTML语法的响应数据。 这意味着响应数据必须满足HTML语法。

![](./images/HTMLAssertion.png)

Handson——断言

我们将继续在脚本开发的早些时候 教程 。

在该测试中,我们使用 响应断言 比较你期望从www.google.com响应数据包匹配字符串。

这是 路线图 这个测试:

![](./images/FlowAssertion.png)

响应断言控制面板允许您添加模式字符串比较针对各领域的反应。
步骤1)添加响应断言

右键单击 线程GroupA - > 一个加入 - > 一个AssertionsA - - - > 响应断言

![](./images/AddResponseAssertion.png)

响应断言窗格显示如下图:

![](./images/ResponseAssertionPane.png)

测试步骤2)添加模式

当你发送一个请求到Google服务器时,它可能会返回一些 响应代码 如下:

    404年 :服务器错误
    200年 :服务器好了
    302年 Web服务器:重定向到其他页面。 这通常发生在你访问google.com来自美国以外。 谷歌引导国家特定的网站。 如下所示,google.com google.co重定向。 在对印度的用户。

 

![](./images/GoogleRedirect.gif)

 

假设您想要验证web服务器google.com响应代码包含模式 302年,

在 应对现场测试 ,选择响应代码,

响应断言面板上,单击 加入 - >  一个新的空白displayA条目 - > 一个输入302 在测试模式。

![](./images/AssertionPattern.png)

步骤3)添加断言结果

右击线程组, 加入 - > 一个ListenerA - > 一个断言结果

![](./images/AddAssertionResult.png)

![](./images/AssertionResults.png)

步骤4)运行您的测试

点击线程GroupA - > 一个断言结果

当你准备好运行测试,点击 运行 菜单栏上的按钮,或短关键 Ctrl + R。

测试结果将显示在断言结果窗格。 如果谷歌服务器 响应代码 包含了模式 302年 ,测试用例 过去了。 你会看到显示的信息如下:

![](./images/RunYourTestAssertionResult.png)

现在回响应断言面板,你改变了模式测试,从302年到500年。

![](./images/AssertionUpdate.png)

因为谷歌服务器响应代码不包含此模式中,您将看到测试用例 失败的 如下:

![](./images/HTTPResponseAssertionResult.png)

故障排除:

如果你面临的问题在运行上面的场景…… 执行以下操作:

    检查一下你是否通过代理连接到互联网。 如果是,删除代理。
    JMeter的打开一个新实例
    打开 AssertionTestPlan.jmx 在JMeter
    点击线程组- >断言结果
    运行测试
