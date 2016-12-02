VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "fcdSchedule"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Attribute VB_Ext_KEY = "RVB_UniqueId" ,"3DABFBD902F6"
Attribute VB_Ext_KEY = "RVB_ModelStereotype" ,"Class Module"
'管理日程安排。

Option Explicit


'删除日程。
'参数：
'ID: long
'日程安排的标识
'##ModelId=3DAFB65102D4
Public Sub DeleteSchedule(ID As Long)
    Dim mos As New MOScheduleLib.ScheduleManager
    
    'Set mos = CreateObject("MOScheduleLib.ScheduleManager")
    mos.Delete (ID)
    
End Sub


'得到一个空记录集。
'参数：
'Return: Recordset
'返回一个空记录集
'##ModelId=3DAFB79C0221
Public Function GetEmptyRecordset() As Recordset
    Dim rs As ADODB.Recordset
    Set rs = CreateObject("ADODB.Recordset")

    rs.Fields.Append "UserID", adInteger, 4
    rs.Fields.Append "Title", adVarChar, 20
    rs.Fields.Append "Schedule", adVarChar, 50

    rs.Open
    rs.AddNew
    
    Set GetEmptyRecordset = rs
End Function


'保存日程安排信息。
'参数：
'rs: recordset
'保存日程安排信息的记录集
'##ModelId=3DAFB7C60067
Public Sub SaveScheduleInfo(rs As Recordset)
    Dim mos As New MOScheduleLib.ScheduleManager
    mos.Add rs!UserID, rs!Title, ScheduleToDb(rs!schedule)
    
End Sub


'得到指定用户的日程安排列表。
'参数：
'UserID: long
'用户标识
'return: recordset
'日程安排列表
'##ModelId=3DAD2D5502CD
Public Function GetScheduleList(UserID As Long) As Recordset
    Dim mos As New MOScheduleLib.ScheduleManager
    Dim rs As New ADODB.Recordset
    Dim var As Variant
    Dim i As Integer, j As Integer
    
    rs.Fields.Append "ID", adInteger, 4
    rs.Fields.Append "Title", adVarChar, 20
    rs.Fields.Append "Schedule", adVarChar, 50
    
    var = mos.GetListByUserID(UserID)
    
    rs.Open
    
    For i = 0 To UBound(var, 1)
        rs.AddNew
        rs!ID = var(i, 0)
        rs!Title = var(i, 1)
        rs!schedule = ScheduleToWeb(var(i, 2))
    Next i
    
    Set GetScheduleList = rs
    
End Function



' 改变日程安排字符串为数据库格式
' [日程格式]
' 2002-10-8 13:00 单独日程时间
' ey-em-ed 13:00  每天 13:00
' ey-em-28 13:00  每月28日 13:00
' ey-10-19 13:00  每年10月19日 13:00
' ew1/27w2 13:00  每周一 13:00 / 每年第27周的周二

' [补充说明]
' ey / em / ed / ew 分别表示 every year / every month / every day / every week
' 周循环目前仅解析前五个字符，每年指定周的功能留待扩充。
' 周循环的第五个字符表示第几周。范围 1～7，分别表示周日～周六。当没有超出此范围时，后续五个字符被忽略。
' 关于为什么“3=周二，7=周六”的原因：多数高级语言都用枚举表示星期，而且惯例把周日放在首位。枚举默认第一个值为 1，所以导致这种情况。vbscript / vc 均是这种表示方法。javascript 则用 0～6 表示。
'
Private Function ScheduleToDb(ByVal str As String) As String
    Dim s As String
    Select Case Left(str, 2)
        Case "每天"
            s = "ey-em-ed " + Right(str, 5)
        Case "每周"
            s = "ew"
            Select Case Mid(str, 6, 1)
                Case "日":  s = s & "1"
                Case "一":  s = s & "2"
                Case "二":  s = s & "3"
                Case "三":  s = s & "4"
                Case "四":  s = s & "5"
                Case "五":  s = s & "6"
                Case "六":  s = s & "7"
            End Select
            s = s & "/rese " & Right(str, 5)
        Case "每月"
            s = "ey-em-" & Mid(str, 5, 2) & " " & Right(str, 5)
        Case "每年"
            s = "ey-" & Mid(str, 4, 2) & "-" & Mid(str, 7, 2) & " " & Right(str, 5)
        Case Else
            ' normal alert schedule (not cycle).
            s = str
    End Select
    ScheduleToDb = s
End Function


' 改变日程安排字符串为 web 界面格式
' 格式描述如下：
' 2002-10-18 13:00
' 每天,13:00
' 每周的星期一,13:00
' 每月的第02天,13:00
' 每年的01月01日,13:00
'
Private Function ScheduleToWeb(ByVal str As String) As String
    Dim s As String
    Select Case Left(str, 2)
        Case "ey"
            If Mid(str, 7, 2) = "ed" Then
                s = "每天," & Right(str, 5)
            ElseIf Mid(str, 4, 2) = "em" Then
                s = "每月的第" & Mid(str, 7, 2) & "天," & Right(str, 5)
            Else
                s = "每年的" & Mid(str, 4, 2) & "月" & Mid(str, 7, 2) & "日," & Right(str, 5)
            End If
        Case "ew"
            s = "每周的星期"
            Select Case Mid(str, 3, 1)
                Case 1: s = s + "日"
                Case 2: s = s + "一"
                Case 3: s = s + "二"
                Case 4: s = s + "三"
                Case 5: s = s + "四"
                Case 6: s = s + "五"
                Case 7: s = s + "六"
            End Select
            s = s + "," + Right(str, 5)
        Case Else
            s = str
    End Select
    ScheduleToWeb = s
End Function
