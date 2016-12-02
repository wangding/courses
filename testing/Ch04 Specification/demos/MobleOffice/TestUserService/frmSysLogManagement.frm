VERSION 5.00
Begin VB.Form frmSysLogManagement 
   Caption         =   "日志管理"
   ClientHeight    =   5355
   ClientLeft      =   60
   ClientTop       =   450
   ClientWidth     =   8865
   LinkTopic       =   "Form1"
   ScaleHeight     =   5355
   ScaleWidth      =   8865
   StartUpPosition =   2  '屏幕中心
   Begin VB.CommandButton Command1 
      Caption         =   "查看"
      Height          =   375
      Left            =   4680
      TabIndex        =   4
      Top             =   240
      Width           =   1455
   End
   Begin VB.TextBox Text2 
      Height          =   375
      Left            =   1920
      TabIndex        =   2
      Text            =   "MM-DD-YYYY"
      Top             =   240
      Width           =   1095
   End
   Begin VB.TextBox Text1 
      Height          =   375
      Left            =   240
      TabIndex        =   1
      Text            =   "MM-DD-YYYY"
      Top             =   240
      Width           =   1095
   End
   Begin VB.ListBox lstSysLog 
      Height          =   4200
      Left            =   240
      TabIndex        =   0
      Top             =   840
      Width           =   8415
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      Caption         =   "到"
      Height          =   180
      Left            =   1560
      TabIndex        =   3
      Top             =   330
      Width           =   180
   End
End
Attribute VB_Name = "frmSysLogManagement"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Attribute VB_Ext_KEY = "RVB_UniqueId" ,"3DA9359700F8"
Attribute VB_Ext_KEY = "RVB_ModelStereotype" ,"Form"
'##ModelId=3DAFBD02031E
Private Sub Command1_Click()

End Sub

