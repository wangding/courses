VERSION 5.00
Begin VB.Form frmTestNormal 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "普通用户外观测试"
   ClientHeight    =   6315
   ClientLeft      =   45
   ClientTop       =   435
   ClientWidth     =   6075
   LinkTopic       =   "Form1"
   LockControls    =   -1  'True
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   6315
   ScaleWidth      =   6075
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  '窗口缺省
   Begin VB.CommandButton Command9 
      Caption         =   "fcdSMSSend"
      Height          =   525
      Left            =   1230
      TabIndex        =   8
      Top             =   5670
      Width           =   2805
   End
   Begin VB.CommandButton Command8 
      Caption         =   "fcdSchedule"
      Height          =   525
      Left            =   1230
      TabIndex        =   7
      Top             =   4950
      Width           =   2805
   End
   Begin VB.CommandButton Command7 
      Caption         =   "fcdPvtPhrase"
      Height          =   525
      Left            =   1230
      TabIndex        =   6
      Top             =   4290
      Width           =   2805
   End
   Begin VB.CommandButton Command6 
      Caption         =   "fcdPvtInfoMaint"
      Height          =   525
      Left            =   1230
      TabIndex        =   5
      Top             =   3630
      Width           =   2805
   End
   Begin VB.CommandButton Command5 
      Caption         =   "fcdMailNotify"
      Height          =   525
      Left            =   1230
      TabIndex        =   4
      Top             =   2940
      Width           =   2805
   End
   Begin VB.CommandButton Command4 
      Caption         =   "fcdLogonVerify"
      Height          =   525
      Left            =   1230
      TabIndex        =   3
      Top             =   2220
      Width           =   2805
   End
   Begin VB.CommandButton Command3 
      Caption         =   "fcdHistoryView"
      Height          =   525
      Left            =   1230
      TabIndex        =   2
      Top             =   1530
      Width           =   2805
   End
   Begin VB.CommandButton Command2 
      Caption         =   "fcdEventSub"
      Height          =   525
      Left            =   1230
      TabIndex        =   1
      Top             =   810
      Width           =   2805
   End
   Begin VB.CommandButton Command1 
      Caption         =   "fcdContactListMaint"
      Height          =   525
      Left            =   1230
      TabIndex        =   0
      Top             =   150
      Width           =   2805
   End
End
Attribute VB_Name = "frmTestNormal"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Attribute VB_Ext_KEY = "RVB_UniqueId" ,"3DBAD371011E"
Attribute VB_Ext_KEY = "RVB_ModelStereotype" ,"Form"
Option Explicit

'##ModelId=3DBAD3720380
Private Sub Command1_Click()
    Dim rs As Recordset
    Dim cl As fcdNormalUser.fcdContactListMaint
    Set cl = CreateObject("fcdNormalUser.fcdContactListMaint")
    
'    Set rs = cl.GetContacts(3)
'    Debug.Print "GetContacts -ok!"
'
'    Set rs = cl.GetGroups(3)
'    Debug.Print "GetGroups -ok!"
'
'    Set rs = cl.GetEmptyContact()
'    Debug.Print "GetEmptyContact -ok!"
'
'    rs!Name = "HELLO"
'    rs!UserID = 3
'    cl.SaveContacts rs
'    Debug.Print "SaveContacts -ok!"
'
'    Set rs = cl.GetEmptyGroup()
'    Debug.Print "GetEmptyGroup -ok!"
'
'    rs!Name = "World"
'    rs!UserID = 3
'    cl.SaveGroups rs
'    Debug.Print "SaveGroups -ok!"
'
'    cl.DeleteContact 3
'    Debug.Print "DeleteContact -ok!"
    
    'On Error GoTo Errhandler
    cl.DeleteGroup 1
    Debug.Print "DeleteGroup -ok!"
    

    
    Set rs = cl.GetContactsByID(2)
    Debug.Print "GetContactsByID -ok!"
    
    Set rs = cl.GetGroupByID(2)
    Debug.Print "GetGroupByID -ok!"
    

    
End Sub

