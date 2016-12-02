VERSION 5.00
Begin VB.Form frmSysMailNotify 
   Caption         =   "邮件到达通知管理"
   ClientHeight    =   7815
   ClientLeft      =   60
   ClientTop       =   450
   ClientWidth     =   9000
   LinkTopic       =   "Form1"
   LockControls    =   -1  'True
   ScaleHeight     =   7815
   ScaleWidth      =   9000
   StartUpPosition =   2  '屏幕中心
   Begin VB.Frame Frame5 
      Caption         =   "以下条件例外"
      Height          =   3255
      Left            =   240
      TabIndex        =   20
      Top             =   840
      Width           =   7815
      Begin VB.CheckBox Check6 
         Caption         =   "低级"
         Height          =   255
         Left            =   360
         TabIndex        =   24
         Top             =   360
         Width           =   735
      End
      Begin VB.CheckBox Check5 
         Caption         =   "普通"
         Height          =   255
         Left            =   1200
         TabIndex        =   23
         Top             =   360
         Width           =   735
      End
      Begin VB.CheckBox Check4 
         Caption         =   "高级"
         Height          =   255
         Left            =   2040
         TabIndex        =   22
         Top             =   360
         Width           =   735
      End
      Begin VB.ListBox List2 
         Height          =   960
         Left            =   240
         TabIndex        =   21
         Top             =   840
         Width           =   6855
      End
   End
   Begin VB.CommandButton Command5 
      Caption         =   "删除"
      Height          =   375
      Left            =   4560
      TabIndex        =   19
      Top             =   240
      Width           =   2295
   End
   Begin VB.Frame Frame4 
      Caption         =   "邮件类型"
      Height          =   1335
      Left            =   4320
      TabIndex        =   12
      Top             =   6360
      Width           =   3375
      Begin VB.CommandButton Command3 
         Caption         =   "添加"
         Height          =   375
         Left            =   1080
         TabIndex        =   15
         Top             =   840
         Width           =   1335
      End
      Begin VB.ComboBox Combo3 
         Height          =   300
         ItemData        =   "frmSysMailNotify.frx":0000
         Left            =   1560
         List            =   "frmSysMailNotify.frx":000A
         TabIndex        =   14
         Top             =   360
         Width           =   1575
      End
      Begin VB.ComboBox Combo2 
         Height          =   300
         ItemData        =   "frmSysMailNotify.frx":0022
         Left            =   240
         List            =   "frmSysMailNotify.frx":002C
         TabIndex        =   13
         Top             =   360
         Width           =   1215
      End
   End
   Begin VB.Frame Frame3 
      Caption         =   "发信人"
      Height          =   1335
      Left            =   600
      TabIndex        =   11
      Top             =   6360
      Width           =   3255
      Begin VB.CommandButton Command4 
         Caption         =   "添加"
         Height          =   375
         Left            =   840
         TabIndex        =   18
         Top             =   840
         Width           =   1335
      End
      Begin VB.TextBox Text2 
         Height          =   270
         Left            =   1560
         TabIndex        =   17
         Top             =   360
         Width           =   1455
      End
      Begin VB.ComboBox Combo4 
         Height          =   300
         ItemData        =   "frmSysMailNotify.frx":003E
         Left            =   240
         List            =   "frmSysMailNotify.frx":0048
         TabIndex        =   16
         Top             =   360
         Width           =   1095
      End
   End
   Begin VB.Frame Frame2 
      Caption         =   "标题关键字"
      Height          =   1455
      Left            =   4320
      TabIndex        =   7
      Top             =   4680
      Width           =   3375
      Begin VB.CommandButton Command2 
         Caption         =   "添加"
         Height          =   375
         Left            =   1080
         TabIndex        =   10
         Top             =   840
         Width           =   1335
      End
      Begin VB.TextBox Text1 
         Height          =   270
         Left            =   1560
         TabIndex        =   9
         Top             =   360
         Width           =   1575
      End
      Begin VB.ComboBox Combo1 
         Height          =   300
         ItemData        =   "frmSysMailNotify.frx":005A
         Left            =   240
         List            =   "frmSysMailNotify.frx":0064
         TabIndex        =   8
         Top             =   360
         Width           =   1215
      End
   End
   Begin VB.OptionButton Option2 
      Caption         =   "忽略所有邮件"
      Height          =   375
      Left            =   2280
      TabIndex        =   2
      Top             =   240
      Width           =   2055
   End
   Begin VB.OptionButton Option1 
      Caption         =   "通知所有邮件"
      Height          =   375
      Left            =   240
      TabIndex        =   1
      Top             =   240
      Width           =   1815
   End
   Begin VB.Frame Frame1 
      Caption         =   "邮件重要性"
      Height          =   1455
      Left            =   600
      TabIndex        =   0
      Top             =   4680
      Width           =   3255
      Begin VB.CheckBox Check3 
         Caption         =   "高级"
         Height          =   255
         Left            =   2280
         TabIndex        =   6
         Top             =   360
         Width           =   735
      End
      Begin VB.CheckBox Check2 
         Caption         =   "普通"
         Height          =   255
         Left            =   1320
         TabIndex        =   5
         Top             =   360
         Width           =   1455
      End
      Begin VB.CheckBox Check1 
         Caption         =   "低级"
         Height          =   255
         Left            =   360
         TabIndex        =   4
         Top             =   360
         Width           =   1095
      End
      Begin VB.CommandButton Command1 
         Caption         =   "添加"
         Height          =   375
         Left            =   840
         TabIndex        =   3
         Top             =   840
         Width           =   1335
      End
   End
End
Attribute VB_Name = "frmSysMailNotify"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Attribute VB_Ext_KEY = "RVB_UniqueId" ,"3DA814B40171"
Attribute VB_Ext_KEY = "RVB_ModelStereotype" ,"Form"
Option Explicit

