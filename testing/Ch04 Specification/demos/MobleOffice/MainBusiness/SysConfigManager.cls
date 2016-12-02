VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "SysConfigManager"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Attribute VB_Ext_KEY = "RVB_UniqueId" ,"3DB2E4F900D4"
Attribute VB_Ext_KEY = "RVB_ModelStereotype" ,"Class Module"
'管理系统配置。

Option Explicit

'##ModelId=3DB37B3A01B8
Implements IMaintData

'##ModelId=3DB6A745025E
Private Const ErrClassName = "MainBusiness.SysConfigManager"


'未使用
'##ModelId=3DB554380309
Private Function IMaintData_GetListByUserID(UserID As Long) As Recordset
    '(empty)
End Function


'未使用
'##ModelId=3DB3EFFD003A
Private Function IMaintData_GetListByID(UserID As Long) As Recordset
    '(empty)
End Function


'未使用
'##ModelId=3DB3EFFD0089
Private Function IMaintData_GetEmpty() As Recordset
    '(empty)
End Function


'未使用
'##ModelId=3DB3EFFD00A8
Private Sub IMaintData_Delete(ID As Long)
    '(empty)
End Sub


'得到所有的系统配置。
'参数：
'return: recordset
'返回所有的记录集
'"HotWords":   "true"    '是否过滤敏感词汇
'"HotAction":  "1"       '发现敏感词后的动作
'"MsgLen":     "60"      '单发短信长度
'"MsgsLen":    "60"      '群发短信长度
'"IPBinding":  "true"    'IP地址是否绑定
'"EmlFilter":  ""        '邮件过滤配置
'"EmlNtfWait": "5"       '邮件提醒间隔
'##ModelId=3DB3EFFD00F6
Private Function IMaintData_GetAll() As Recordset
    Const ErrFuncName = "IMaintData_GetAll"
    On Error GoTo ErrHandler

    Dim rs As ADODB.Recordset
    Set rs = CreateObject("ADODB.Recordset")

    rs.ActiveConnection = dbConnString
    rs.Source = "SELECT * FROM Configuration"
    rs.LockType = adLockBatchOptimistic
    rs.CursorLocation = adUseClient
    rs.CursorType = adOpenStatic

    rs.Open

    Set rs.ActiveConnection = Nothing
    Set IMaintData_GetAll = rs
    
    Exit Function
ErrHandler:
    ErrorLog ErrClassName, ErrFuncName, Err
    Resume Next
End Function


'保存单条系统配置
'##ModelId=3DB3F16A01A3
Private Sub IMaintData_Save(rs As Recordset)
    Const ErrFuncName = "IMaintData_Save"
    On Error GoTo ErrHandler
    
    rs.ActiveConnection = dbConnString
    rs.UpdateBatch
    
    Exit Sub
ErrHandler:
    ErrorLog ErrClassName, ErrFuncName, Err
    Resume Next
End Sub
