Attribute VB_Name = "Global"
Attribute VB_Ext_KEY = "RVB_UniqueId" ,"3DB553790324"
Attribute VB_Ext_KEY = "RVB_ModelStereotype" ,"Module"
Option Explicit

'Database Connection String
'##ModelId=3DB5BE100013
Public dbConnString As String

'Error process function
'##ModelId=3DB55379039A
Public Sub ErrorLog(Module As String, Func As String, e As ErrObject)
    Open Environ("SystemRoot") & "\system32\MobileOffice\Error.log" For Append Access Write As #1
    Print #1, "错误发生时间: " & Date & " " & Time
    Print #1, "　　错误模块: " & e.Source
    Print #1, "　　错误位置: [Module]" & Module & " [Function]" & Func
    Print #1, "　　错误内容: [" & e.Number & "] " & e.Description
    Print #1,
    Close #1
End Sub


'##ModelId=3DB5537903B8
Public Sub Main()
    'init database connection
    Open Environ("SystemRoot") & "\system32\MobileOffice\db.udl" For Input Access Read As #1
    Dim s As String
    Do While InStr(1, s, "provider", vbTextCompare) = 0
        Input #1, s
    Loop
    Close #1
    dbConnString = s
End Sub


