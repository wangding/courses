VERSION 5.00
Object = "{67397AA1-7FB1-11D0-B148-00A0C922E820}#6.0#0"; "MSADODC.OCX"
Object = "{F0D2F211-CCB0-11D0-A316-00AA00688B10}#1.0#0"; "MSDATLST.OCX"
Begin VB.Form frmPvtContactListMaint 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "个人通讯录管理"
   ClientHeight    =   5550
   ClientLeft      =   45
   ClientTop       =   435
   ClientWidth     =   11910
   LinkTopic       =   "Form1"
   LockControls    =   -1  'True
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   5550
   ScaleWidth      =   11910
   StartUpPosition =   3  '窗口缺省
   Begin MSAdodcLib.Adodc adcContacts 
      Height          =   375
      Left            =   120
      Top             =   5070
      Visible         =   0   'False
      Width           =   2205
      _ExtentX        =   3889
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
      Caption         =   "Contacts"
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
   Begin VB.CommandButton btnCancel 
      Cancel          =   -1  'True
      Caption         =   "取　消"
      Height          =   435
      Left            =   10530
      TabIndex        =   23
      Top             =   5010
      Width           =   1245
   End
   Begin VB.CommandButton btnOK 
      Caption         =   "确　定"
      Default         =   -1  'True
      Height          =   435
      Left            =   8580
      TabIndex        =   22
      Top             =   5040
      Width           =   1245
   End
   Begin VB.Frame Frame2 
      Caption         =   "联系人管理"
      Height          =   4695
      Left            =   90
      TabIndex        =   12
      Top             =   150
      Width           =   5745
      Begin VB.TextBox txtMobileNumber 
         DataField       =   "MobileNumber"
         DataSource      =   "adcContacts"
         Height          =   345
         Left            =   3120
         TabIndex        =   24
         Top             =   1350
         Width           =   2415
      End
      Begin VB.CommandButton btnAddContact 
         Caption         =   "添　加"
         Height          =   435
         Left            =   180
         TabIndex        =   21
         Top             =   4080
         Width           =   1245
      End
      Begin VB.CommandButton btnUpdateContact 
         Caption         =   "更　改"
         Height          =   435
         Left            =   2310
         TabIndex        =   20
         Top             =   4080
         Width           =   1245
      End
      Begin VB.CommandButton btnDeleteContact 
         Caption         =   "删　除"
         Height          =   435
         Left            =   4230
         TabIndex        =   19
         Top             =   4080
         Width           =   1245
      End
      Begin VB.TextBox txtName 
         DataField       =   "Name"
         DataSource      =   "adcContacts"
         Height          =   345
         Left            =   3120
         TabIndex        =   16
         Top             =   600
         Width           =   2415
      End
      Begin MSDataListLib.DataList dlstContacts 
         Bindings        =   "frmPvtAddressList.frx":0000
         Height          =   3210
         Left            =   180
         TabIndex        =   14
         Top             =   600
         Width           =   2595
         _ExtentX        =   4577
         _ExtentY        =   5662
         _Version        =   393216
         ListField       =   "Name"
      End
      Begin MSDataListLib.DataCombo dcmContactGroup 
         Bindings        =   "frmPvtAddressList.frx":001A
         Height          =   330
         Left            =   3120
         TabIndex        =   18
         Top             =   2130
         Width           =   2415
         _ExtentX        =   4260
         _ExtentY        =   582
         _Version        =   393216
         ListField       =   "Name"
         Text            =   ""
      End
      Begin VB.Label Label8 
         Caption         =   "通信组："
         Height          =   225
         Left            =   3120
         TabIndex        =   25
         Top             =   1860
         Width           =   1245
      End
      Begin VB.Label Label7 
         Caption         =   "手机号："
         Height          =   225
         Left            =   3120
         TabIndex        =   17
         Top             =   1050
         Width           =   1245
      End
      Begin VB.Label Label6 
         Caption         =   "姓名："
         Height          =   225
         Left            =   3120
         TabIndex        =   15
         Top             =   300
         Width           =   1245
      End
      Begin VB.Label Label2 
         Caption         =   "联系人："
         Height          =   225
         Left            =   180
         TabIndex        =   13
         Top             =   300
         Width           =   1245
      End
   End
   Begin VB.Frame Frame1 
      Caption         =   "通信组管理"
      Height          =   4695
      Left            =   6030
      TabIndex        =   0
      Top             =   150
      Width           =   5745
      Begin VB.CommandButton btnUpdateGroup 
         Caption         =   "更　改"
         Height          =   435
         Left            =   2280
         TabIndex        =   11
         Top             =   4110
         Width           =   1245
      End
      Begin VB.CommandButton btnDeleteGroup 
         Caption         =   "删　除"
         Height          =   435
         Left            =   4260
         TabIndex        =   10
         Top             =   4110
         Width           =   1245
      End
      Begin VB.CommandButton btnAddGroup 
         Caption         =   "添　加"
         Height          =   435
         Left            =   240
         TabIndex        =   9
         Top             =   4110
         Width           =   1245
      End
      Begin VB.TextBox Text1 
         DataField       =   "Description"
         DataSource      =   "adcGroups"
         Height          =   615
         Left            =   2940
         MultiLine       =   -1  'True
         ScrollBars      =   2  'Vertical
         TabIndex        =   7
         Top             =   1380
         Width           =   2595
      End
      Begin VB.TextBox txtGroupName 
         DataField       =   "Name"
         DataSource      =   "adcGroups"
         Height          =   345
         Left            =   2940
         TabIndex        =   5
         Top             =   630
         Width           =   2595
      End
      Begin MSDataListLib.DataList dlstContactGroup 
         Bindings        =   "frmPvtAddressList.frx":0032
         Height          =   3210
         Left            =   210
         TabIndex        =   2
         Top             =   630
         Width           =   2595
         _ExtentX        =   4577
         _ExtentY        =   5662
         _Version        =   393216
         ListField       =   "Name"
      End
      Begin MSDataListLib.DataList dlstGroupMember 
         DataField       =   "Name"
         DataSource      =   "adcMembers"
         Height          =   1530
         Left            =   2940
         TabIndex        =   3
         Top             =   2370
         Width           =   2595
         _ExtentX        =   4577
         _ExtentY        =   2699
         _Version        =   393216
         Locked          =   -1  'True
      End
      Begin VB.Label Label5 
         Caption         =   "通信组成员："
         Height          =   225
         Left            =   2940
         TabIndex        =   8
         Top             =   2100
         Width           =   1245
      End
      Begin VB.Label Label4 
         Caption         =   "通信组描述："
         Height          =   225
         Left            =   2940
         TabIndex        =   6
         Top             =   1080
         Width           =   1245
      End
      Begin VB.Label Label3 
         Caption         =   "通信组名称："
         Height          =   225
         Left            =   2940
         TabIndex        =   4
         Top             =   330
         Width           =   1245
      End
      Begin VB.Label Label1 
         Caption         =   "通信组："
         Height          =   225
         Left            =   240
         TabIndex        =   1
         Top             =   330
         Width           =   1245
      End
   End
   Begin MSAdodcLib.Adodc adcGroups 
      Height          =   375
      Left            =   2550
      Top             =   5070
      Visible         =   0   'False
      Width           =   2205
      _ExtentX        =   3889
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
      Caption         =   "Groups"
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
   Begin MSAdodcLib.Adodc adcMembers 
      Height          =   375
      Left            =   5010
      Top             =   5070
      Visible         =   0   'False
      Width           =   2205
      _ExtentX        =   3889
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
      Caption         =   "Members"
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
End
Attribute VB_Name = "frmPvtContactListMaint"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Attribute VB_Ext_KEY = "RVB_UniqueId" ,"3DA812D50004"
Attribute VB_Ext_KEY = "RVB_ModelStereotype" ,"Form"
Option Explicit

