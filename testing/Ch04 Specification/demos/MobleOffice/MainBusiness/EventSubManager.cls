VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "EventSubManager"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Attribute VB_Ext_KEY = "RVB_UniqueId" ,"3DB2E45102B6"
Attribute VB_Ext_KEY = "RVB_ModelStereotype" ,"Class Module"
'管理系统事件订阅。

Option Explicit

'##ModelId=3DB2EEB102C7
Implements IMaintData

'##ModelId=3DB6A74A014D
Private Const ErrClassName = "MainBusiness.EventSubManager"


'得到指定用户的所有事件订阅
'##ModelId=3DB55437019F
Private Function IMaintData_GetListByUserID(UserID As Long) As Recordset
    Const ErrFuncName = "IMaintData_GetListByUserID"
    On Error GoTo ErrHandler

    Dim rs As ADODB.Recordset
    Set rs = CreateObject("ADODB.Recordset")

    rs.ActiveConnection = dbConnString
    rs.Source = "SELECT * FROM EventSubscribe WHERE UserID=" & UserID
    rs.LockType = adLockReadOnly
    rs.CursorLocation = adUseClient
    rs.CursorType = adOpenStatic

    rs.Open

    Set rs.ActiveConnection = Nothing
    Set IMaintData_GetListByUserID = rs
    
    Exit Function
ErrHandler:
    ErrorLog ErrClassName, ErrFuncName, Err
    Resume Next
End Function


'得到指定事件订阅。
'参数：
'ID: long
'标识
'##ModelId=3DB3F0050143
Private Function IMaintData_GetListByID(UserID As Long) As Recordset
    Const ErrFuncName = "IMaintData_GetListByID"
    On Error GoTo ErrHandler

    Dim rs As ADODB.Recordset
    Set rs = CreateObject("adodb.recordset")
    rs.ActiveConnection = dbConnString
    rs.Source = "SELECT * FROM EventSubscribe WHERE ID=" & UserID
    rs.LockType = adLockBatchOptimistic
    rs.CursorLocation = adUseClient
    rs.CursorType = adOpenStatic
    
    rs.Open
    
    Set rs.ActiveConnection = Nothing
    Set IMaintData_GetListByID = rs

    Exit Function
ErrHandler:
    ErrorLog ErrClassName, ErrFuncName, Err
    Resume Next
End Function


'得到空的事件订阅记录，等待客户端填充数据
'##ModelId=3DB3F0050163
Private Function IMaintData_GetEmpty() As Recordset
    Const ErrFuncName = "IMaintData_GetEmpty"
    On Error GoTo ErrHandler

    Dim rs As Recordset
    Set rs = CreateObject("ADODB.Recordset")

    rs.ActiveConnection = dbConnString
    rs.Source = "SELECT * FROM EventSubscribe WHERE 0=1"
    rs.CursorLocation = adUseClient
    rs.CursorType = adOpenStatic
    rs.LockType = adLockBatchOptimistic
    rs.Open
    rs.AddNew

    Set rs.ActiveConnection = Nothing
    Set IMaintData_GetEmpty = rs

    Exit Function
ErrHandler:
    ErrorLog ErrClassName, ErrFuncName, Err
    Resume Next
End Function


'删除指定事件订阅
'##ModelId=3DB3F0050182
Private Sub IMaintData_Delete(ID As Long)
    Const ErrFuncName = "IMaintData_Delete"
    On Error GoTo ErrHandler

    Dim conn As ADODB.Connection
    Set conn = CreateObject("ADODB.Connection")
    conn.ConnectionString = dbConnString
    conn.Open
    conn.Execute "DELETE FROM EventSubscribe WHERE ID=" & ID
    conn.Close
    Set conn = Nothing

    Exit Sub
ErrHandler:
    ErrorLog ErrClassName, ErrFuncName, Err
    Resume Next
End Sub


'得到所有用户的所有事件订阅。
'参数：
'return: recordset
'返回所有的记录集
'##ModelId=3DB3F00501A1
Private Function IMaintData_GetAll() As Recordset
    Const ErrFuncName = "IMaintData_GetAll"
    On Error GoTo ErrHandler

    Dim rs As ADODB.Recordset
    Set rs = CreateObject("ADODB.Recordset")

    rs.ActiveConnection = dbConnString
    rs.Source = "SELECT * FROM EventSubscribe"
    rs.LockType = adLockReadOnly
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


'保存单条事件订阅
'##ModelId=3DB3F170021F
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
