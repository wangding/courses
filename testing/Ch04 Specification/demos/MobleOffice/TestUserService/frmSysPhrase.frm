VERSION 5.00
Object = "{67397AA1-7FB1-11D0-B148-00A0C922E820}#6.0#0"; "MSADODC.OCX"
Object = "{F0D2F211-CCB0-11D0-A316-00AA00688B10}#1.0#0"; "MSDATLST.OCX"
Begin VB.Form frmSysPhrase 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "系统常用语管理"
   ClientHeight    =   4920
   ClientLeft      =   45
   ClientTop       =   435
   ClientWidth     =   4260
   LinkTopic       =   "Form1"
   LockControls    =   -1  'True
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   4920
   ScaleWidth      =   4260
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  '屏幕中心
   Begin MSAdodcLib.Adodc adcSysPhrase 
      Height          =   345
      Left            =   840
      Top             =   2340
      Visible         =   0   'False
      Width           =   2355
      _ExtentX        =   4154
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
      Caption         =   "系统常用语"
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
   Begin VB.CommandButton btnSave 
      Caption         =   "保　存"
      Height          =   375
      Left            =   2970
      TabIndex        =   6
      Top             =   4470
      Width           =   1125
   End
   Begin VB.CommandButton btnDelete 
      Caption         =   "删　除"
      Height          =   375
      Left            =   1530
      TabIndex        =   5
      Top             =   4470
      Width           =   1125
   End
   Begin MSAdodcLib.Adodc adcSysPhrases 
      Height          =   375
      Left            =   810
      Top             =   1800
      Visible         =   0   'False
      Width           =   2985
      _ExtentX        =   5265
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
      Caption         =   "系统常用语列表"
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
   Begin MSDataListLib.DataList dblSysPhrase 
      Bindings        =   "frmSysPhrase.frx":0000
      Height          =   3210
      Left            =   120
      TabIndex        =   2
      Top             =   390
      Width           =   3975
      _ExtentX        =   7011
      _ExtentY        =   5662
      _Version        =   393216
      ListField       =   "Phrase"
   End
   Begin VB.CommandButton btnAdd 
      Caption         =   "添　加"
      Height          =   375
      Left            =   120
      TabIndex        =   1
      Top             =   4470
      Width           =   1125
   End
   Begin VB.TextBox txtPhrase 
      DataField       =   "Phrase"
      Height          =   345
      Left            =   120
      TabIndex        =   0
      Top             =   3960
      Width           =   3975
   End
   Begin VB.Label Label2 
      Caption         =   "系统常用语："
      Height          =   285
      Left            =   120
      TabIndex        =   4
      Top             =   3690
      Width           =   1245
   End
   Begin VB.Label Label1 
      Caption         =   "系统常用语："
      Height          =   285
      Left            =   120
      TabIndex        =   3
      Top             =   120
      Width           =   1245
   End
End
Attribute VB_Name = "frmSysPhrase"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Attribute VB_Ext_KEY = "RVB_UniqueId" ,"3DA8149802C2"
Attribute VB_Ext_KEY = "RVB_ModelStereotype" ,"Form"
Option Explicit

'##ModelId=3DABB1AE0123
Private Sub cmdModify_Click()

End Sub

'##ModelId=3DB46F690380
Private Sub btnAdd_Click()
    SetNew
    txtPhrase.SetFocus
End Sub

'##ModelId=3DB46F6903AF
Private Sub btnDelete_Click()
    Remove
End Sub

'##ModelId=3DB46F6903DE
Private Sub btnSave_Click()
    Save
End Sub

'##ModelId=3DB46F6A0025
Private Sub dblSysPhrase_Click()
    GetPhrase
End Sub

'##ModelId=3DAFBCE602B9
Private Sub Form_Load()
    DisplaySysPhrase
End Sub

'##ModelId=3DB46F6A0063
Private Sub DisplaySysPhrase()
    Dim sp As fcdAdminUser.fcdSysPhrase
    Set sp = CreateObject("fcdAdminUser.fcdSysPhrase")
    Dim rs As ADOR.Recordset
    Set rs = sp.GetSysPhraseList()
    'If Not rs.EOF Then rs.MoveFirst
    
    Set adcSysPhrases.Recordset = rs
   
End Sub

'##ModelId=3DB46F6A0092
Private Sub SetNew()
    On Error GoTo SetNewErr
    Dim objPhrase As fcdAdminUser.fcdSysPhrase
    Dim rs As Recordset

    Set objPhrase = CreateObject("fcdAdminUser.fcdSysPhrase")
    Set rs = objPhrase.GetEmptyRecordset()

    Set adcSysPhrase.Recordset = rs
    Set txtPhrase.DataSource = adcSysPhrase
    
    Exit Sub
    
SetNewErr:
    MsgBox Err.Number & " - " & Err.Description
    
End Sub

'##ModelId=3DB46F6A00B2
Private Sub Save()
    On Error GoTo SaveErr
    Dim objPhrase As fcdAdminUser.fcdSysPhrase
    Set objPhrase = CreateObject("fcdAdminUser.fcdSysPhrase")

    objPhrase.SaveSysPhrase adcSysPhrase.Recordset
    If Len(Err.Description) Then
        MsgBox Err.Number & " - " & Err.Description
    End If
    
    Exit Sub
SaveErr:
    MsgBox Err.Number & " - " & Err.Description
    
End Sub

'##ModelId=3DB46F6A00E0
Private Sub GetPhrase()
    Dim rs As Recordset, lngPhraseID As Long
    Dim objPhrase As fcdAdminUser.fcdSysPhrase
    
    If Not IsNull(dblSysPhrase.SelectedItem) Then
        adcSysPhrases.Recordset.AbsolutePosition = dblSysPhrase.SelectedItem
        lngPhraseID = adcSysPhrases.Recordset!id
    End If
    Set adcSysPhrase.Recordset = adcSysPhrases.Recordset
    txtPhrase.Text = adcSysPhrases.Recordset!Phrase

End Sub

'##ModelId=3DB46F6A010F
Private Sub Remove()
    On Error GoTo RemoveErr
    Dim objPhrase As fcdAdminUser.fcdSysPhrase

    Set objPhrase = CreateObject("fcdAdminUser.fcdSysPhrase")
    objPhrase.DeleteSysPhrase adcSysPhrase.Recordset!id
    If Len(Err.Description) Then
        MsgBox Err.Number & " - " & Err.Description
    Else
        txtPhrase.Text = ""
        DisplaySysPhrase
    End If
    
    Exit Sub
    
RemoveErr:
    MsgBox Err.Number & " - " & Err.Description
End Sub
