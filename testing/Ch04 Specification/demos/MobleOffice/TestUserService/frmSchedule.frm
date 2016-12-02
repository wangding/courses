VERSION 5.00
Object = "{67397AA1-7FB1-11D0-B148-00A0C922E820}#6.0#0"; "MSADODC.OCX"
Object = "{CDE57A40-8B86-11D0-B3C6-00A0C90AEA82}#1.0#0"; "MSDATGRD.OCX"
Begin VB.Form frmScheduleMaint 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "日程管理"
   ClientHeight    =   5460
   ClientLeft      =   45
   ClientTop       =   435
   ClientWidth     =   6975
   LinkTopic       =   "Form1"
   LockControls    =   -1  'True
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   5460
   ScaleWidth      =   6975
   StartUpPosition =   3  '窗口缺省
   Begin MSAdodcLib.Adodc adcSchedule 
      Height          =   345
      Left            =   1410
      Top             =   4980
      Visible         =   0   'False
      Width           =   1725
      _ExtentX        =   3043
      _ExtentY        =   609
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
      Caption         =   "日程"
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
   Begin MSDataGridLib.DataGrid dgSchedule 
      Bindings        =   "frmSchedule.frx":0000
      Height          =   4215
      Left            =   120
      TabIndex        =   3
      Top             =   570
      Width           =   6735
      _ExtentX        =   11880
      _ExtentY        =   7435
      _Version        =   393216
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
   Begin VB.CommandButton btnDelete 
      Caption         =   "删　除"
      Height          =   435
      Left            =   3240
      TabIndex        =   2
      Top             =   4950
      Width           =   1245
   End
   Begin VB.CommandButton btnAdd 
      Caption         =   "添　加"
      Height          =   435
      Left            =   90
      TabIndex        =   1
      Top             =   4950
      Width           =   1245
   End
   Begin VB.Label Label1 
      Caption         =   "日程安排："
      Height          =   315
      Left            =   120
      TabIndex        =   0
      Top             =   150
      Width           =   1245
   End
End
Attribute VB_Name = "frmScheduleMaint"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Attribute VB_Ext_KEY = "RVB_UniqueId" ,"3DA812D20369"
Attribute VB_Ext_KEY = "RVB_ModelStereotype" ,"Form"
Option Explicit

'##ModelId=3DAF7E780039
Private Sub Command1_Click()

End Sub

'##ModelId=3DAFB5D802D3
Private Sub btnAdd_Click()
    frmSchedule.Show vbModal, Me
End Sub

'##ModelId=3DAF83410087
Private Sub Form_Load()
    DisplaySchedule
End Sub

'##ModelId=3DAF834100C6
Private Sub DisplaySchedule()
    Dim sch As fcdNormalUser.fcdSchedule
    Set sch = CreateObject("fcdNormalUser.fcdSchedule")
    
    Set adcSchedule.Recordset = sch.GetScheduleList(2)
End Sub
