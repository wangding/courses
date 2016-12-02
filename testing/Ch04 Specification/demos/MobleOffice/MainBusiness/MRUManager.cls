VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "MRUManager"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Attribute VB_Ext_KEY = "RVB_UniqueId" ,"3DB3780803E7"
Attribute VB_Ext_KEY = "RVB_ModelStereotype" ,"Class Module"
Option Explicit


'##ModelId=3DB3781C033B
Implements IMaintData

'##ModelId=3DB6A74603A0
Private Const ErrClassName = "MainBusiness.MRUManager"


'得到指定用户的所有 MRU
'##ModelId=3DB5543903AA
Private Function IMaintData_GetListByUserID(UserID As Long) As Recordset
    Const ErrFuncName = "IMaintData_GetListByUserID"
    On Error GoTo ErrHandler

    Dim rs As ADODB.Recordset
    Set rs = CreateObject("ADODB.Recordset")

    rs.ActiveConnection = dbConnString
    rs.Source = "SELECT TOP 10 * FROM MRUMobile WHERE UserID=" & UserID & " ORDER BY Times DESC, LastTime"
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


'未使用
'参数：
'ID: long
'标识
'##ModelId=3DB3EFFF0338
Private Function IMaintData_GetListByID(UserID As Long) As Recordset
    '(empty)
End Function


'未使用
'##ModelId=3DB3EFFF0376
Private Function IMaintData_GetEmpty() As Recordset
    '(empty)
End Function


'未使用
'##ModelId=3DB3EFFF0396
Private Sub IMaintData_Delete(ID As Long)
    '(empty)
End Sub


'未使用
'得到所有人的所有 MRU。
'参数：
'return: recordset
'返回所有的记录集
'##ModelId=3DB3F000000B
Private Function IMaintData_GetAll() As Recordset
    '(empty)
End Function


'未使用
'##ModelId=3DB3F16C025E
Private Sub IMaintData_Save(rs As Recordset)
    '(empty)
End Sub


'根据发送短信时的结果修改 MRU
'##ModelId=3DB83DFD0117
Public Sub UpdateMRU(UserID As Long, Mobile As String)
    Const ErrFuncName = "UpdateMRU"
    On Error GoTo ErrHandler

    Dim strSql As String

    'check if this mobile in this user's MRU
    Dim conn As ADODB.Connection, rs As ADODB.Recordset
    Set conn = CreateObject("ADODB.Connection")
    Set rs = CreateObject("ADODB.Recordset")
    conn.Open dbConnString
    rs.Open "SELECT ID FROM MRUMobile WHERE UserID=" & UserID & " AND MobileNumber=" & Mobile, conn, adOpenStatic, adLockReadOnly
    If rs.EOF Then
        strSql = "INSERT INTO MRUMobile(UserID, MobileNumber) VALUES(" & UserID & ", " & Mobile & ")"
    Else
        strSql = "UPDATE MRUMobile SET Times=Times+1 WHERE UserID=" & UserID & " AND MobileNumber='" & Mobile & "'"
    End If
    rs.Close
    Set rs = Nothing
    
    conn.Execute strSql
    conn.Close
    Set conn = Nothing

    Exit Sub
ErrHandler:
    ErrorLog ErrClassName, ErrFuncName, Err
    Resume Next
End Sub
