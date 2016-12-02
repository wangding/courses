VERSION 5.00
Object = "{67397AA1-7FB1-11D0-B148-00A0C922E820}#6.0#0"; "MSADODC.OCX"
Object = "{F0D2F211-CCB0-11D0-A316-00AA00688B10}#1.0#0"; "MSDATLST.OCX"
Begin VB.Form frmPvtPhrase 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "个人常用语管理"
   ClientHeight    =   5190
   ClientLeft      =   45
   ClientTop       =   435
   ClientWidth     =   4650
   LinkTopic       =   "Form1"
   LockControls    =   -1  'True
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   5190
   ScaleWidth      =   4650
   StartUpPosition =   3  '窗口缺省
   Begin VB.CheckBox chkUseSysPhrase 
      Caption         =   "合并系统常用语"
      Height          =   315
      Left            =   1620
      TabIndex        =   7
      Top             =   210
      Width           =   1815
   End
   Begin VB.CommandButton btnSave 
      Caption         =   "保　存"
      Height          =   345
      Left            =   3600
      TabIndex        =   6
      Top             =   210
      Width           =   915
   End
   Begin VB.CommandButton btnAdd 
      Caption         =   "添　加"
      Height          =   405
      Left            =   150
      TabIndex        =   5
      Top             =   4710
      Width           =   915
   End
   Begin VB.CommandButton btnModify 
      Caption         =   "更　改"
      Height          =   405
      Left            =   1890
      TabIndex        =   4
      Top             =   4710
      Width           =   915
   End
   Begin VB.CommandButton btnDelete 
      Caption         =   "删　除"
      Height          =   405
      Left            =   3600
      TabIndex        =   3
      Top             =   4680
      Width           =   915
   End
   Begin VB.TextBox txtPhrase 
      Height          =   345
      Left            =   150
      TabIndex        =   2
      Top             =   4230
      Width           =   4365
   End
   Begin MSAdodcLib.Adodc adcPvtPhrase 
      Height          =   375
      Left            =   420
      Top             =   2610
      Visible         =   0   'False
      Width           =   2745
      _ExtentX        =   4842
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
      Caption         =   "个人常用语"
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
   Begin MSDataListLib.DataList dlstPvtPhrase 
      Bindings        =   "frmPvtPhrase.frx":0000
      Height          =   3210
      Left            =   150
      TabIndex        =   1
      Top             =   600
      Width           =   4365
      _ExtentX        =   7699
      _ExtentY        =   5662
      _Version        =   393216
      ListField       =   "Phrase"
      BoundColumn     =   "Phrase"
   End
   Begin VB.Label Label2 
      Caption         =   "常用语："
      Height          =   285
      Left            =   150
      TabIndex        =   8
      Top             =   3900
      Width           =   1245
   End
   Begin VB.Label Label1 
      Caption         =   "个人常用语："
      Height          =   285
      Left            =   150
      TabIndex        =   0
      Top             =   210
      Width           =   1245
   End
End
Attribute VB_Name = "frmPvtPhrase"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Attribute VB_Ext_KEY = "RVB_UniqueId" ,"3DA812CB02AB"
Attribute VB_Ext_KEY = "RVB_ModelStereotype" ,"Form"
Option Explicit

'##ModelId=3DAC0799006D
Private Sub btnModify_Click()
    If txtPhrase.Text <> "" Then
        adcPvtPhrase.Recordset!Phrase = txtPhrase

    End If
End Sub

'##ModelId=3DAC07990128
Private Sub btnSave_Click()
    Dim pvtPhrase As fcdNormalUser.fcdPvtPhrase
    
    Set pvtPhrase = CreateObject("fcdNormalUser.fcdPvtPhrase")
    pvtPhrase.SavePvtPhrase adcPvtPhrase.Recordset
End Sub

'##ModelId=3DAC079901E4
Private Sub dlstPvtPhrase_Click()
    adcPvtPhrase.Recordset.AbsolutePosition = dlstPvtPhrase.SelectedItem
    txtPhrase.Text = adcPvtPhrase.Recordset!Phrase
End Sub

'##ModelId=3DAC079902BF
Private Sub Form_Load()
    DisplayPvtPhrase
End Sub

'##ModelId=3DAC0799038A
Private Sub DisplayPvtPhrase()
    Dim pvtPhrase As fcdNormalUser.fcdPvtPhrase
    
    Set pvtPhrase = CreateObject("fcdNormalUser.fcdPvtPhrase")
    
    Set adcPvtPhrase.Recordset = pvtPhrase.GetPvtPhraseList(2)
End Sub
