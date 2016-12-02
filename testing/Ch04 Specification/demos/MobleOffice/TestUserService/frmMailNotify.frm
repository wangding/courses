VERSION 5.00
Object = "{67397AA1-7FB1-11D0-B148-00A0C922E820}#6.0#0"; "MSADODC.OCX"
Object = "{F0D2F211-CCB0-11D0-A316-00AA00688B10}#1.0#0"; "MSDATLST.OCX"
Begin VB.Form frmMailNotify 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "邮件通知管理"
   ClientHeight    =   3855
   ClientLeft      =   45
   ClientTop       =   435
   ClientWidth     =   5205
   LinkTopic       =   "Form1"
   LockControls    =   -1  'True
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   3855
   ScaleWidth      =   5205
   StartUpPosition =   3  '窗口缺省
   Begin MSDataListLib.DataList dlRulers 
      Bindings        =   "frmMailNotify.frx":0000
      Height          =   2370
      Left            =   210
      TabIndex        =   6
      Top             =   1290
      Width           =   3495
      _ExtentX        =   6165
      _ExtentY        =   4180
      _Version        =   393216
      ListField       =   "Ruler"
   End
   Begin MSAdodcLib.Adodc adcRuler 
      Height          =   360
      Left            =   2820
      Top             =   330
      Visible         =   0   'False
      Width           =   2325
      _ExtentX        =   4101
      _ExtentY        =   635
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
      Caption         =   "邮件规则"
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
   Begin VB.CommandButton Command2 
      Caption         =   "保存更改"
      Height          =   405
      Left            =   3840
      TabIndex        =   5
      Top             =   3270
      Width           =   1245
   End
   Begin VB.CommandButton Command1 
      Caption         =   "删除规则"
      Height          =   405
      Left            =   3840
      TabIndex        =   4
      Top             =   1740
      Width           =   1245
   End
   Begin VB.CommandButton btnAddRule 
      Caption         =   "添加规则..."
      Height          =   405
      Left            =   3840
      TabIndex        =   3
      Top             =   1260
      Width           =   1245
   End
   Begin VB.OptionButton optNotifyType 
      Caption         =   "不接收邮件到达通知"
      Height          =   315
      Index           =   0
      Left            =   240
      TabIndex        =   1
      Top             =   570
      Width           =   2415
   End
   Begin VB.OptionButton optNotifyType 
      Caption         =   "接收邮件到达通知"
      Height          =   315
      Index           =   1
      Left            =   240
      TabIndex        =   0
      Top             =   240
      Width           =   2415
   End
   Begin VB.Label Label1 
      Caption         =   "除了："
      Height          =   255
      Left            =   240
      TabIndex        =   2
      Top             =   960
      Width           =   975
   End
End
Attribute VB_Name = "frmMailNotify"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Attribute VB_Ext_KEY = "RVB_UniqueId" ,"3DA812CE01E7"
Attribute VB_Ext_KEY = "RVB_ModelStereotype" ,"Form"
Option Explicit
Const UserID = 31

'##ModelId=3DAFDC500369
Private Sub btnAddRule_Click()
    frmEmailRuler.Show vbModal, Me
End Sub

'##ModelId=3DB0397001C1
Private Sub Form_Load()
    DisplayRulers
End Sub

'##ModelId=3DB0397001F0
Private Sub DisplayRulers()
    '获得用户的邮件过滤规则类型
    Dim user As fcdNormalUser.fcdLogonVerify
    Set user = CreateObject("fcdNormalUser.fcdLogonVerify")
    
    Dim rs As ADOR.Recordset
    Set rs = user.GetUserByID(UserID)
    
    Debug.Print rs!EmailRulerType
    optNotifyType(IIf(rs!EmailRulerType, 1, 0)).Value = True
    
    '获得用户邮件过滤规则列表
    Dim mn As fcdNormalUser.fcdMailNotify
    Set mn = CreateObject("fcdNormalUser.fcdMailNotify")
    
    Set adcRuler.Recordset = mn.GetRulerList(UserID)
End Sub
