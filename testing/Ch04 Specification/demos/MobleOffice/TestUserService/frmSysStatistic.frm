VERSION 5.00
Begin VB.Form frmSysStatistic 
   Caption         =   "流量统计"
   ClientHeight    =   7035
   ClientLeft      =   60
   ClientTop       =   450
   ClientWidth     =   6825
   LinkTopic       =   "Form1"
   ScaleHeight     =   7035
   ScaleWidth      =   6825
   StartUpPosition =   2  '屏幕中心
   Begin VB.CommandButton Command1 
      Caption         =   "开始统计"
      Height          =   735
      Left            =   240
      TabIndex        =   12
      Top             =   1800
      Width           =   3615
   End
   Begin VB.Frame Frame2 
      Caption         =   "统计时间段"
      Height          =   2295
      Left            =   4080
      TabIndex        =   6
      Top             =   240
      Width           =   2535
      Begin VB.TextBox Text2 
         Height          =   270
         Left            =   480
         TabIndex        =   10
         Text            =   "Text2"
         Top             =   1800
         Width           =   1695
      End
      Begin VB.TextBox Text1 
         Height          =   270
         Left            =   480
         TabIndex        =   9
         Text            =   "Text1"
         Top             =   1320
         Width           =   1695
      End
      Begin VB.OptionButton Option2 
         Caption         =   "按时间统计"
         Height          =   255
         Left            =   240
         TabIndex        =   8
         Top             =   840
         Width           =   1455
      End
      Begin VB.OptionButton Option1 
         Caption         =   "按月统计"
         Height          =   375
         Left            =   240
         TabIndex        =   7
         Top             =   360
         Width           =   1215
      End
      Begin VB.Label Label1 
         Caption         =   "到"
         Height          =   375
         Left            =   240
         TabIndex        =   11
         Top             =   1800
         Width           =   375
      End
   End
   Begin VB.Frame Frame1 
      Caption         =   "统计对象"
      Height          =   1335
      Left            =   240
      TabIndex        =   1
      Top             =   240
      Width           =   3735
      Begin VB.ComboBox Combo2 
         Height          =   300
         Left            =   1560
         TabIndex        =   5
         Text            =   "选择部门"
         Top             =   840
         Width           =   1935
      End
      Begin VB.ComboBox Combo1 
         Height          =   300
         Left            =   1560
         TabIndex        =   4
         Text            =   "选择账户"
         Top             =   360
         Width           =   1935
      End
      Begin VB.OptionButton Option4 
         Caption         =   "按部门统计"
         Height          =   255
         Left            =   240
         TabIndex        =   3
         Top             =   840
         Width           =   1455
      End
      Begin VB.OptionButton Option3 
         Caption         =   "按账户统计"
         Height          =   255
         Left            =   240
         TabIndex        =   2
         Top             =   360
         Width           =   1815
      End
   End
   Begin VB.ListBox List1 
      Height          =   4020
      Left            =   240
      TabIndex        =   0
      Top             =   2760
      Width           =   6375
   End
End
Attribute VB_Name = "frmSysStatistic"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Attribute VB_Ext_KEY = "RVB_UniqueId" ,"3DA814B202C5"
Attribute VB_Ext_KEY = "RVB_ModelStereotype" ,"Form"
Option Explicit

