JavaScript 可以用于两种类型的 Selenese 参数：**脚本参数和非脚本参数（通常是表达式参数）**。很多情况下，你可能需要访问或操作 Selenese 参数中的JavaScript 代码片段中的变量。

**【回顾 学习时长统计的脚本，里面有 javascript 参数的使用。】**

**测试用例中的所有变量被存储在 JavaScript 关联数组中。关联数组用字符串来索引而不是用连续的数字索引。存放测试案例变量的关联数组的变量名是 storedVars。当你想在 JavaScript 代码片段中访问或操作变量时，你需要通过 storedVars['yourVariableName'] 来访问。**

# 使用 JavaScript 脚本参数

---
有些 Selenese 命令会指定 script 脚本参数，包括 assertEval, verifyEval, storeEval, waitForEval。这些参数没有需要特殊的语法要求。Selenium IDE 用户只需放置一个 JavaScript 代码片段的到适当的字段，通常是 Target 目标字段（因为脚本参数通常是第一或唯一的参数）。

下面的例子说明了如何使用 JavaScript 代码片段来执行一个简单的数值计算：

|  命令      |                 目标        |   值  |    
| ----------- | ---------------------------------------- | --- |
| store       | Edith Wharton |  name   |     
| storeEval | storedVars[‘name’].toUpperCase()   | uc    |
| storeEval | storedVars[‘name’].toLowerCase()   |  lc    |

下一个示例演示了如何在 JavaScript 代码片段中调用方法，示例代码中，JavaScript 字符串对象调用了 toUpperCase 方法和 toLowerCase 方法。

# 使用非脚本参数

---
JavaScript 脚本还可以用于生成参数的值，即使没有指定参数是 script 脚本类型。**而且几乎可以用在任何参数上，这是重点（见参数化定位器参数的脚本）。**

**在这种情况下，通过使用特殊的语法，即整个参数值由 javascript 做前缀，在花括号中放置代码片段，例如：javascript { * 这里是你的代码 *  }。**

下面的例子中在 type 命令的第二个 value 值参数中通过 JavaScript 代码使用这个特殊语法产生参数值：

|  命令      |                 目标                          |   值  |    
| ----------- | ---------------------------------------- | --- |
| store       | league of nations |  searchString   |     
| type | q           | javascript{storedVars[‘searchString’].toUpperCase()}    |
