VERSION 5.00
Object = "{67397AA1-7FB1-11D0-B148-00A0C922E820}#6.0#0"; "MSADODC.OCX"
Begin VB.Form frmAddressListView 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "选择姓名"
   ClientHeight    =   4740
   ClientLeft      =   45
   ClientTop       =   435
   ClientWidth     =   6555
   LinkTopic       =   "Form1"
   LockControls    =   -1  'True
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   4740
   ScaleWidth      =   6555
   StartUpPosition =   3  '窗口缺省
   Begin VB.ListBox lstContact 
      Height          =   1860
      Left            =   120
      TabIndex        =   12
      Top             =   1890
      Width           =   2565
   End
   Begin VB.TextBox txtName 
      Height          =   315
      Left            =   90
      TabIndex        =   10
      Top             =   1170
      Width           =   2565
   End
   Begin VB.Frame Frame1 
      Height          =   60
      Index           =   1
      Left            =   90
      TabIndex        =   9
      Top             =   3930
      Width           =   6285
   End
   Begin VB.Frame Frame1 
      Height          =   60
      Index           =   0
      Left            =   120
      TabIndex        =   8
      Top             =   630
      Width           =   6285
   End
   Begin MSAdodcLib.Adodc adcAddress 
      Height          =   345
      Left            =   2190
      Top             =   3000
      Visible         =   0   'False
      Width           =   2595
      _ExtentX        =   4577
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
      Caption         =   "AddressList"
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
   Begin VB.ListBox lstReceiver 
      Height          =   2580
      Left            =   3780
      TabIndex        =   7
      Top             =   1260
      Width           =   2565
   End
   Begin VB.CommandButton btnCancel 
      Caption         =   "取　消"
      Height          =   525
      Left            =   3870
      TabIndex        =   5
      Top             =   4110
      Width           =   1245
   End
   Begin VB.CommandButton btnOK 
      Caption         =   "确　定"
      Height          =   525
      Left            =   1050
      TabIndex        =   4
      Top             =   4110
      Width           =   1245
   End
   Begin VB.CommandButton btnSelect 
      Caption         =   ">>>>>"
      Height          =   345
      Left            =   2970
      TabIndex        =   3
      Top             =   2550
      Width           =   615
   End
   Begin VB.ComboBox cmbListCatalog 
      Height          =   300
      ItemData        =   "frmAddressListView.frx":0000
      Left            =   3780
      List            =   "frmAddressListView.frx":000A
      Style           =   2  'Dropdown List
      TabIndex        =   1
      Top             =   240
      Width           =   2535
   End
   Begin VB.Label Label1 
      BorderStyle     =   1  'Fixed Single
      Caption         =   "名称"
      Height          =   255
      Index           =   3
      Left            =   150
      TabIndex        =   11
      Top             =   1590
      Width           =   2535
   End
   Begin VB.Label Label1 
      Caption         =   "接收方："
      Height          =   315
      Index           =   2
      Left            =   3780
      TabIndex        =   6
      Top             =   840
      Width           =   1725
   End
   Begin VB.Label Label1 
      Caption         =   "键入名称或从列表中选择："
      Height          =   315
      Index           =   1
      Left            =   90
      TabIndex        =   2
      Top             =   840
      Width           =   2595
   End
   Begin VB.Label Label1 
      Caption         =   "显示名称来源："
      Height          =   285
      Index           =   0
      Left            =   150
      TabIndex        =   0
      Top             =   240
      Width           =   1725
   End
End
Attribute VB_Name = "frmAddressListView"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Attribute VB_Ext_KEY = "RVB_UniqueId" ,"3DA9359402BD"
Attribute VB_Ext_KEY = "RVB_ModelStereotype" ,"Form"
Option Explicit

'##ModelId=3DA935960194
Private Sub btnCancel_Click()
    Unload Me
End Sub

'##ModelId=3DA9359601B3
Private Sub btnOK_Click()
    '
End Sub

'##ModelId=3DA9359601D2
Private Sub cmbListCatalog_Click()
    DisplayContactList
End Sub

'##ModelId=3DA935960201
Private Sub Form_Load()
    '初试显示个人通讯录
    cmbListCatalog.ListIndex = 0
    DisplayContactList
End Sub

'##ModelId=3DA935960220
Private Sub DisplayContactList()
    Select Case cmbListCatalog.ListIndex
        Case 0
            Debug.Print 0
        Case 1
            Debug.Print 1
    End Select
End Sub
