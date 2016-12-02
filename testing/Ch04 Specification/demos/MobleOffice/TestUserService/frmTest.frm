VERSION 5.00
Begin VB.Form frmTestAdmin 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "管理外观类测试窗体"
   ClientHeight    =   3675
   ClientLeft      =   45
   ClientTop       =   435
   ClientWidth     =   4770
   LinkTopic       =   "Form1"
   LockControls    =   -1  'True
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   3675
   ScaleWidth      =   4770
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  '窗口缺省
   Begin VB.CommandButton Command5 
      Caption         =   "fcdSysUserandDept"
      Height          =   525
      Left            =   870
      TabIndex        =   4
      Top             =   2940
      Width           =   2805
   End
   Begin VB.CommandButton Command4 
      Caption         =   "fcdSysStatistic"
      Height          =   525
      Left            =   870
      TabIndex        =   3
      Top             =   2190
      Width           =   2805
   End
   Begin VB.CommandButton Command3 
      Caption         =   "fcdSysPhrase"
      Height          =   525
      Left            =   870
      TabIndex        =   2
      Top             =   1530
      Width           =   2805
   End
   Begin VB.CommandButton Command2 
      Caption         =   "fcdSysLogManagment"
      Height          =   525
      Left            =   870
      TabIndex        =   1
      Top             =   870
      Width           =   2805
   End
   Begin VB.CommandButton Command1 
      Caption         =   "fcdSysConfig"
      Height          =   525
      Left            =   870
      TabIndex        =   0
      Top             =   210
      Width           =   2805
   End
End
Attribute VB_Name = "frmTestAdmin"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Attribute VB_Ext_KEY = "RVB_UniqueId" ,"3DBAD36F02E3"
Attribute VB_Ext_KEY = "RVB_ModelStereotype" ,"Form"
Option Explicit

'##ModelId=3DBAD37002D5
Private Sub Command1_Click()
    Dim rs As Recordset
    
    Dim cfg As fcdAdminUser.fcdSysConfig
    Set cfg = CreateObject("fcdAdminUser.fcdSysConfig")

'    Set rs = cfg.GetSysConfig()
'    Debug.Print "GetSysConfig -ok!"
'
'    rs.MoveFirst
'    rs!Value = "true"
'    cfg.SaveSysConfig rs
'    Debug.Print "SaveSysConfig -ok!"
'
'    Dim usr As fcdAdminUser.fcdSysUserandDept
'    Set usr = CreateObject("fcdAdminUser.fcdSysUserandDept")
'
'    Set rs = usr.GetUserByID(1)
'    rs!LogonName = "Hello"
'
'    cfg.SaveAdminInfo rs
'    Debug.Print "SaveAdminInfo -ok!"

    Set rs = cfg.GetHotWordsList()
    Debug.Print "GetHotWordsList -ok!"
    
    Set rs = cfg.GetEmptyHotWord()
    Debug.Print "GetEmptyHotWord -ok!"
    
    rs!word = "good"
    cfg.SaveHotWord rs
    Debug.Print "SaveHotWord -ok!"
    
    cfg.DelHotWord 3
    Debug.Print "DelHotWord -ok!"
    
    Set rs = cfg.GetHotWordByID(1)
    Debug.Print "GetHotWordByID -ok!"
End Sub

'##ModelId=3DBAD37002F3
Private Sub Command2_Click()
    Dim rs As Recordset
    Dim log As fcdAdminUser.fcdSysLogManagment
    Set log = CreateObject("fcdAdminUser.fcdSysLogManagment")
    
    Set rs = log.GetSysLogByTime(CDate("2002-10-23"), CDate("2002-10-25"))
    Debug.Print "GetSysLogByTime -ok!"
    
End Sub

'##ModelId=3DBAD3700312
Private Sub Command3_Click()
    Dim rs As Recordset
    Dim phrase As fcdAdminUser.fcdSysPhrase
    Set phrase = CreateObject("fcdAdminUser.fcdSysPhrase")
    
    Set rs = phrase.GetSysPhraseList()
    Debug.Print "GetSysPhraseList -ok!"
    
    Set rs = phrase.GetEmptyRecordset()
    Debug.Print "GetEmptyRecordset -ok!"
    
    rs!phrase = "333"
    phrase.SaveSysPhrase rs
    Debug.Print "SaveSysPhrase -ok!"
    
    phrase.DeleteSysPhrase 1
    Debug.Print "DeleteSysPhrase -ok!"
    
    Set rs = phrase.GetSysPhraseByID(3)
    Debug.Print "GetSysPhraseByID -ok!"
End Sub

'##ModelId=3DBAD3700331
Private Sub Command4_Click()
    Dim rs As Recordset
    Dim s As fcdAdminUser.fcdSysStatistic
    Set s = CreateObject("fcdAdminUser.fcdSysStatistic")

    Set rs = s.GetDeptStatisticByTime(CDate("2002-10-23"), CDate("2002-11-20"))
    Debug.Print "GetDeptStatisticByTime -ok!"
    
    Debug.Print "-BEGIN DUMP-"
    rs.MoveFirst
    Do Until rs.EOF
        Debug.Print rs!id, rs!Name, rs!sendcount
        rs.MoveNext
    Loop
    Debug.Print "-END DUMP-"
    
    
    Set rs = s.GetPersonStatisticByTime(CDate("2002-10-23"), CDate("2002-11-20"))
    Debug.Print "GetPersonStatisticByTime -ok!"
    
    Debug.Print "-BEGIN DUMP-"
    rs.MoveFirst
    Do Until rs.EOF
        Debug.Print rs!id, rs!Name, rs!sendcount
        rs.MoveNext
    Loop
    Debug.Print "-END DUMP-"
End Sub

'##ModelId=3DBAD3700351
Private Sub Command5_Click()
    Dim rs As Recordset
    Dim ud As fcdAdminUser.fcdSysUserandDept
    Set ud = CreateObject("fcdAdminUser.fcdSysUserandDept")
    
'    Set rs = ud.GetUserList()
'    Debug.Print "GetUserList -ok!"
'
'    Set rs = ud.GetUserEmptyRec()
'    Debug.Print "GetUserEmptyRec -ok!"
'
'    rs!Name = "bad"
'    ud.SaveUserInfo rs
'    Debug.Print "SaveUserInfo -ok!"
'
'    ud.DeleteUser 1
'    Debug.Print "DeleteUser -ok!"
'
'    Set rs = ud.GetUserByID(2)
'    Debug.Print "GetUserByID -ok!"
    
'    Set rs = ud.GetDepartmentList()
'    Debug.Print "GetDepartmentList -ok!"
'
'    Set rs = ud.GetDeptEmptyRec()
'    Debug.Print "GetDeptEmptyRec -ok!"
'
'    rs!Name = "hello world"
'    ud.SaveDeptInfo rs
'    Debug.Print "SaveDeptInfo -ok!"
'
'    Set rs = ud.GetDeptByID(4)
'    Debug.Print "GetDeptByID -ok!"
        
    On Error GoTo ErrHandler

    ud.DeleteDept (1)
    Debug.Print "DeleteDept -ok!"
    
    Exit Sub
ErrHandler:
    'ErrorLog ErrClassName, ErrFuncName, Err
    Resume Next


End Sub