'##ModelId=3DBAD372039F
Private Sub Command2_Click()
    Dim rs As Recordset
    Dim evt As fcdNormalUser.fcdEventSub
    Set evt = CreateObject("fcdNormalUser.fcdEventSub")
    
    Set rs = evt.GetSubList(2)
    Debug.Print "GetSubList -ok!"
    
    Set rs = evt.GetEmptyRecord()
    Debug.Print "GetEmptyRecord -ok!"
    
    rs!UserID = 3
    rs!subscription = "mmmmmmm"
    evt.Save rs
    Debug.Print "Save -ok!"
    
    evt.DeleteSub 2
    Debug.Print "DeleteSub -ok!"
    
End Sub

'##ModelId=3DBAD37203BF
Private Sub Command3_Click()
    Dim rs As Recordset
    Dim his As fcdNormalUser.fcdHistoryView
    Set his = CreateObject("fcdNormalUser.fcdHistoryView")
    
    Set rs = his.GetHistory(CDate("2002-10-23"), CDate("2002-10-25"), 6)
    Debug.Print "GetHistory -ok!"
    
End Sub

'##ModelId=3DBAD37203DE
Private Sub Command4_Click()
    Dim rs As Recordset
    Set rs = CreateObject("ADOR.Recordset")
    rs.Fields.Append "LogonName", adChar, 10
    rs.Fields.Append "Password", adChar, 10
    rs.Fields.Append "IPAddr", adChar, 20
    rs.Open
    rs.AddNew
    rs!LogonName = "yangpan"
    rs!Password = "yangpan"
    rs!IPAddr = "202.99.160.110"
    
    Dim lg As fcdNormalUser.fcdLogonVerify
    Set lg = CreateObject("fcdNormalUser.fcdLogonVerify")
    
    Dim bln As Boolean
    bln = lg.Verify(rs)
    Debug.Print "Verify -ok!"
    
End Sub

'##ModelId=3DBAD3730015
Private Sub Command5_Click()
    Dim rs As Recordset
    Dim mail As fcdNormalUser.fcdMailNotify
    Set mail = CreateObject("fcdNormalUser.fcdMailNotify")
    
    Set rs = mail.GetRulerList(30)
    Debug.Print "GetRulerList -ok!"
    
    mail.DeleteRuler (7)
    Debug.Print "DeleteRuler -ok!"
    
    Set rs = mail.GetEmptyRecordset()
    Debug.Print "GetEmptyRecordset -ok!"
    
    rs!UserID = 3
    rs!Ruler = "mmmmmmm"
    mail.SaveRulers rs
    Debug.Print "SaveRulers -ok!"
    
    Set rs = mail.GetRulerByID(1)
    Debug.Print "GetRulerByID -ok!"
    
    '--save user info
    Dim ver As fcdNormalUser.fcdLogonVerify
    Set ver = CreateObject("fcdNormalUser.fcdLogonVerify")
    
    Set rs = ver.GetUserByID(2)
    
    rs!EmailRulerType = 0
    mail.SaveUserInfo rs
    Debug.Print "SaveUserInfo -ok!"
End Sub

'##ModelId=3DBAD3730034
Private Sub Command6_Click()
    Dim rs As Recordset
    
    Dim pvtinfo As fcdNormalUser.fcdPvtInfoMaint
    Set pvtinfo = CreateObject("fcdNormalUser.fcdPvtInfoMaint")
    
    Dim myuser As fcdNormalUser.fcdLogonVerify
    Set myuser = CreateObject("fcdNormalUser.fcdLogonVerify")
    
    Set rs = myuser.GetUserByID(2)
    rs!LogonName = "world"
    
    pvtinfo.SaveUserInfo rs
    Debug.Print "SaveUserInfo -ok!"
End Sub

'##ModelId=3DBAD3730054
Private Sub Command7_Click()
    Dim rs As Recordset
    Dim pp As fcdNormalUser.fcdPvtPhrase
    Set pp = CreateObject("fcdNormalUser.fcdPvtPhrase")
