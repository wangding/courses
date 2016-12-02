VERSION 5.00
Object = "{86CF1D34-0C5F-11D2-A9FC-0000F8754DA1}#2.0#0"; "mscomct2.ocx"
Begin VB.Form frmSchedule 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "添加日程安排"
   ClientHeight    =   5100
   ClientLeft      =   45
   ClientTop       =   435
   ClientWidth     =   4830
   LinkTopic       =   "Form1"
   LockControls    =   -1  'True
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   5100
   ScaleWidth      =   4830
   StartUpPosition =   3  '窗口缺省
   Begin VB.CommandButton btnOK 
      Caption         =   "确　定"
      Default         =   -1  'True
      Height          =   465
      Left            =   2010
      TabIndex        =   36
      Top             =   4530
      Width           =   1245
   End
   Begin VB.CommandButton btnCancel 
      Cancel          =   -1  'True
      Caption         =   "取　消"
      Height          =   465
      Left            =   3450
      TabIndex        =   35
      Top             =   4530
      Width           =   1245
   End
   Begin VB.TextBox txtTitle 
      Height          =   345
      Left            =   270
      TabIndex        =   10
      Top             =   1380
      Width           =   2925
   End
   Begin VB.Frame frmPeriod 
      BorderStyle     =   0  'None
      Height          =   2565
      Left            =   180
      TabIndex        =   3
      Top             =   1860
      Width           =   4545
      Begin VB.TextBox Text4 
         Height          =   345
         Left            =   1470
         TabIndex        =   14
         Top             =   180
         Width           =   1605
      End
      Begin VB.Frame Frame3 
         Caption         =   "定期模式"
         Height          =   1785
         Left            =   90
         TabIndex        =   4
         Top             =   660
         Width           =   4395
         Begin VB.Frame frmWeek 
            BorderStyle     =   0  'None
            Height          =   1665
            Left            =   1590
            TabIndex        =   18
            Top             =   180
            Width           =   3135
            Begin VB.OptionButton optMonday 
               Caption         =   "星期日"
               Height          =   345
               Index           =   6
               Left            =   180
               TabIndex        =   27
               Top             =   1200
               Width           =   915
            End
            Begin VB.OptionButton optMonday 
               Caption         =   "星期四"
               Height          =   345
               Index           =   3
               Left            =   1440
               TabIndex        =   26
               Top             =   510
               Width           =   915
            End
            Begin VB.OptionButton optMonday 
               Caption         =   "星期一"
               Height          =   345
               Index           =   0
               Left            =   180
               TabIndex        =   25
               Top             =   90
               Width           =   915
            End
            Begin VB.OptionButton optMonday 
               Caption         =   "星期六"
               Height          =   345
               Index           =   5
               Left            =   1440
               TabIndex        =   24
               Top             =   870
               Width           =   915
            End
            Begin VB.OptionButton optMonday 
               Caption         =   "星期五"
               Height          =   345
               Index           =   4
               Left            =   180
               TabIndex        =   23
               Top             =   840
               Width           =   915
            End
            Begin VB.OptionButton optMonday 
               Caption         =   "星期三"
               Height          =   345
               Index           =   2
               Left            =   180
               TabIndex        =   22
               Top             =   450
               Width           =   915
            End
            Begin VB.OptionButton optMonday 
               Caption         =   "星期二"
               Height          =   345
               Index           =   1
               Left            =   1440
               TabIndex        =   21
               Top             =   90
               Width           =   915
            End
         End
         Begin VB.Frame frmDay 
            BorderStyle     =   0  'None
            Height          =   1575
            Left            =   1080
            TabIndex        =   16
            Top             =   150
            Width           =   3135
         End
         Begin VB.Frame frmMonth 
            BorderStyle     =   0  'None
            Height          =   1665
            Left            =   2130
            TabIndex        =   19
            Top             =   120
            Width           =   3135
            Begin VB.TextBox Text6 
               Height          =   345
               Left            =   630
               TabIndex        =   29
               Top             =   270
               Width           =   345
            End
            Begin VB.Label Label8 
               Caption         =   "天"
               Height          =   255
               Left            =   1110
               TabIndex        =   30
               Top             =   330
               Width           =   285
            End
            Begin VB.Label Label7 
               Caption         =   "第"
               Height          =   255
               Left            =   270
               TabIndex        =   28
               Top             =   330
               Width           =   285
            End
         End
         Begin VB.Frame frmYear 
            BorderStyle     =   0  'None
            Height          =   1665
            Left            =   1710
            TabIndex        =   20
            Top             =   90
            Width           =   3135
            Begin VB.ComboBox cmbMonth 
               Height          =   300
               ItemData        =   "frmSchedule2.frx":0000
               Left            =   300
               List            =   "frmSchedule2.frx":0028
               Style           =   2  'Dropdown List
               TabIndex        =   32
               Top             =   330
               Width           =   825
            End
            Begin VB.TextBox Text3 
               Height          =   345
               Left            =   1530
               TabIndex        =   31
               Top             =   300
               Width           =   375
            End
            Begin VB.Label Label4 
               Caption         =   "日"
               Height          =   255
               Left            =   2040
               TabIndex        =   34
               Top             =   360
               Width           =   315
            End
            Begin VB.Label Label3 
               Caption         =   "月"
               Height          =   255
               Left            =   1260
               TabIndex        =   33
               Top             =   360
               Width           =   225
            End
         End
         Begin VB.Frame Frame7 
            Caption         =   "Frame7"
            Height          =   1695
            Left            =   990
            TabIndex        =   17
            Top             =   60
            Width           =   30
         End
         Begin VB.OptionButton optEveryDay 
            Caption         =   "每年"
            Height          =   180
            Index           =   3
            Left            =   180
            TabIndex        =   8
            Top             =   1380
            Width           =   735
         End
         Begin VB.OptionButton optEveryDay 
            Caption         =   "每月"
            Height          =   180
            Index           =   2
            Left            =   180
            TabIndex        =   7
            Top             =   1020
            Width           =   735
         End
         Begin VB.OptionButton optEveryDay 
            Caption         =   "每周"
            Height          =   180
            Index           =   1
            Left            =   180
            TabIndex        =   6
            Top             =   660
            Width           =   735
         End
         Begin VB.OptionButton optEveryDay 
            Caption         =   "每天"
            Height          =   180
            Index           =   0
            Left            =   180
            TabIndex        =   5
            Top             =   330
            Width           =   735
         End
      End
      Begin VB.Label Label5 
         Caption         =   "日程提醒时间："
         Height          =   255
         Left            =   90
         TabIndex        =   15
         Top             =   240
         Width           =   1455
      End
   End
   Begin VB.OptionButton optOnce 
      Caption         =   "一次日程"
      Height          =   345
      Index           =   0
      Left            =   180
      TabIndex        =   0
      Top             =   180
      Width           =   1245
   End
   Begin VB.OptionButton optOnce 
      Caption         =   "定期日程"
      Height          =   345
      Index           =   1
      Left            =   180
      TabIndex        =   1
      Top             =   630
      Width           =   1245
   End
   Begin VB.Frame frmOnce 
      BorderStyle     =   0  'None
      Height          =   2565
      Left            =   150
      TabIndex        =   2
      Top             =   1860
      Width           =   4545
      Begin VB.TextBox Text2 
         Height          =   345
         Left            =   1890
         TabIndex        =   13
         Top             =   420
         Width           =   1605
      End
      Begin MSComCtl2.DTPicker DTPicker1 
         Height          =   345
         Left            =   150
         TabIndex        =   12
         Top             =   420
         Width           =   1575
         _ExtentX        =   2778
         _ExtentY        =   609
         _Version        =   393216
         Format          =   64749569
         CurrentDate     =   37547
      End
      Begin VB.Label Label2 
         Caption         =   "日程提醒时间："
         Height          =   255
         Left            =   150
         TabIndex        =   11
         Top             =   180
         Width           =   1455
      End
   End
   Begin VB.Label Label1 
      Caption         =   "标题："
      Height          =   255
      Left            =   270
      TabIndex        =   9
      Top             =   1110
      Width           =   1155
   End
