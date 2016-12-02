VERSION 5.00
Object = "{F0D2F211-CCB0-11D0-A316-00AA00688B10}#1.0#0"; "MSDATLST.OCX"
Begin VB.Form frmEventSub 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "事件订阅配置"
   ClientHeight    =   4020
   ClientLeft      =   45
   ClientTop       =   435
   ClientWidth     =   6525
   LinkTopic       =   "Form1"
   LockControls    =   -1  'True
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   4020
   ScaleWidth      =   6525
   StartUpPosition =   3  '窗口缺省
   Begin VB.Timer Timer2 
      Enabled         =   0   'False
      Interval        =   1000
      Left            =   2880
      Top             =   1320
   End
   Begin VB.Timer Timer1 
      Enabled         =   0   'False
      Interval        =   100
      Left            =   2880
      Top             =   600
   End
   Begin VB.Frame Frame4 
      Height          =   3195
      Left            =   6540
      TabIndex        =   12
      Top             =   300
      Width           =   3195
      Begin VB.CommandButton Command3 
         Caption         =   "完　成"
         Height          =   345
         Left            =   2100
         TabIndex        =   22
         Top             =   2760
         Width           =   975
      End
      Begin VB.TextBox Text3 
         Height          =   315
         Left            =   1470
         TabIndex        =   20
         Top             =   2220
         Width           =   1545
      End
      Begin VB.CommandButton Command2 
         Caption         =   "删　除"
         Height          =   345
         Left            =   1080
         TabIndex        =   18
         Top             =   2760
         Width           =   975
      End
      Begin VB.CommandButton Command1 
         Caption         =   "添　加"
         Height          =   345
         Left            =   90
         TabIndex        =   17
         Top             =   2760
         Width           =   975
      End
      Begin VB.OptionButton Option3 
         Caption         =   "订阅所有事件"
         Height          =   195
         Left            =   240
         TabIndex        =   16
         Top             =   180
         Width           =   1815
      End
      Begin VB.OptionButton Option1 
         Caption         =   "不订阅所有事件"
         Height          =   195
         Left            =   240
         TabIndex        =   13
         Top             =   510
         Width           =   1815
      End
      Begin MSDataListLib.DataList DataList4 
         Height          =   1110
         Left            =   180
         TabIndex        =   15
         Top             =   1050
         Width           =   2835
         _ExtentX        =   5001
         _ExtentY        =   1958
         _Version        =   393216
      End
      Begin VB.Label Label1 
         Caption         =   "事件ＩＤ是："
         Height          =   225
         Index           =   5
         Left            =   270
         TabIndex        =   19
         Top             =   2310
         Width           =   1185
      End
      Begin VB.Label Label1 
         Caption         =   "除了："
         Height          =   225
         Index           =   7
         Left            =   210
         TabIndex        =   14
         Top             =   750
         Width           =   1575
      End
   End
   Begin VB.Frame Frame3 
      Height          =   3195
      Left            =   6540
      TabIndex        =   7
      Top             =   300
      Width           =   3195
      Begin VB.TextBox Text2 
         Enabled         =   0   'False
         Height          =   315
         Left            =   180
         TabIndex        =   8
         Text            =   "Text1"
         Top             =   510
         Width           =   2835
      End
      Begin MSDataListLib.DataList DataList3 
         Height          =   1110
         Left            =   180
         TabIndex        =   9
         Top             =   1110
         Width           =   2835
         _ExtentX        =   5001
         _ExtentY        =   1958
         _Version        =   393216
      End
      Begin VB.Label Label1 
         Caption         =   "订阅的日志类型："
         Height          =   225
         Index           =   3
         Left            =   180
         TabIndex        =   11
         Top             =   270
         Width           =   1575
      End
      Begin VB.Label Label1 
         Caption         =   "信息类型："
         Height          =   225
         Index           =   4
         Left            =   180
         TabIndex        =   10
         Top             =   870
         Width           =   1575
      End
   End
   Begin VB.Frame Frame2 
      Height          =   3195
      Left            =   6540
      TabIndex        =   2
      Top             =   300
      Width           =   3195
      Begin VB.TextBox Text1 
         Enabled         =   0   'False
         Height          =   315
         Left            =   180
         TabIndex        =   3
         Text            =   "Text1"
         Top             =   480
         Width           =   2835
      End
      Begin MSDataListLib.DataList DataList2 
         Height          =   1110
         Left            =   180
         TabIndex        =   4
         Top             =   1110
         Width           =   2835
         _ExtentX        =   5001
         _ExtentY        =   1958
         _Version        =   393216
      End
      Begin VB.Label Label1 
         Caption         =   "服务器："
         Height          =   225
         Index           =   1
         Left            =   180
         TabIndex        =   6
         Top             =   240
         Width           =   1245
      End
      Begin VB.Label Label1 
         Caption         =   "订阅的日志类型："
         Height          =   225
         Index           =   2
         Left            =   180
         TabIndex        =   5
         Top             =   900
         Width           =   1575
      End
   End
   Begin MSDataListLib.DataList DataList1 
      Height          =   3210
      Left            =   90
      TabIndex        =   1
      Top             =   300
      Width           =   2835
      _ExtentX        =   5001
      _ExtentY        =   5662
      _Version        =   393216
   End
   Begin VB.Frame Frame1 
      Height          =   3195
      Left            =   3150
      TabIndex        =   21
      Top             =   300
      Width           =   3195
      Begin VB.Image Image1 
         Height          =   1920
         Left            =   630
         Picture         =   "frmEventSub.frx":0000
         Top             =   690
         Width           =   1920
      End
   End
   Begin VB.Label path 
      Height          =   345
      Left            =   1410
      TabIndex        =   24
      Top             =   3600
      Width           =   3465
   End
   Begin VB.Label Label2 
      Caption         =   "你当前的位置："
      Height          =   345
      Left            =   90
      TabIndex        =   23
      Top             =   3600
      Width           =   1305
   End
   Begin VB.Label Label1 
      Caption         =   "服务器："
      Height          =   225
      Index           =   0
      Left            =   90
      TabIndex        =   0
      Top             =   60
      Width           =   1245
   End
