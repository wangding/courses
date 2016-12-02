VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "DeptManager"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Attribute VB_Ext_KEY = "RVB_UniqueId" ,"3DB2E50D0389"
Attribute VB_Ext_KEY = "RVB_ModelStereotype" ,"Class Module"
'管理部门。

Option Explicit

'##ModelId=3DB37A1B0386
Implements IMaintData

'##ModelId=3DB5D98F005B
Private Const ErrClassName = "MainBusiness.DeptManager"


'未使用。
'##ModelId=3DB554390089
Private Function IMaintData_GetListByUserID(UserID As Long) As Recordset
    '(empty)
End Function


'得到指定部门。
'参数：
'ID: long
'标识
'##ModelId=3DB3F0060078
Private Function IMaintData_GetListByID(UserID As Long) As Recordset
    Const ErrFuncName = "IMaintData_GetListByID"
    On Error GoTo ErrHandler

    Dim rs As ADODB.Recordset
    Set rs = CreateObject("ADODB.Recordset")

    rs.ActiveConnection = dbConnString
    rs.Source = "SELECT * FROM Department WHERE ID=" & UserID
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


'得到一个空的部门记录。待客户端填充
'参数：
'return: Recordset
'##ModelId=3DB3F00600D6
Private Function IMaintData_GetEmpty() As Recordset
    Const ErrFuncName = "IMaintData_GetListByID"
    On Error GoTo ErrHandler

    Dim rs As ADODB.Recordset
    Set rs = CreateObject("ADODB.Recordset")

    rs.CursorLocation = adUseClient
    rs.CursorType = adOpenStatic
    rs.LockType = adLockBatchOptimistic
    rs.Source = "SELECT * FROM Department WHERE 0=1"
    rs.ActiveConnection = dbConnString
    rs.Open
    rs.AddNew

    Set rs.ActiveConnection = Nothing
    Set IMaintData_GetEmpty = rs
    
    Exit Function
ErrHandler:
    ErrorLog ErrClassName, ErrFuncName, Err
    Resume Next
End Function


'删除指定部门。
'参数：
'ID: long
'##ModelId=3DB3F0060105
Private Sub IMaintData_Delete(ID As Long)
    Const ErrFuncName = "IMaintData_Delete"
    On Error GoTo ErrHandler

    'delete a department
    Dim conn As ADODB.Connection, rs As ADODB.Recordset
    Set conn = CreateObject("ADODB.Connection")
    Set rs = CreateObject("ADODB.Recordset")
    conn.ConnectionString = dbConnString
    conn.Open
    
    'if there has anyone in this department, u cant delete any dept.
    Dim strSQL As String
    strSQL = "SELECT ID FROM Users WHERE DeptID=" & ID
    rs.Open strSQL, conn
    If Not rs.EOF Then
        conn.Close
        Set conn = Nothing
        On Error GoTo 0
        Err.Raise vbObjectError, "MainBusiness.DeptManager.IMaintData_Delete", "部门中还存有用户，无法进行删除"
    Else
        conn.Execute "DELETE FROM Department WHERE ID=" & ID
    End If
    conn.Close
    Set conn = Nothing
    
    Exit Sub
ErrHandler:
    ErrorLog ErrClassName, ErrFuncName, Err
    Resume Next
End Sub


'得到所有的部门。
'参数：
'return: recordset
'返回所有的记录集
'##ModelId=3DB3F0060172
Private Function IMaintData_GetAll() As Recordset
    Const ErrFuncName = "IMaintData_GetAll"
    On Error GoTo ErrHandler

    Dim rs As ADODB.Recordset
    Set rs = CreateObject("ADODB.Recordset")

    rs.ActiveConnection = dbConnString
    rs.Source = "SELECT * FROM Department"
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


'保存单条部门记录。
'参数：
'rs: Recordset
'##ModelId=3DB3F171005A
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
