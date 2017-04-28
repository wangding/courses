上次课程我们讲了Selenese，对Selenium IDE的534个命令有一个大致的分类和了解，这个大纲很重要，俗话说，提纲挈领，纲举目张，把这个纲领掌握后，每个命令以及相应的参数，估计大家一看资料大致都能很快把握住重点，能很容易并且很快速的掌握每个命令的用法。

Selenium的命令虽然很多，但是很简单，他们包括命令名称和两个参数。例如：

```
verifyText  //div//a[2]   Login
```

参数并不总是必需的，这取决于命令。在某些情况下，两个参数都是必需的，有些情况只需要一个参数，还有些情况可能不需要任何参数。下面有几个例子：

```
goBackAndWait        
verifyTextPresent   Welcome to My Home Page
type                   id=phone                   13582027613
type                 id=address1               ${myVariableAddress}
```

命令的参数虽各不相同，但是最常见的参数类型有下面四种：

* locatoer 定位器用来识别页面中的UI元素。
* pattern 文本模式用来验证或断言页面出现预期的内容。
* variable 变量用来在文本输入域中输入文本或在选项列表中选择一个选项。
* JavaScript类型的参数

定位器、文本模式，变量和JavaScript这四种参数类型，我们基本上都接触过到了。只是没有详细、专门的讲解。上一次课我们讲解Selenese命令的时候，将534个Selenese命令分成了3大类，专用制作了一个百度的案例来讲解访问器这一类命令，访问器类的命令将数据存储到变量中。

在自动化测试脚本的开头，可以使用Selenium变量来存储常数。另外，在数据驱动测试中，Selenium变量可来从命令行或者从其他程序或者从一个文件，传递数据给被测程序。

普通store命令是所有访问器命令中最基本的命令，可以把一个简单的常数值存放到变量中。它需要两个参数，被存储文本值和Selenium变量。使用标准的变量命名约定的字母数字作为变量的名称。

Selenium IDE中运行的脚本，会存储在一个HTML格式的文本文件中。他被包含在一个三列的HTML表格中。第一列是Selenium command（命令），第二个target（目标），最后一列是value（值）。第二列和第三列可能不需要取决于所选的Selenium命令，但他们应该存在。每个表格行代表一个新的Selenium命令。这是一个测试的例子，打开一个页面，断言页面标题，然后验证页面上的一些内容：

```
<table>
    <tr><td>open</td><td>/download/</td><td></td></tr>
    <tr><td>assertTitle</td><td></td><td>Downloads</td></tr>
    <tr><td>verifyText</td><td>//h2</td><td>Downloads</td></tr>
</table>
```
在浏览器中呈现为一个表这样子如下：

```
open  /download/   
assertTitle       Downloads
verifyText  //h2  Downloads
```

Selenese HTML语法可以用来编写和运行测试，而无需编程语言的知识。有了selenese 的基本知识和selenium IDE你可以快速制作和运行测试案例。

测试套件

---
测试套件是测试用例的集合，测试用例在Selenium IDE的左侧窗格中进行管理。通过点击一排带小点的分隔条，可以手动的打开和关闭左侧面板。通常会在一个测试套件将所有的测试作为一个连续的批处理作业运行。

当用户通过文件菜单打开一个现有的测试套件或新建一个测试用例时，测试套件面板会自动打开。在后一种情况下，新建的测试用例将立即出现在以前的测试用例下面。

通过“文件”->“添加测试用例”菜单项，Selenium IDE也支持加载已有的测试用例。这允许您将现有测试用例添加到一个新的测试套件中。

一个测试套件文件是一个HTML文件，其中包含一个单列的表格。中每行中的单元格中包含了一个测试用例文件的链接。下面是一个包含了四个测试用例的测试套件的例子：
  
```





Suite Of Tests
Login
Test Searching for Values
Test Save



```

类似上面这个文件这将允许Selenium IDE逐一运行测试案例。 　　 
  
测试套件还可以用Selenium RC来维护。通过编程，可以有多种实现方式。如果使用Selenium RC和Java，通常使用Junit来维护一个测试套件。此外，如果使用C#语言，Nunit可以用来维护测试套件。如果使用解释型语言像Python，Selenium RC需要添加一些简单的编程，来建立一个测试套件。Since the whole reason for using Selenium-RC is to make use of programming logic for your testing this usually isn’t a problem.

【授课策略】
* 讲解本课时，将脚本平铺展示，如下面的截图所示。IDE有表格视图和源视图，HTML的脚本语法，网页呈现的就是表格，表格的一行就是一个命令，所有的命令自上而下构成了一个自动化测试脚本。而这个HTML文件的源文件对应源视图。

![自动化测试脚本的脚本语法.png](http://upload-images.jianshu.io/upload_images/3058932-432b543ec0d07077.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

* 测试套件文件和测试案例文件存放的路径不应该轻易改变，因为测试套件文件中有测试案例文件的存放路径信息。文件存放位置改变后，记着更改测试套件中的路径信息。

* 再谈，表格视图和源视图，两种视图都非常有用。源视图适合重复，大量，快速修改代码。例如，作业查看脚本的制作。表格视图因为有命令补全，所以适合小范围的脚本添加和修改。

演示，用git获取51cto查看作业的一个历史版本，在vim中批量快速修改脚本，把绝对路改成相对路径。
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
