VERSION 5.00
Object = "{67397AA1-7FB1-11D0-B148-00A0C922E820}#6.0#0"; "MSADODC.OCX"
Object = "{F0D2F211-CCB0-11D0-A316-00AA00688B10}#1.0#0"; "MSDATLST.OCX"
Begin VB.Form frmSysFilterWords 
   Caption         =   "Form1"
   ClientHeight    =   4155
   ClientLeft      =   60
   ClientTop       =   450
   ClientWidth     =   6915
   LinkTopic       =   "Form1"
   ScaleHeight     =   4155
   ScaleWidth      =   6915
   StartUpPosition =   3  '窗口缺省
   Begin MSAdodcLib.Adodc adcWords 
      Height          =   375
      Left            =   2760
      Top             =   3240
      Visible         =   0   'False
      Width           =   2175
      _ExtentX        =   3836
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
      Caption         =   "Adodc1"
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
   Begin VB.CommandButton Command4 
      Caption         =   "保存"
      Height          =   375
      Left            =   5040
      TabIndex        =   9
      Top             =   3480
      Width           =   1575
   End
   Begin MSDataListLib.DataList dblWords 
      Bindings        =   "frmSysFilterWords.frx":0000
      Height          =   3630
      Left            =   240
      TabIndex        =   8
      Top             =   240
      Width           =   2295
      _ExtentX        =   4048
      _ExtentY        =   6403
      _Version        =   393216
      ListField       =   "Words"
   End
   Begin VB.CommandButton Command1 
      Caption         =   "添加"
      Height          =   375
      Left            =   2760
      TabIndex        =   7
      Top             =   840
      Width           =   1215
   End
   Begin VB.CommandButton Command2 
      Caption         =   "删除"
      Height          =   375
      Left            =   4080
      TabIndex        =   6
      Top             =   840
      Width           =   1215
   End
   Begin VB.CommandButton Command3 
      Caption         =   "修改"
      Height          =   375
      Left            =   5400
      TabIndex        =   5
      Top             =   840
      Width           =   1215
   End
   Begin VB.Frame Frame1 
      Caption         =   "检测到敏感词时的动作设置"
      Height          =   1455
      Left            =   2760
      TabIndex        =   1
      Top             =   1440
      Width           =   3855
      Begin VB.OptionButton Option1 
         Caption         =   "警告，让用户选择发送还是不发送"
         Height          =   255
         Left            =   240
         TabIndex        =   4
         Top             =   360
         Width           =   3255
      End
      Begin VB.OptionButton Option2 
         Caption         =   "不警告，直接截取敏感词后发送"
         Height          =   255
         Left            =   240
         TabIndex        =   3
         Top             =   720
         Width           =   3255
      End
      Begin VB.OptionButton Option3 
         Caption         =   "警告，不发送"
         Height          =   255
         Left            =   240
         TabIndex        =   2
         Top             =   1080
         Width           =   3015
      End
   End
   Begin VB.TextBox Text1 
      Height          =   375
      Left            =   2760
      TabIndex        =   0
      Top             =   240
      Width           =   3855
   End
End
Attribute VB_Name = "frmSysFilterWords"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Attribute VB_Ext_KEY = "RVB_UniqueId" ,"3DA935A2027E"
Attribute VB_Ext_KEY = "RVB_ModelStereotype" ,"Form"
'##ModelId=3DA926260355
Private Sub Form_Load()
    
End Sub
