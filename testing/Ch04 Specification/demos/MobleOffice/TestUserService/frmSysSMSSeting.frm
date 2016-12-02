VERSION 5.00
Begin VB.Form frmSysSMSSeting 
   Caption         =   "短信设置"
   ClientHeight    =   2520
   ClientLeft      =   60
   ClientTop       =   450
   ClientWidth     =   5670
   LinkTopic       =   "Form1"
   ScaleHeight     =   2520
   ScaleWidth      =   5670
   StartUpPosition =   2  '屏幕中心
   Begin VB.CommandButton cmdSetMulti 
      Caption         =   "设置"
      Height          =   375
      Left            =   3600
      TabIndex        =   5
      Top             =   1440
      Width           =   1455
   End
   Begin VB.CommandButton cmdSetSingle 
      Caption         =   "设置"
      Height          =   375
      Left            =   3600
      TabIndex        =   4
      Top             =   480
      Width           =   1455
   End
   Begin VB.TextBox txtMultiSMSLength 
      Height          =   375
      Left            =   1560
      TabIndex        =   1
      Top             =   1440
      Width           =   1575
   End
   Begin VB.TextBox txtSingleSMSLength 
      Height          =   375
      Left            =   1560
      TabIndex        =   0
      Top             =   480
      Width           =   1575
   End
   Begin VB.Label Label2 
      Caption         =   "群发短信长度"
      Height          =   375
      Left            =   240
      TabIndex        =   3
      Top             =   1560
      Width           =   1215
   End
   Begin VB.Label Label1 
      Caption         =   "单发短信长度"
      Height          =   375
      Left            =   240
      TabIndex        =   2
      Top             =   600
      Width           =   1215
   End
End
Attribute VB_Name = "frmSysSMSSeting"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Attribute VB_Ext_KEY = "RVB_UniqueId" ,"3DA9358D032A"
Attribute VB_Ext_KEY = "RVB_ModelStereotype" ,"Form"
'##ModelId=3DABB1C10124


'##ModelId=3DABB1C10161
Private Sub cmdSetMulti_Click()
    
End Sub

'##ModelId=3DABB1C10190
Private Sub cmdSetSingle_Click()

End Sub

'##ModelId=3DABB1C101BF
Private Sub Form_Load()

End Sub
