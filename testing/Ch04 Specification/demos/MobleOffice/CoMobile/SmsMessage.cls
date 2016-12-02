VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "SmsMessage"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit
Private Const ErrClassName = "CoMobile.SmsMessage"

'这个函数仅仅作为调用方法扩充
'日程提醒组件需要这个方法
'需要引用的 com: 1. MainBusiness 2. ADO 2.7
Public Sub Send(ByVal UserID As Long, ByVal RecName As String, ByVal RecMobileNumber As String, ByVal Message As String, ByVal IPAddr As String)
    Dim rs As New ADODB.Recordset

    rs.Fields.Append "UserID", adInteger, 4
    rs.Fields.Append "RecName", adVarChar, 20
    rs.Fields.Append "RecMobileNumber", adVarChar, 50
    rs.Fields.Append "Message", adVarChar, 70
    rs.Fields.Append "IPAddr", adVarChar, 50

    rs.Open
    rs.AddNew
    rs!UserID = UserID
    rs!RecName = RecName
    rs!RecMobileNumber = RecMobileNumber
    rs!Message = Message
    rs!IPAddr = IPAddr

    SendMessage rs
    
    rs.Close
    
    Set rs = Nothing
End Sub


'用于发送短信
'传来的 rs 在客户端构建，手机号码段可以包含多个手机号码
'##ModelId=3DB83DFF020A
Private Sub SendMessage(fcdrs As Recordset)
    Const ErrFuncName = "SendMessage"
    On Error GoTo ErrHandler

   
    'init database connection
    Dim conn As Connection
    Set conn = CreateObject("ADODB.Connection")
    
    conn.Open "File Name=" & Environ("SystemRoot") & "\system32\MobileOffice\db.udl"
        
    Dim rs As Recordset
    Set rs = CreateObject("ADODB.Recordset")
    Set rs.ActiveConnection = conn
    rs.Source = "SELECT * FROM SendHistory WHERE 0=1"
    rs.CursorLocation = adUseClient
    rs.CursorType = adOpenStatic
    rs.LockType = adLockBatchOptimistic
    
    rs.Open
 
    '填写发送表——发送短信
    rs.AddNew
    rs!UserID = fcdrs!UserID
    rs!IPAddr = Trim(fcdrs!IPAddr)
    rs!RecName = Trim(fcdrs!RecName)
    rs!RecMobileNumber = Trim(fcdrs!RecMobileNumber)
    rs!Message = fcdrs!Message & " -日程提醒"
    rs!IsIncludeHotWord = 0

    'send message to mobile -temp
    rs.MoveFirst
    
    Dim strSenderMobileNum As String, strPassword As String
    strSenderMobileNum = "13582027613"
    strPassword = "7751580"
    
    Dim http As New MSXML2.XMLHTTP30
    
    Do Until rs.EOF
        http.Open "GET", _
            "http://messenger.onest.net/sendmsg.asp?mobile=" & rs!RecMobileNumber & _
            "&msg=" & rs!Message & "&chargemobile=" & strSenderMobileNum & _
            "&pwd=" & strPassword, False
        
        http.Send
        
        rs.MoveNext
    Loop
    
    'update and close database
    rs.UpdateBatch
    rs.Close
    Set rs = Nothing
    conn.Close
    Set conn = Nothing
    
    '-temp send
    Set http = Nothing
    
    Exit Sub
ErrHandler:
    ErrorLog ErrClassName, ErrFuncName, Err
    Resume Next
End Sub

Private Sub ErrorLog(Module As String, Func As String, e As ErrObject)
    Open Environ("SystemRoot") & "\system32\MobileOffice\Error.log" For Append Access Write As #1
    Print #1, "错误发生时间: " & Date & " " & Time
    Print #1, "　　错误模块: " & e.Source
    Print #1, "　　错误位置: [Module]" & Module & " [Function]" & Func
    Print #1, "　　错误内容: [" & e.Number & "] " & e.Description
    Print #1,
    Close #1
End Sub