End
Attribute VB_Name = "frmEventSub"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Attribute VB_Ext_KEY = "RVB_UniqueId" ,"3DA8139F018E"
Attribute VB_Ext_KEY = "RVB_ModelStereotype" ,"Form"
Option Explicit
'##ModelId=3DBAD35C0187
Dim myleft As Integer
'##ModelId=3DBAD35C0262
Dim step As Integer
'##ModelId=3DBAD35C02C0
Private Sub Command3_Click()
    step = 4
    path.Caption = ""
    Timer1.Enabled = True
    Timer2.Enabled = True
End Sub

'##ModelId=3DBAD35C02EE
Private Sub DataList1_Click()
    step = 1
    path.Caption = "A服务器"
    Timer1.Enabled = True
    Timer2.Enabled = True
End Sub

'##ModelId=3DBAD35C030E
Private Sub DataList2_Click()
    step = 2
    path.Caption = "A服务器\系统日志"
    Timer1.Enabled = True
    Timer2.Enabled = True
End Sub

'##ModelId=3DBAD35C033D
Private Sub DataList3_Click()
    step = 3
    path.Caption = "A服务器\系统日志\错误信息"
    Timer1.Enabled = True
    Timer2.Enabled = True
End Sub

'##ModelId=3DBAD35C036C
Private Sub Form_Load()
    myleft = Frame4.Left
End Sub

'##ModelId=3DBAD35C039A
Private Sub Timer1_Timer()
    Select Case step
        Case 1
            Frame2.Left = Frame2.Left - (myleft - Frame1.Left) / 9
        Case 2
            Frame3.Left = Frame3.Left - (myleft - Frame1.Left) / 9
        Case 3
            Frame4.Left = Frame4.Left - (myleft - Frame1.Left) / 9
        Case 4
            Frame2.Left = myleft
            Frame3.Left = myleft
            Frame4.Left = myleft
    End Select
End Sub

'##ModelId=3DBAD35C03BA
Private Sub Timer2_Timer()
    Timer1.Enabled = False
    Timer2.Enabled = False
End Sub
