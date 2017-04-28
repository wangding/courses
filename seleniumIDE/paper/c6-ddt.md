# DDT

DDT Data Drive Test，数据驱动测试，也称为参数化。

## DDT 方案一：js 数据文件

---

通过下面的流程控制扩展，实现对 JS 数据文件的循环读取操作。

- [Selenium IDE: Flow Control](https://addons.mozilla.org/en-US/firefox/addon/flow-control/)

## 数据格式

.js 文件中按下面的方式存放测试数据

```javascript
varname = "value"
```

## 安装配置

需要把 .js 数据文件，在 Options 对话框中进行设置，如下图所示：

![js-data](https://raw.githubusercontent.com/wangding/seIDE/master/DDT/images/js-data.png)

### 被测网站：百度

百度：http://www.baidu.com

_测试案例及数据文件_

- [baiduSch-JS.html](baiduSch-JS.html)  
  循环读取 JS 数据文件中的数据，打开百度首页，搜索相应的关键字
- [dataSource.js](dataSource.js)  
  本 .js 格式的数据文件包含了需要在百度上检索的关键字列表
  
## DDT 方案二：CVS 数据文件 

---

通过下面的 js 扩展，实现对 CSV 数据文件读取操作。

- [CSVRead_Selenium-IDE.js](CSVRead_Selenium-IDE.js) 
- [Selenium IDE: Flow Control](https://addons.mozilla.org/en-US/firefox/addon/flow-control/)

### 安装配置

如下图所示：

![csv](https://raw.githubusercontent.com/wangding/seIDE/master/DDT/images/csv.png)

### 被测网站：hosted redmine

hosted redmine：http://www.hostedredmine.com/

_测试案例及数据文件_

- [loginHRedmine-csv.html](loginHRedmine-csv.html)  
  不同账户的用户名和密码，进行登录身份验证。
- [accountData.csv](accountData.csv)  
  用户名和密码列表的数据文件。  
  
## DDT 方案三：XML 数据文件

---
通过下面三个 js 扩展，实现对 XML 数据文件载入和读取操作。

- [user-extensions.js](user-extensions.js)
- [goto_sel_ide.js](goto_sel_ide.js)
- [datadriven.js](datadriven.js) 

### 安装配置

如下图所示：

![options](https://raw.githubusercontent.com/wangding/seIDE/master/DDT/images/options.png)

### 文件格式

XML 数据文件格式如下所示：

```xml
<testdata>
  <test varname="value" />
  <test varname="value" />
  <test varname="value" />
</testdata>
```

### 被测网站：百度

百度：http://www.baidu.com

_测试案例及数据文件_

- [baiduSearch.html](baiduSearch.html)  
  打开百度首页，搜索若干关键字
- [baiduSchData.xml](baiduSchData.xml)  
  本 XML 格式的数据文件包含了需要在百度上检索的关键字列表

### 被测网站：51CTO 学院

51CTO学院：http://edu.51cto.com

_测试案例及数据文件_

- [studyLens.html](studyLens.html)  
  统计学生学习总时长和平均时长
- [studentData.xml](studentData.xml)   
  本 XML 格式的数据文件包含了学生学习记录的 URL 地址列表 

### 被测网站：hosted redmine

hosted redmine：http://www.hostedredmine.com/

_测试案例及数据文件_

- [loginHRedmine.html](loginHRedmine.html)  
  用不同账户的用户名和密码，进行登录身份验证。  
- [accountData.xml](accountData.xml)  
  用户名和密码的列表。


## DDT 方案四：JSON 数据文件

---
【暂时没找到资料】
