VERSION 5.00
Object = "{67397AA1-7FB1-11D0-B148-00A0C922E820}#6.0#0"; "MSADODC.OCX"
Object = "{F0D2F211-CCB0-11D0-A316-00AA00688B10}#1.0#0"; "MSDATLST.OCX"
Begin VB.Form frmSysSecurityGroup 
   Caption         =   "安全组管理"
   ClientHeight    =   6645
   ClientLeft      =   60
   ClientTop       =   450
   ClientWidth     =   9375
   LinkTopic       =   "Form1"
   ScaleHeight     =   6645
   ScaleWidth      =   9375
   StartUpPosition =   2  '屏幕中心
   Begin MSAdodcLib.Adodc adcOther 
      Height          =   375
      Left            =   6240
      Top             =   4920
      Visible         =   0   'False
      Width           =   2535
      _ExtentX        =   4471
      _ExtentY        =   661
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
      Caption         =   "Other"
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
   Begin MSDataListLib.DataList bdlOther 
      Bindings        =   "frmSysSecurityGroup.frx":0000
      Height          =   6150
      Left            =   6960
      TabIndex        =   8
      Top             =   240
      Width           =   2175
      _ExtentX        =   3836
      _ExtentY        =   10848
      _Version        =   393216
      ListField       =   "Name"
   End
   Begin VB.OptionButton Option3 
      Caption         =   "不限群发安全组"
      Height          =   255
      Left            =   2640
      TabIndex        =   7
      Top             =   5400
      Width           =   1935
   End
   Begin VB.OptionButton Option2 
      Caption         =   "部门群发安全组"
      Height          =   255
      Left            =   2640
      TabIndex        =   6
      Top             =   3360
      Width           =   1815
   End
   Begin VB.OptionButton Option1 
      Caption         =   "单发短信安全组"
      Height          =   255
      Left            =   2640
      TabIndex        =   5
      Top             =   1080
      Width           =   1815
   End
   Begin VB.CommandButton Command2 
      Caption         =   "删除 >>"
      Height          =   495
      Left            =   4920
      TabIndex        =   4
      Top             =   3600
      Width           =   1695
   End
   Begin VB.CommandButton Command1 
      Caption         =   "<< 添加"
      Height          =   495
      Left            =   4920
      TabIndex        =   3
      Top             =   2520
      Width           =   1695
   End
   Begin VB.ListBox List3 
      Height          =   1860
      Left            =   240
      TabIndex        =   2
      Top             =   4560
      Width           =   2175
   End
   Begin VB.ListBox List2 
      Height          =   1860
      Left            =   240
      TabIndex        =   1
      Top             =   2400
      Width           =   2175
   End
   Begin VB.ListBox List1 
      Height          =   1860
      Left            =   240
      TabIndex        =   0
      Top             =   240
      Width           =   2175
   End
End
Attribute VB_Name = "frmSysSecurityGroup"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Attribute VB_Ext_KEY = "RVB_UniqueId" ,"3DA8149C003A"
Attribute VB_Ext_KEY = "RVB_ModelStereotype" ,"Form"
Option Explicit

'##ModelId=3DABFDD2027A
Private Sub Form_Load()
Dim oSecGroup As fcdAdminUser.clsSysSecurityGroup
Dim rs As ADOR.Recordset
    
    Set oSecGroup = CreateObject("fcdAdminUser.clsSysSecurityGroup")
    Set rs = oSecGroup.GetSecurityGroupInfo
    Debug.Print "filter" & rs.RecordCount
    rs.Filter = "Permission = '1'"
    Debug.Print "filtered" & rs.RecordCount
    
    Set adcOther.Recordset = rs
    
End Sub
