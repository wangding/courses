VERSION 5.00
Object = "{67397AA1-7FB1-11D0-B148-00A0C922E820}#6.0#0"; "MSADODC.OCX"
Begin VB.Form frmPvtInfo 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "个人信息管理"
   ClientHeight    =   5520
   ClientLeft      =   45
   ClientTop       =   435
   ClientWidth     =   2550
   LinkTopic       =   "Form1"
   LockControls    =   -1  'True
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   5520
   ScaleWidth      =   2550
   StartUpPosition =   3  '窗口缺省
   Begin MSAdodcLib.Adodc adcUser 
      Height          =   345
      Left            =   210
      Top             =   4590
      Visible         =   0   'False
      Width           =   2505
      _ExtentX        =   4419
      _ExtentY        =   609
      ConnectMode     =   0
      CursorLocation  =   3
      IsolationLevel  =   -1
      ConnectionTimeout=   15
      CommandTimeout  =   30
      CursorType      =   3
      LockType        =   3
      CommandType     =   8
      CursorOptions   =   0
      CacheSize       =   50
      MaxRecords      =   0
      BOFAction       =   0
      EOFAction       =   0
      ConnectStringType=   1
      Appearance      =   1
      BackColor       =   -2147483643
      ForeColor       =   -2147483640
      Orientation     =   0
      Enabled         =   -1
      Connect         =   ""
      OLEDBString     =   ""
      OLEDBFile       =   ""
      DataSourceName  =   ""
      OtherAttributes =   ""
      UserName        =   ""
      Password        =   ""
      RecordSource    =   ""
      Caption         =   "User"
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "宋体"
         Size            =   9
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      _Version        =   393216
   End
   Begin VB.TextBox txtPermission 
      BackColor       =   &H8000000F&
      Height          =   765
      Left            =   120
      Locked          =   -1  'True
      MultiLine       =   -1  'True
      TabIndex        =   13
      Top             =   4170
      Width           =   2295
   End
   Begin VB.CommandButton Command1 
      Cancel          =   -1  'True
      Caption         =   "取　消"
      Height          =   405
      Left            =   1380
      TabIndex        =   12
      Top             =   5040
      Width           =   1035
   End
   Begin VB.CommandButton btnOK 
      Caption         =   "保　存"
      Height          =   405
      Left            =   120
      TabIndex        =   8
      Top             =   5040
      Width           =   1035
   End
   Begin VB.TextBox Text4 
      DataField       =   "MobileNumber"
      DataSource      =   "adcUser"
      Height          =   315
      Left            =   120
      TabIndex        =   7
      Top             =   3450
      Width           =   2295
   End
   Begin VB.TextBox Text2 
      DataField       =   "Password"
      DataSource      =   "adcUser"
      Height          =   315
      Left            =   120
      TabIndex        =   6
      Top             =   2010
      Width           =   1695
   End
   Begin VB.Label lblDepartment 
      BorderStyle     =   1  'Fixed Single
      DataField       =   "DeptName"
      DataSource      =   "adcUser"
      Height          =   315
      Left            =   120
      TabIndex        =   11
      Top             =   2730
      Width           =   2265
   End
   Begin VB.Label lblLogonName 
      BorderStyle     =   1  'Fixed Single
      DataField       =   "LogonName"
      DataSource      =   "adcUser"
      Height          =   315
      Left            =   120
      TabIndex        =   10
      Top             =   1230
      Width           =   1695
   End
   Begin VB.Label lblName 
      BorderStyle     =   1  'Fixed Single
      DataField       =   "Name"
      DataSource      =   "adcUser"
      Height          =   315
      Left            =   120
      TabIndex        =   9
      Top             =   450
      Width           =   1635
   End
   Begin VB.Label Label1 
      Caption         =   "权限："
      Height          =   255
      Index           =   5
      Left            =   120
      TabIndex        =   5
      Top             =   3840
      Width           =   1245
   End
   Begin VB.Label Label1 
      Caption         =   "所属部门："
      Height          =   255
      Index           =   4
      Left            =   120
      TabIndex        =   4
      Top             =   2400
      Width           =   1245
   End
   Begin VB.Label Label1 
      Caption         =   "手机号："
      Height          =   255
      Index           =   3
      Left            =   120
      TabIndex        =   3
      Top             =   3120
      Width           =   1245
   End
   Begin VB.Label Label1 
      Caption         =   "口令："
      Height          =   255
      Index           =   2
      Left            =   120
      TabIndex        =   2
      Top             =   1650
      Width           =   1245
   End
   Begin VB.Label Label1 
      Caption         =   "用户登录名："
      Height          =   255
      Index           =   1
      Left            =   120
      TabIndex        =   1
      Top             =   900
      Width           =   1245
   End
   Begin VB.Label Label1 
      Caption         =   "用户姓名："
      Height          =   255
      Index           =   0
      Left            =   120
      TabIndex        =   0
      Top             =   120
      Width           =   1245
   End
End
Attribute VB_Name = "frmPvtInfo"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Attribute VB_Ext_KEY = "RVB_UniqueId" ,"3DA812D00289"
Attribute VB_Ext_KEY = "RVB_ModelStereotype" ,"Form"
Option Explicit

'##ModelId=3DAC4EF90340
Private Sub Command1_Click()
    Unload Me
End Sub

'##ModelId=3DAC4EF9036F
Private Sub Form_Load()
    DisplayUserInfo
    
    '显示权限信息
    DisplayPermission
End Sub

'##ModelId=3DAC4EF9038E
Private Sub DisplayUserInfo()

End Sub

'##ModelId=3DAC4EF903BD
Private Sub DisplayPermission()
'    Select Case adcUser.Recordset!Permission And 3
'        Case 1
'            txtPermission = "单发短信" & vbCrLf & vbCrLf
'        Case 2
'            txtPermission = "部门群发" & vbCrLf & vbCrLf
'        Case 3
'            txtPermission = "不限群发" & vbCrLf & vbCrLf
'    End Select
'
'    Select Case adcUser.Recordset!Permission And 4
'        Case 4
'            txtPermission = txtPermission.Text & "系统事件订阅"
'        Case 0
'            'nothing
'    End Select
End Sub