'
'    Set rs = pp.GetPvtPhraseList(1)
'    Debug.Print "GetPvtPhraseList -ok!"
    
    Set rs = pp.GetEmptyRecordset()
    Debug.Print "GetEmptyRecordset -ok!"
    
    rs!phrase = ",mmmmm"
    rs!UserID = 3
    pp.SavePvtPhrase rs
    Debug.Print "SavePvtPhrase -ok!"
    
    
    pp.DeletePhrase 2
    Debug.Print "DeletePhrase -ok!"
    
    Set rs = pp.GetPvtPhraseByID(3)
    Debug.Print "GetPvtPhraseByID -ok!"
    
    Dim u As fcdNormalUser.fcdLogonVerify
    Set u = CreateObject("fcdNormalUser.fcdLogonVerify")
    
    Set rs = u.GetUserByID(2)
    rs!isusesysphrase = 1
    pp.SaveUserInfo rs
    Debug.Print "SaveUserInfo -ok!"
    
End Sub

'##ModelId=3DBAD3730073
Private Sub Command8_Click()
    Dim rs As Recordset
    Dim schedule As fcdNormalUser.fcdSchedule
    Set schedule = CreateObject("fcdNormalUser.fcdSchedule")
    
    Set rs = schedule.GetScheduleList(30)
    Debug.Print "GetScheduleList -ok!"
'
    Set rs = schedule.GetEmptyRecordset()
    Debug.Print "GetEmptyRecordset -ok!"

    rs!UserID = 30
    rs!schedule = "2002-11-9 12:00"
    rs!Title = "hello"
    schedule.SaveScheduleInfo rs
    Debug.Print "SaveScheduleInfo -ok!"
'
'    schedule.DeleteSchedule 2
'    Debug.Print "DeleteSchedule -ok!"
End Sub

'##ModelId=3DBAD3730092
Private Sub Command9_Click()
    Dim rs As Recordset
    Dim sms As fcdNormalUser.fcdSMSSend
    Set sms = CreateObject("fcdNormalUser.fcdSMSSend")
'
'    Set rs = sms.GetPvtContactList(3)
'    Debug.Print "GetPvtContactList -ok!"
'
'    Set rs = sms.GetPvtGroupList(3)
'    Debug.Print "GetPvtGroupList -ok!"
'
'    Set rs = sms.GetMRUMobile(2)
'    Debug.Print "GetMRUMobile -ok!"
'
'    Set rs = sms.GetSysPhrase()
'    Debug.Print "GetSysPhrase -ok!"
'
'    Set rs = sms.GetPvtPhrase(2)
'    Debug.Print "GetPvtPhrase -ok!"
'
'    Set rs = sms.GetGloableContact()
'    Debug.Print "GetGloableContact -ok!"
'
'    Set rs = sms.GetGloableGroup()
'    Debug.Print "GetGloableGroup -ok!"

    Set rs = CreateObject("ADOR.Recordset")
    rs.Fields.Append "UserID", adInteger, 4
    rs.Fields.Append "IPAddr", adChar, 50
    rs.Fields.Append "Message", adChar, 70  '注意：长度必须小于100，因为后面要加签名。
    rs.Fields.Append "RecName", adChar, 400
    rs.Fields.Append "RecMobileNumber", adChar, 400
    rs.Fields.Append "IsIncludeHotWord", adBoolean, 1

    rs.Open
    rs.AddNew
    rs!UserID = 31
    rs!IPAddr = "202.99.160.119"
    rs!Message = "杨攀你好！"
    rs!RecName = ""
    rs!recmobilenumber = "13582102180"
    rs!IsIncludeHotWord = 0

    sms.SendMessage rs
    Debug.Print "SendMessage -ok!"
    
    
'    Dim result As Integer
'    result = sms.ChkStrForHotword("江泽民你好！")
'    Debug.Print "ChkStrForHotword -ok!"


'    Dim s As MainBusiness.HistoryManager
'    Set s = CreateObject("MainBusiness.HistoryManager")
'
'    s.SendMessageByVC 1, "test user", "12345678901", "江泽民你好！", "123.456.789.123"
    
End Sub