End
Attribute VB_Name = "frmSchedule"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Attribute VB_Ext_KEY = "RVB_UniqueId" ,"3DAFB5E802C8"
Attribute VB_Ext_KEY = "RVB_ModelStereotype" ,"Form"
Option Explicit

'##ModelId=3DAFB5EE00A6
Private Sub btnCancel_Click()
    Unload Me
End Sub

'##ModelId=3DAFB5EE00C6
Private Sub Form_Load()
    InitPosition
    InitVisiable
End Sub

'##ModelId=3DAFB5EE00E5
Private Sub optEveryDay_Click(Index As Integer)
    Select Case Index
        Case 0  '每天
            InitVisiable
            frmDay.Visible = True
        Case 1  '每周
            InitVisiable
            frmWeek.Visible = True
        Case 2  '每月
            InitVisiable
            frmMonth.Visible = True
        Case 3  '每年
            InitVisiable
            frmYear.Visible = True
    End Select
End Sub

'##ModelId=3DAFB5EE0143
Private Sub optOnce_Click(Index As Integer)
    Select Case Index
        Case 0  '一次性日程安排
            frmOnce.Visible = True
            frmPeriod.Visible = False
        Case 1  '周期性日程安排
            frmOnce.Visible = False
            frmPeriod.Visible = True
    End Select
        
End Sub

'##ModelId=3DAFB5EE01A0
Private Sub InitPosition()
    With frmWeek
        .Top = frmDay.Top
        .Left = frmDay.Left
        .Width = frmDay.Width
        .Height = frmDay.Height

    End With
    
    With frmMonth
        .Top = frmDay.Top
        .Left = frmDay.Left
        .Width = frmDay.Width
        .Height = frmDay.Height

    End With
    
    With frmYear
        .Top = frmDay.Top
        .Left = frmDay.Left
        .Width = frmDay.Width
        .Height = frmDay.Height

    End With
End Sub

'##ModelId=3DAFB5EE01CF
Private Sub InitVisiable()
    frmDay.Visible = False
    frmWeek.Visible = False
    frmMonth.Visible = False
    frmYear.Visible = False
    
End Sub
