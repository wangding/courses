： # 运行测试案例

Run a Test Case
d
点击Run按钮显示当前运行测试用例。

Run a Test Suite

单击运行按钮运行当前加载的测试套件中的所有测试用例。

Stop and Start

暂停按钮可以用来阻止它运行时测试用例。这个按钮的图标更改指示恢复按钮。继续点击简历。

Stop in the Middle

你可以设置一个断点测试用例导致它停止在一个特定的命令。这是用于调试您的测试用例。要设置一个断点,选择一个命令,单击右键,从上下文菜单中选择Toggle breakpoint。

Start from the Middle

你可以告诉IDE运行从一个特定的命令开始中间的测试用例。这也是用于调试。设置一个曾经繁荣,选择命令,单击右键,从上下文菜单中选择设置/清除起点。

Run Any Single Command

双击任何一个命令来运行它。这是有用的在写一个命令。它允许您立即测试你构建一个命令,当你不确定它是正确的。您可以双击它,看它是否运行正确。这也可以从上下文菜单。

# 使用BaseURL在不同域内运行测试案例

Selenium IDE窗口顶部的Base URL字段对于测试用例运行在不同域时非常有用。假设一个名为http://news.portal.com 的网站有一个名为http://beta.news.portal.com 的内部测试网站。针对这些网站的任何测试用例，都是以open 命令开始的，open命令指定一个相对URL路径作为参数，而不是绝对URL路径（绝对路径是从一个协议，比如http:或https:开始的）。Selenium IDE通过将open命令的参数追加到Base URL后面，来创建一个绝对的URL路径。例如，下面的测试用例将会运行在http://news.portal.com/about.html


![Base URL](http://upload-images.jianshu.io/upload_images/3058932-4ccee1a36df50b63.png)


同样的测试案例修改一下 Base URL设置就可以运行在http://beta.news.portal.com/about.html

![Base URL2](http://upload-images.jianshu.io/upload_images/3058932-76c652cf2e2712fe.png)
