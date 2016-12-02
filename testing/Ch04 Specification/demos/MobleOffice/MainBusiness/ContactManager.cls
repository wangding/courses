VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "ContactManager"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Attribute VB_Ext_KEY = "RVB_UniqueId" ,"3DB2E4200223"
Attribute VB_Ext_KEY = "RVB_ModelStereotype" ,"Class Module"
'管理联系人。

Option Explicit

'##ModelId=3DB2EBE800F0
Implements IMaintData

'##ModelId=3DB55378032B
Private Const ErrClassName = "MainBusiness.ContactManager"


'得到指定联系人 ID 的记录。
'参数：
'ID: long
'标识
'##ModelId=3DB3F0070069
Private Function IMaintData_GetListByID(UserID As Long) As Recordset
    Const ErrFuncName = "IMaintData_GetListByID"
    On Error GoTo ErrHandler
    
    Dim rs As ADODB.Recordset
    Set rs = CreateObject("adodb.recordset")
    rs.ActiveConnection = dbConnString
    rs.Source = "SELECT * FROM Contacts WHERE ID=" & UserID
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


'得到指定用户的所有联系人
'##ModelId=3DB55436005D
Private Function IMaintData_GetListByUserID(UserID As Long) As Recordset
    Const ErrFuncName = "IMaintData_GetListByUserID"
    On Error GoTo ErrHandler

    Dim rs As ADODB.Recordset
    Set rs = CreateObject("adodb.recordset")
    rs.ActiveConnection = dbConnString
    rs.Source = "SELECT * FROM Contacts WHERE UserID=" & UserID
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


'得到空的联系人记录。(等待客户端填充)
'##ModelId=3DB3F00701DF
Private Function IMaintData_GetEmpty() As Recordset
    Const ErrFuncName = "IMaintData_GetEmpty"
    On Error GoTo ErrHandler

    Dim rs As Recordset
    Set rs = CreateObject("ADODB.Recordset")

    rs.ActiveConnection = dbConnString
    rs.Source = "SELECT * FROM Contacts WHERE 0=1"
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


'根据联系人 ID 删除一个联系人
'##ModelId=3DB3F007025C
Private Sub IMaintData_Delete(ID As Long)
    Const ErrFuncName = "IMaintData_Delete"
    On Error GoTo ErrHandler

    Dim conn As ADODB.Connection
    Set conn = CreateObject("ADODB.Connection")
    conn.ConnectionString = dbConnString
    conn.Open
    conn.Execute "DELETE FROM Contacts WHERE ID=" & ID
    conn.Close
    Set conn = Nothing

    Exit Sub
ErrHandler:
    ErrorLog ErrClassName, ErrFuncName, Err
    Resume Next
End Sub


'未使用
'获得全局通讯簿联系人 UserManager.GetUserInGL() (搞不懂为什么)
'##ModelId=3DB3F00703A5
Private Function IMaintData_GetAll() As Recordset
    '(empty)
End Function


'保存指定联系人信息
'##ModelId=3DB3F17102BB
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
