VERSION 5.00
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
   Begin VB.OptionButton Option3 
      Caption         =   "不限群发安全组"
      Height          =   255
      Left            =   2640
      TabIndex        =   8
      Top             =   5400
      Width           =   1935
   End
   Begin VB.OptionButton Option2 
      Caption         =   "部门群发安全组"
      Height          =   255
      Left            =   2640
      TabIndex        =   7
      Top             =   3360
      Width           =   1815
   End
   Begin VB.OptionButton Option1 
      Caption         =   "单发短信安全组"
      Height          =   255
      Left            =   2640
      TabIndex        =   6
      Top             =   1080
      Width           =   1815
   End
   Begin VB.CommandButton Command2 
      Caption         =   "删除 >>"
      Height          =   495
      Left            =   4920
      TabIndex        =   5
      Top             =   3600
      Width           =   1695
   End
   Begin VB.CommandButton Command1 
      Caption         =   "<< 添加"
      Height          =   495
      Left            =   4920
      TabIndex        =   4
      Top             =   2520
      Width           =   1695
   End
   Begin VB.ListBox List4 
      Height          =   6180
      Left            =   6960
      TabIndex        =   3
      Top             =   240
      Width           =   2175
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

