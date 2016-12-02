VERSION 5.00
Object = "{67397AA1-7FB1-11D0-B148-00A0C922E820}#6.0#0"; "MSADODC.OCX"
Object = "{CDE57A40-8B86-11D0-B3C6-00A0C90AEA82}#1.0#0"; "MSDATGRD.OCX"
Begin VB.Form frmHistoryView 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "发送历史记录查看"
   ClientHeight    =   6525
   ClientLeft      =   45
   ClientTop       =   435
   ClientWidth     =   10290
   LinkTopic       =   "Form1"
   LockControls    =   -1  'True
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   6525
   ScaleWidth      =   10290
   StartUpPosition =   3  '窗口缺省
   Begin MSDataGridLib.DataGrid DataGrid1 
      Bindings        =   "frmHistoryView.frx":0000
      Height          =   4515
      Left            =   240
      TabIndex        =   8
      Top             =   1920
      Width           =   9975
      _ExtentX        =   17595
      _ExtentY        =   7964
      _Version        =   393216
      AllowUpdate     =   0   'False
      Enabled         =   0   'False
      HeadLines       =   1
      RowHeight       =   15
      BeginProperty HeadFont {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "宋体"
         Size            =   9
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "宋体"
         Size            =   9
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ColumnCount     =   2
      BeginProperty Column00 
         DataField       =   ""
         Caption         =   ""
         BeginProperty DataFormat {6D835690-900B-11D0-9484-00A0C91110ED} 
            Type            =   0
            Format          =   ""
            HaveTrueFalseNull=   0
            FirstDayOfWeek  =   0
            FirstWeekOfYear =   0
            LCID            =   2052
            SubFormatType   =   0
         EndProperty
      EndProperty
      BeginProperty Column01 
         DataField       =   ""
         Caption         =   ""
         BeginProperty DataFormat {6D835690-900B-11D0-9484-00A0C91110ED} 
            Type            =   0
            Format          =   ""
            HaveTrueFalseNull=   0
            FirstDayOfWeek  =   0
            FirstWeekOfYear =   0
            LCID            =   2052
            SubFormatType   =   0
         EndProperty
      EndProperty
      SplitCount      =   1
      BeginProperty Split0 
         BeginProperty Column00 
         EndProperty
         BeginProperty Column01 
         EndProperty
      EndProperty
   End
   Begin MSAdodcLib.Adodc adcHistory 
      Height          =   375
      Left            =   3360
      Top             =   330
      Visible         =   0   'False
      Width           =   2115
      _ExtentX        =   3731
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
      Caption         =   "历史记录"
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
   Begin VB.Frame Frame1 
      Height          =   915
      Left            =   390
      TabIndex        =   2
      Top             =   870
      Width           =   5505
      Begin VB.CommandButton btnView 
         Caption         =   "查　看"
         Enabled         =   0   'False
         Height          =   375
         Left            =   4050
         TabIndex        =   7
         Top             =   480
         Width           =   1245
      End
      Begin VB.TextBox txtEndTime 
         Enabled         =   0   'False
         Height          =   345
         Left            =   2160
         TabIndex        =   6
         Top             =   510
         Width           =   1755
      End
      Begin VB.TextBox txtStartTime 
         Enabled         =   0   'False
         Height          =   345
         Left            =   150
         TabIndex        =   3
         Top             =   510
         Width           =   1755
      End
      Begin VB.Label Label2 
         Caption         =   "结束时间："
         Height          =   255
         Left            =   2160
         TabIndex        =   5
         Top             =   210
         Width           =   1515
      End
      Begin VB.Label Label1 
         Caption         =   "起始时间："
         Height          =   255
         Left            =   150
         TabIndex        =   4
         Top             =   210
         Width           =   1515
      End
   End
   Begin VB.OptionButton optThisMonth 
      Caption         =   "特定时间段的历史记录"
      Height          =   315
      Index           =   1
      Left            =   240
      TabIndex        =   1
      Top             =   480
      Width           =   2295
   End
   Begin VB.OptionButton optThisMonth 
      Caption         =   "本月发送的历史记录"
      Height          =   315
      Index           =   0
      Left            =   240
      TabIndex        =   0
      Top             =   90
      Width           =   2055
   End
End
Attribute VB_Name = "frmHistoryView"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Attribute VB_Ext_KEY = "RVB_UniqueId" ,"3DA813970070"
Attribute VB_Ext_KEY = "RVB_ModelStereotype" ,"Form"
Option Explicit

'##ModelId=3DAD70930050
Private Sub btnView_Click()
    Dim hv As fcdNormalUser.fcdHistoryView
    Set hv = CreateObject("fcdNormalUser.fcdHistoryView")
    
    Set adcHistory.Recordset = hv.GetHistory("", "", 2)
    
End Sub

'##ModelId=3DAD709300BE
Private Sub Form_Load()
    '
End Sub

'##ModelId=3DAD5F330183
Private Sub optThisMonth_Click(Index As Integer)
    If optThisMonth(1).Value = True Then
        txtStartTime.Enabled = True
        txtEndTime.Enabled = True
        btnView.Enabled = True
    Else
        txtStartTime.Enabled = False
        txtEndTime.Enabled = False
        btnView.Enabled = False
        
        Dim hv As fcdNormalUser.fcdHistoryView
        Set hv = CreateObject("fcdNormalUser.fcdHistoryView")
        
        Set adcHistory.Recordset = hv.GetHistory("", "", 2)
        
    End If
End Sub
