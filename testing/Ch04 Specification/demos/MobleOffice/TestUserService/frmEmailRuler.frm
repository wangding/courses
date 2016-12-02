VERSION 5.00
Begin VB.Form frmEmailRuler 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "创建规则"
   ClientHeight    =   5625
   ClientLeft      =   45
   ClientTop       =   435
   ClientWidth     =   4395
   LinkTopic       =   "Form1"
   LockControls    =   -1  'True
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   5625
   ScaleWidth      =   4395
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  '窗口缺省
   Begin VB.CommandButton Command1 
      Cancel          =   -1  'True
      Caption         =   "取　消"
      Height          =   465
      Left            =   2940
      TabIndex        =   15
      Top             =   5070
      Width           =   1245
   End
   Begin VB.CommandButton btnAdd 
      Caption         =   "添　加"
      Default         =   -1  'True
      Height          =   465
      Left            =   1440
      TabIndex        =   14
      Top             =   5070
      Width           =   1245
   End
   Begin VB.OptionButton Option3 
      Caption         =   "发件人"
      Height          =   345
      Left            =   240
      TabIndex        =   5
      Top             =   3390
      Width           =   1245
   End
   Begin VB.Frame Frame3 
      Height          =   1185
      Left            =   420
      TabIndex        =   4
      Top             =   3690
      Width           =   3765
      Begin VB.TextBox txtSender 
         Height          =   405
         Left            =   270
         TabIndex        =   13
         Top             =   630
         Width           =   3375
      End
      Begin VB.Label Label3 
         Caption         =   "是如下："
         Height          =   285
         Left            =   270
         TabIndex        =   12
         Top             =   240
         Width           =   1515
      End
   End
   Begin VB.OptionButton Option2 
      Caption         =   "邮件标题"
      Height          =   345
      Left            =   240
      TabIndex        =   3
      Top             =   1830
      Width           =   1245
   End
   Begin VB.Frame Frame2 
      Height          =   1185
      Left            =   420
      TabIndex        =   2
      Top             =   2160
      Width           =   3765
      Begin VB.TextBox txtTitleContent 
         Height          =   405
         Left            =   270
         TabIndex        =   11
         Top             =   630
         Width           =   3375
      End
      Begin VB.Label Label2 
         Caption         =   "包含如下文字："
         Height          =   285
         Left            =   270
         TabIndex        =   10
         Top             =   270
         Width           =   1515
      End
   End
   Begin VB.Frame Frame1 
      Height          =   1185
      Left            =   420
      TabIndex        =   1
      Top             =   600
      Width           =   3765
      Begin VB.OptionButton optLow 
         Caption         =   "高级"
         Height          =   315
         Index           =   2
         Left            =   2760
         TabIndex        =   9
         Top             =   660
         Width           =   705
      End
      Begin VB.OptionButton optLow 
         Caption         =   "中级"
         Height          =   315
         Index           =   1
         Left            =   1530
         TabIndex        =   8
         Top             =   660
         Width           =   705
      End
      Begin VB.OptionButton optLow 
         Caption         =   "低级"
         Height          =   315
         Index           =   0
         Left            =   330
         TabIndex        =   7
         Top             =   660
         Width           =   705
      End
      Begin VB.Label Label1 
         Caption         =   "是以下级别："
         Height          =   285
         Left            =   330
         TabIndex        =   6
         Top             =   270
         Width           =   1725
      End
   End
   Begin VB.OptionButton optLevel 
      Caption         =   "邮件级别"
      Height          =   345
      Left            =   240
      TabIndex        =   0
      Top             =   300
      Width           =   1245
   End
End
Attribute VB_Name = "frmEmailRuler"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Attribute VB_Ext_KEY = "RVB_UniqueId" ,"3DAFDC610166"
Attribute VB_Ext_KEY = "RVB_ModelStereotype" ,"Form"
Option Explicit

Private Sub btnAdd_Click()
    '
End Sub

'##ModelId=3DB0398202CB
Private Sub Command1_Click()
    Unload Me
End Sub
