**【前一讲作业的问题】**
1. 增量开发，缩小问题规模，2-3个手机号查询；
2. 在前面的基础上，复制代码，提高代码开发的速度；
3. 如果发现，bug 验证失败，如何确认测出的确实是 bug 呢？用百度手机号查询，或者手机上拨打一下。

假设有一个测试页面，其代码如下所示。

```html
<!DOCTYPE HTML>
<html>
<head>
  <script type="text/javascript">
  function output(resultText){
      document.getElementById('output').childNodes[0].nodeValue=resultText;
    
  }

function show_confirm(){
      var confirmation=confirm("Chose an option.");
      if (confirmation==true){
        output("Confirmed.");
      
      }
      else{
        output("Rejected!");
      
      }
    
}

function show_alert(){
      alert("I'm blocking!");
      output("Alert is gone.");
    
}
function show_prompt(){
      var response = prompt("What's the best web QA tool?","Selenium");
      output(response);
    
}
function open_window(windowName){
      window.open("newWindow.html",windowName);
    
}
    </script>
</head>
<body>

  <input type="button" id="btnConfirm" onclick="show_confirm()" value="Show confirm box" />
  <input type="button" id="btnAlert" onclick="show_alert()" value="Show alert" />
  <input type="button" id="btnPrompt" onclick="show_prompt()" value="Show prompt" />
  <a href="newWindow.html" id="lnkNewWindow" target="_blank">New Window Link</a>
  <input type="button" id="btnNewNamelessWindow" onclick="open_window()" value="Open Nameless Window" />
  <input type="button" id="btnNewNamedWindow" onclick="open_window('Mike')" value="Open Named Window" />

  <br />
  <span id="output">
  </span>
</body>
</html>
```
**【JavaScript 弹窗】总共有三种：警告弹窗，确认弹窗和提示弹窗。都是 JavaScript 函数编程实现的。我们制作了 sample.html 页面，大家可以下载下来运行。**

用户必须响应警告/确认弹窗，并且将焦点移到新开的弹窗上。幸运的是，Selenium 可以处理 JavaScript 弹窗。

在我们开始介绍警告/确认/提示的细节之前，有必要先了解一些共性的基础知识。警告、确认和提示都有下面的一些命令模式：

|  命令   |    描述          |
| ---- | -------- |
| assertFoo(_pattern_)  | 如果模式不匹配弹窗中的文本，抛出错误        |
| assertFooPresent      | 如果没有弹窗，抛出错误                                   |
| assertFooNotPresent   | 如果存在任何弹窗，抛出错误                            |
| storeFoo(_variable_)  | 把弹窗中的文本存储在一个变量中                     |
| storeFooPresent(_variable_) | 把弹窗中的文本存储在一个变量中并返回真或假 |

**当 Selenium 运行时，JavaScript 弹窗将不会出现。**这是因为 JavaScript 的函数调用，在运行时被 Selenium 自己的 JavaScript 代码覆盖。然而，没看到弹窗，并不意味着不用处理它。通过调用 AssertFoo(pattern) 来处理弹窗。如果弹窗显示的断言失败了，测试会暂停并提示类似下面的错误信息：
[error] Error: There was an unexpected Confirmation! [Chose an option.]


# Alerts 警告弹窗
首先介绍警告弹窗，因为这是要处理的最简单的弹窗。首先，在浏览器中打开上面的 HTML 示例文件，单击“显示警告”弹窗按钮。请注意，当你关闭警告弹窗后，页面上会显示“Alert is gone.”。现在，在 Selenium IDE 的录制模式下，重复刚才的操作，注意文本验证命令在关闭弹窗后会自动加到了脚本中。录制好的测试案例将会是下面的样子：

|  命令  |     目标  |   值      |    
| ------------- | ------------------------------------------- | ------------ |
|   open        |    /    |            |     
|  click        |    btnAlert          |              |     
|  assertAlert  |    I'm blocking!     |              |
|  verifyTextPresent  |    Alert is gone.                |              |

你可能会奇怪，自己并没有添加警告弹窗的断言，这些都是 Selenium IDE 为我们做的处理，Selenium IDE 同时也为我们关闭了警告弹窗。如果你去掉断言命令，然后回放脚本，你会收到以下错误：   
[error] Error: There was an unexpected Alert! [I'm blocking!]

你必须在脚本中包含一个断言命令来承认弹窗的存在。

如果你只是想断言警告弹窗出现了，并不关心它包含的文本是什么，这时可以使用 assertAlertPresent。他将返回真或假，当返回假时，停止测试。

# Confirmations 确认弹窗

确认弹窗的行为跟警告弹窗类似，assertConfirmation 和 assertConfirmationPresent 提供与警告弹窗命令类似的功能。默认情况下，弹出确认弹窗后，Selenium 会选择“OK”。试着录制下列操作，在示例页面上点击“显示确认弹窗”的按钮，然后在确认弹窗框中选择 “Cancel” 按钮 ，然后断言输出的文本。录制好的测试案例看上去可能像下面这样：

|  命令                       |                 目标                                                            |   值  |    
| ----------- | ---------------------------------------- | --- |
| open       | /  |  |        
| click | btnConfirm           |     |
| chooseCancelOnNextConfirmation |  |  |
| assertConfirmation | Choose an option.  |           |
| verifyTextPresent  | Rejected  |  |


chooseCancelOnNextConfirmation 函数告诉 Selenium 所有后续的确认应返回 false。它可以通过调用 chooseOkOnNextConfirmation 来重置。

请注意，此测试案例不能正常回放，届时 Selenium 会提示有一个未处理的确认。这是因为 Selenium IDE 录制事件的顺序错误导致的 Click 和 chooseCancelOnNextConfirmation 两个命令的顺序错误。（仔细想想，Selenium 并不知道在你打开一个确认弹窗之前会取消操作）只要交换前后这两个命令的位置，测试案例就会正常工作。

# Prompts 提示弹窗

提示弹窗的行为跟警告弹窗类似，assertPrompt 和 assertPromptPresent 提供与警告弹窗命令类似的功能。默认情况下，弹出的提示信息后，Selenium 将等待你输入数据。试着录制下列操作，在示例页面上点击“显示提示弹窗”的按钮，然后在提示框中输入 Selenium 。录制好的测试案例看上去可能像下面这样：

|  命令                       |                 目标                                                            |   值  |    
| ----------- | ---------------------------------------- | --- |
| open       | /  |  |     
| answerOnNextPrompt | Selenium!           |     |    
| click | id=btnPrompt           |     |
| assertPrompt | What’s the best web QA tool?           |     |
| verifyTextPresent | Selenium!           |     |

如果你在提示弹窗上**点选取消按钮**，你可能会注意到，answerOnNextPrompt 只会显示一个空白的目标。在提示弹窗上 Selenium 对待取消和一个空白的输入是一样的。
