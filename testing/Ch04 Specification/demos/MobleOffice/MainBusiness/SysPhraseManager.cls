VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "SysPhraseManager"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Attribute VB_Ext_KEY = "RVB_UniqueId" ,"3DB2E45F0099"
Attribute VB_Ext_KEY = "RVB_ModelStereotype" ,"Class Module"
'管理系统常用语。

Option Explicit

'##ModelId=3DB379F802AD
Implements IMaintData

'##ModelId=3DB6A745002E
Private Const ErrClassName = "MainBusiness.SysPhraseManager"


'未使用
'##ModelId=3DB5543702F3
Private Function IMaintData_GetListByUserID(UserID As Long) As Recordset
    '(empty)
End Function


'得到一条系统常用语。
'参数：
'ID: long
'标识
'##ModelId=3DB3EFFC001B
Private Function IMaintData_GetListByID(UserID As Long) As Recordset
    Const ErrFuncName = "IMaintData_GetListByID"
    On Error GoTo ErrHandler

    Dim rs As ADODB.Recordset
    Set rs = CreateObject("ADODB.Recordset")
    rs.ActiveConnection = dbConnString
    rs.Source = "SELECT * FROM SysPhrase WHERE ID=" & UserID
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


'得到空的系统常用语记录，等待客户端填充。
'##ModelId=3DB3EFFC0098
Private Function IMaintData_GetEmpty() As Recordset
    Const ErrFuncName = "IMaintData_GetEmpty"
    On Error GoTo ErrHandler

    Dim rs As Recordset
    Set rs = CreateObject("ADODB.Recordset")

    rs.ActiveConnection = dbConnString
    rs.Source = "SELECT * FROM SysPhrase WHERE 0=1"
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


'删除指定系统常用语
'##ModelId=3DB3EFFC00C7
Private Sub IMaintData_Delete(ID As Long)
    Const ErrFuncName = "IMaintData_Delete"
    On Error GoTo ErrHandler

    Dim conn As ADODB.Connection
    Set conn = CreateObject("ADODB.Connection")
    conn.ConnectionString = dbConnString
    conn.Open
    conn.Execute "DELETE FROM SysPhrase WHERE ID=" & ID
    conn.Close
    Set conn = Nothing

    Exit Sub
ErrHandler:
    ErrorLog ErrClassName, ErrFuncName, Err
    Resume Next
End Sub


'得到所有的系统常用语。
'参数：
'return: recordset
'返回所有的记录集
'##ModelId=3DB3EFFC0163
Private Function IMaintData_GetAll() As Recordset
    Const ErrFuncName = "IMaintData_GetAll"
    On Error GoTo ErrHandler

    Dim rs As ADODB.Recordset
    Set rs = CreateObject("ADODB.Recordset")

    rs.ActiveConnection = dbConnString
    rs.Source = "SELECT * FROM SysPhrase"
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


'保存一条系统常用语
'##ModelId=3DB3F169031A
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
