VERSION 5.00
Begin VB.Form frmPvtInfoMaint 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "个人信息助理"
   ClientHeight    =   5370
   ClientLeft      =   45
   ClientTop       =   435
   ClientWidth     =   3480
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   5370
   ScaleWidth      =   3480
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  '窗口缺省
   Begin VB.CommandButton btnSysEventSub 
      Caption         =   "系统日志订阅"
      Height          =   525
      Left            =   840
      TabIndex        =   4
      Top             =   4200
      Width           =   1785
   End
   Begin VB.CommandButton btnManit 
      Caption         =   "管理维护"
      Height          =   525
      Left            =   840
      TabIndex        =   3
      Top             =   3270
      Width           =   1785
   End
   Begin VB.CommandButton btnSMSSend 
      Caption         =   "发送短信"
      Height          =   525
      Left            =   840
      TabIndex        =   2
      Top             =   2355
      Width           =   1785
   End
   Begin VB.CommandButton btnSchedule 
      Caption         =   "日程提醒"
      Height          =   525
      Left            =   840
      TabIndex        =   1
      Top             =   1425
      Width           =   1785
   End
   Begin VB.CommandButton btnHistoryInfoView 
      Caption         =   "历史记录查看"
      Height          =   525
      Left            =   840
      TabIndex        =   0
      Top             =   510
      Width           =   1785
   End
End
Attribute VB_Name = "frmPvtInfoMaint"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Attribute VB_Ext_KEY = "RVB_UniqueId" ,"3DA829F10097"
Attribute VB_Ext_KEY = "RVB_ModelStereotype" ,"Form"
Option Explicit

'##ModelId=3DA9260D0201
Private Sub btnHistoryInfoView_Click()
    frmHistoryView.Show vbModal, Me
End Sub

'##ModelId=3DA9260D0230
Private Sub btnManit_Click()
    frmMaint.Show vbModal, Me
End Sub

'##ModelId=3DA9260D025F
Private Sub btnSchedule_Click()
    frmSchedule.Show vbModal, Me
End Sub

'##ModelId=3DA9260D029D
Private Sub btnSMSSend_Click()
    frmSMSSend.Show vbModal, Me
End Sub

'##ModelId=3DA9260D02CC
Private Sub btnSysEventSub_Click()
    frmEventSub.Show vbModal, Me
End Sub
