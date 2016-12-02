VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "Logon"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Attribute VB_Ext_KEY = "RVB_UniqueId" ,"3DB37497002F"
Attribute VB_Ext_KEY = "RVB_ModelStereotype" ,"Class Module"
Option Explicit

'##ModelId=3DB6A74702EE
Private Const ErrClassName = "MainBusiness.Logon"


'验证用户身份。
'参数：
'User: Recordset
'用户信息的记录集
'Returns: Boolean
'返回用户身份是否合法
'注意：
'User同时用来返回合法用户的完全信息。
'##ModelId=3DB374DD030C
Public Function Verify(ByRef User As Recordset) As Boolean
    Const ErrFuncName = "Verify"
    On Error GoTo ErrHandler

    '用户名和口令
    Dim ln As String, pwd As String, IPAddr As String
    ln = Trim(User!LogonName)
    pwd = Trim(User!Password)
    IPAddr = Trim(User!IPAddr)
    
    Dim rs As ADODB.Recordset
    Set rs = CreateObject("ADODB.Recordset")
    
    rs.ActiveConnection = dbConnString
    rs.Source = "SELECT * FROM Users WHERE LogonName='" & ln & "'"
    rs.LockType = adLockBatchOptimistic
    rs.CursorLocation = adUseClient
    rs.CursorType = adOpenStatic

    rs.Open
    Set rs.ActiveConnection = Nothing

   If rs.EOF Then
        Verify = False  '用户帐户不存在
        rs.Close
        Set rs = Nothing
        Exit Function
    End If
    
    If rs!Password <> pwd Then
        Verify = False  '用户口令不正确
        rs.Close
        Set rs = Nothing
        Exit Function
    End If
    
    If rs!Permission > 1 And rs!Permission < 8 Then '用户具有部门群发权限
        Dim rs2 As ADODB.Recordset
        Set rs2 = CreateObject("ADODB.Recordset")
   
        ' check IPAddr Binding
        rs2.ActiveConnection = dbConnString
        rs2.Source = "SELECT * FROM Configuration WHERE CFGName='IPBinding'"
        rs2.LockType = adLockReadOnly
        rs2.CursorLocation = adUseClient
        rs2.CursorType = adOpenStatic
        
        rs2.Open
        If (rs2!Value = "true") Then    '系统设置了IP地址绑定策略
            If rs!IPAddr <> IPAddr Then '用户登录的IP地址不正确
                Verify = False
                rs.Close
                rs2.Close
                Set rs = Nothing
                Set rs = Nothing
                
                Exit Function
            End If
        End If
    End If
        
    Set User = rs
    Verify = True
    
    
    Exit Function
ErrHandler:
    ErrorLog ErrClassName, ErrFuncName, Err
    Resume Next
End Function
