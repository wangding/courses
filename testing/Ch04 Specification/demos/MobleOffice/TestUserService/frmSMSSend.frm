VERSION 5.00
Object = "{67397AA1-7FB1-11D0-B148-00A0C922E820}#6.0#0"; "MSADODC.OCX"
Object = "{F0D2F211-CCB0-11D0-A316-00AA00688B10}#1.0#0"; "MSDATLST.OCX"
Begin VB.Form frmSMSSend 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "短信发送"
   ClientHeight    =   3720
   ClientLeft      =   45
   ClientTop       =   435
   ClientWidth     =   8715
   LinkTopic       =   "Form1"
   LockControls    =   -1  'True
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   3720
   ScaleWidth      =   8715
   StartUpPosition =   3  '窗口缺省
   Begin VB.TextBox txtSMSContent 
      Height          =   2055
      Left            =   1410
      MultiLine       =   -1  'True
      ScrollBars      =   2  'Vertical
      TabIndex        =   7
      Top             =   840
      Width           =   3465
   End
   Begin MSAdodcLib.Adodc adcReceiver 
      Height          =   345
      Left            =   2880
      Top             =   3120
      Visible         =   0   'False
      Width           =   2175
      _ExtentX        =   3836
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
      Caption         =   "Receiver"
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
   Begin MSAdodcLib.Adodc adcSysPhrase 
      Height          =   330
      Left            =   5550
      Top             =   2970
      Visible         =   0   'False
      Width           =   2955
      _ExtentX        =   5212
      _ExtentY        =   582
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
      Caption         =   "SysPhrase"
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
   Begin MSDataListLib.DataList dlstSysPhrase 
      Bindings        =   "frmSMSSend.frx":0000
      Height          =   690
      Left            =   5550
      TabIndex        =   6
      Top             =   2205
      Width           =   2955
      _ExtentX        =   5212
      _ExtentY        =   1217
      _Version        =   393216
      ListField       =   "Phrase"
   End
   Begin MSAdodcLib.Adodc adcPvtPhrase 
      Height          =   330
      Left            =   5550
      Top             =   3330
      Visible         =   0   'False
      Width           =   2955
      _ExtentX        =   5212
      _ExtentY        =   582
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
      Caption         =   "PvtPhrase"
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
   Begin MSDataListLib.DataList dlstPrvPhrase 
      Bindings        =   "frmSMSSend.frx":001B
      Height          =   1320
      Left            =   5550
      TabIndex        =   5
      Top             =   840
      Width           =   2955
      _ExtentX        =   5212
      _ExtentY        =   2328
      _Version        =   393216
      ListField       =   "Phrase"
   End
   Begin VB.CommandButton btnContact 
      Caption         =   "接收方..."
      Height          =   315
      Left            =   330
      TabIndex        =   4
      Top             =   300
      Width           =   1035
   End
   Begin VB.CommandButton btnAddToContent 
      Caption         =   "<<<<<"
      Height          =   1185
      Left            =   5100
      TabIndex        =   2
      Top             =   1260
      Width           =   285
   End
   Begin VB.CommandButton btnSend 
      Caption         =   "发　送"
      Height          =   405
      Left            =   1380
      TabIndex        =   1
      Top             =   3060
      Width           =   1245
   End
   Begin MSDataListLib.DataCombo cmbReceiver 
      Bindings        =   "frmSMSSend.frx":0036
      Height          =   330
      Left            =   1410
      TabIndex        =   8
      Top             =   300
      Width           =   2325
      _ExtentX        =   4101
      _ExtentY        =   582
      _Version        =   393216
      ListField       =   "MobileNumber"
      Text            =   ""
   End
   Begin VB.Label Label1 
      Caption         =   "常用语："
      Height          =   315
      Index           =   2
      Left            =   5490
      TabIndex        =   3
      Top             =   315
      Width           =   1035
   End
   Begin VB.Label Label1 
      Caption         =   "内容："
      Height          =   315
      Index           =   1
      Left            =   330
      TabIndex        =   0
      Top             =   840
      Width           =   1035
   End
End
Attribute VB_Name = "frmSMSSend"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Attribute VB_Ext_KEY = "RVB_UniqueId" ,"3DA8139D0245"
Attribute VB_Ext_KEY = "RVB_ModelStereotype" ,"Form"
Option Explicit

'##ModelId=3DA92609028E
Private Sub btnContact_Click()
    frmContactListView.Show vbModal, Me
End Sub

'##ModelId=3DA93E5A020E
Private Sub btnSend_Click()
    '
End Sub

'##ModelId=3DAF7170020F
Private Sub Form_Load()
    DisplaySysPhrase
    DisplayPvtPhrase
    DisplayMURMobile
End Sub

'##ModelId=3DAF7170024D
Private Sub DisplaySysPhrase()
    Dim sms As fcdNormalUser.fcdSMSSend
    Set sms = CreateObject("fcdNormalUser.fcdSMSSend")
    
    Set adcSysPhrase.Recordset = sms.GetSysPhrase()
End Sub

'##ModelId=3DAF7170028C
Private Sub DisplayPvtPhrase()
    Dim sms As fcdNormalUser.fcdSMSSend
    Set sms = CreateObject("fcdNormalUser.fcdSMSSend")
    
    Set adcPvtPhrase.Recordset = sms.GetPvtPhrase(2)
End Sub

'##ModelId=3DAF717002BB
Private Sub DisplayMURMobile()
    Dim sms As fcdNormalUser.fcdSMSSend
    Set sms = CreateObject("fcdNormalUser.fcdSMSSend")
    
    Set adcReceiver.Recordset = sms.GetMRUMobile(2)
End Sub