'##ModelId=3DAC28FE03CA
Private Sub btnCancel_Click()
    Unload Me
End Sub

'##ModelId=3DAC28FF0011
Private Sub btnOK_Click()
    '
End Sub

'##ModelId=3DAC28FF0040
Private Sub dlstContactGroup_Click()
    adcGroups.Recordset.AbsolutePosition = dlstContactGroup.SelectedItem
End Sub

'##ModelId=3DAC28FF005F
Private Sub dlstContacts_Click()
    '
    adcContacts.Recordset.AbsolutePosition = dlstContacts.SelectedItem
    dcmContactGroup.Text = GetGroupNamebyID(adcGroups.Recordset, adcContacts.Recordset!GroupID)
End Sub

'##ModelId=3DAC28FF008E
Private Sub Form_Load()
    DisplayContacts
    DisplayGroups
End Sub

'##ModelId=3DAC28FF00BC
Private Sub DisplayContacts()
    '
    Dim ContMaint As fcdNormalUser.fcdContactListMaint
    Set ContMaint = CreateObject("fcdNormalUser.fcdContactListMaint")
    
    Set adcContacts.Recordset = ContMaint.GetContacts(1)
    adcContacts.Recordset.MoveFirst
End Sub

'##ModelId=3DAC28FF00EB
Private Sub DisplayGroups()
    '
    Dim ContMaint As fcdNormalUser.fcdContactListMaint
    Set ContMaint = CreateObject("fcdNormalUser.fcdContactListMaint")
    
    Set adcGroups.Recordset = ContMaint.GetGroups(1)
    adcGroups.Recordset.MoveFirst
End Sub

'##ModelId=3DAC28FF010A
Private Function GetGroupNamebyID(rs As Recordset, id As Long) As String
    On Error Resume Next
    rs.Filter = "ID = '" & id & "'"
    GetGroupNamebyID = rs!Name
    
End Function
