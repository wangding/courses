VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "ScheduleManager"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Attribute VB_Ext_KEY = "RVB_UniqueId" ,"3DB2E4350142"
Attribute VB_Ext_KEY = "RVB_ModelStereotype" ,"Class Module"
'管理日程安排。

Option Explicit

'##ModelId=3DB2F11B03B3
Implements IMaintData

'##ModelId=3DB6A746001B
Private Const ErrClassName = "MainBusiness.ScheduleManager"


'得到指定用户的所有日程安排
'##ModelId=3DB5543602CA
Private Function IMaintData_GetListByUserID(UserID As Long) As Recordset
    Const ErrFuncName = "IMaintData_GetListByUserID"
    On Error GoTo ErrHandler

    Dim rs As ADODB.Recordset
    Set rs = CreateObject("ADODB.Recordset")

    rs.ActiveConnection = dbConnString
    rs.Source = "SELECT * FROM Schedule WHERE UserID=" & UserID
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


'得到一条日程安排。
'参数：
'ID: long
'标识
'##ModelId=3DB3EFFD0386
Private Function IMaintData_GetListByID(UserID As Long) As Recordset
    Const ErrFuncName = "IMaintData_GetListByID"
    On Error GoTo ErrHandler

    Dim rs As ADODB.Recordset
    Set rs = CreateObject("adodb.recordset")
    rs.ActiveConnection = dbConnString
    rs.Source = "SELECT * FROM Schedule WHERE ID=" & UserID
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


'得到空的日程安排，等待客户端填充
'##ModelId=3DB3EFFE000C
Private Function IMaintData_GetEmpty() As Recordset
    Const ErrFuncName = "IMaintData_GetEmpty"
    On Error GoTo ErrHandler

    Dim rs As Recordset
    Set rs = CreateObject("ADODB.Recordset")

    rs.ActiveConnection = dbConnString
    rs.Source = "SELECT * FROM Schedule WHERE 0=1"
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


'删除指定日程安排
'##ModelId=3DB3EFFE003A
Private Sub IMaintData_Delete(ID As Long)
    Const ErrFuncName = "IMaintData_Delete"
    On Error GoTo ErrHandler

    Dim conn As ADODB.Connection
    Set conn = CreateObject("ADODB.Connection")
    conn.ConnectionString = dbConnString
    conn.Open
    conn.Execute "DELETE FROM Schedule WHERE ID=" & ID
    conn.Close
    Set conn = Nothing

    Exit Sub
ErrHandler:
    ErrorLog ErrClassName, ErrFuncName, Err
    Resume Next
End Sub


'未使用
'得到所有的记录集。
'参数：
'return: recordset
'返回所有的记录集
'##ModelId=3DB3EFFE0079
Private Function IMaintData_GetAll() As Recordset
    '(empty)
End Function


'保存一条日程安排
'##ModelId=3DB3F16B0183
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
