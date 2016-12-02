VERSION 5.00
Begin VB.Form frmContactListView 
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
   Begin VB.CommandButton btnDelete 
      Caption         =   "<——"
      Height          =   225
      Left            =   2940
      TabIndex        =   13
      Top             =   3180
      Width           =   615
   End
   Begin VB.ListBox lstContact 
      Height          =   1860
      Left            =   120
      TabIndex        =   12
      Top             =   1890
      Width           =   2565
   End
   Begin VB.TextBox txtNamePattern 
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
   Begin VB.ListBox lstReceiver 
      Height          =   2580
      Left            =   3780
      TabIndex        =   7
      Top             =   1260
      Width           =   2565
   End
   Begin VB.CommandButton btnCancel 
      Caption         =   "取　消"
      Height          =   435
      Left            =   3870
      TabIndex        =   5
      Top             =   4110
      Width           =   1245
   End
   Begin VB.CommandButton btnOK 
      Caption         =   "确　定"
      Height          =   435
      Left            =   1050
      TabIndex        =   4
      Top             =   4110
      Width           =   1245
   End
   Begin VB.CommandButton btnSelect 
      Caption         =   "——>"
      Height          =   225
      Left            =   2940
      TabIndex        =   3
      Top             =   2490
      Width           =   615
   End
   Begin VB.ComboBox cmbListCatalog 
      Height          =   300
      ItemData        =   "frmContactListView.frx":0000
      Left            =   3780
      List            =   "frmContactListView.frx":000A
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
Attribute VB_Name = "frmContactListView"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Attribute VB_Ext_KEY = "RVB_UniqueId" ,"3DA9261602EA"
Attribute VB_Ext_KEY = "RVB_ModelStereotype" ,"Form"
Option Explicit
'##ModelId=3DA93E57029A
Private rsContactList As Recordset
'##ModelId=3DA93E580058
Private rsGroupList As Recordset

'##ModelId=3DA926180347
Private Sub btnCancel_Click()
    Unload Me
End Sub

'##ModelId=3DA926180376
Private Sub btnOK_Click()
    '
End Sub

'##ModelId=3DAC07A7039B
Private Sub btnSelect_Click()
    '检查权限
    If frmLogon.Right = 5 Or frmLogon.Right = 1 Then
        If lstReceiver.ListCount = 0 Then
        
        End If
    Else
        
    End If
End Sub

'##ModelId=3DA9261803A5
Private Sub cmbListCatalog_Click()
    DisplayContactList
End Sub



'##ModelId=3DA9261803C4
Private Sub Form_Load()
    '初试显示个人通讯录
    cmbListCatalog.ListIndex = 0
    DisplayContactList
End Sub

'##ModelId=3DA92619000B
Private Sub DisplayContactList()
    Dim clm As fcdNormalUser.fcdSMSSend
    
    Set clm = CreateObject("fcdNormalUser.fcdSMSSend")
    
    lstContact.Clear
    
    Debug.Print "User Right = " & frmLogon.Right
    
    Select Case cmbListCatalog.ListIndex
        Case 0  '个人通讯录
'            Set rsContactList = clm.GetPvtContactList(txtNamePattern)
'
'            '检查用户的权限
'            If Not (frmLogon.Right = 5 Or frmLogon.Right = 1) Then
'                Set rsGroupList = clm.GetPvtGroupList(txtNamePattern)
'            End If
            
        Case 1  '全局通讯录
'            Set rsContactList = clm.GetGloableContact(txtNamePattern)
'
'            '检查用户的权限
'            If Not (frmLogon.Right = 5 Or frmLogon.Right = 1) Then
'                Set rsGroupList = clm.GetGloableGroup(txtNamePattern)
'            End If
    End Select
    
    FillContactList
End Sub

'##ModelId=3DA93E5801ED
Private Sub FillContactList()

    '检查用户的权限
    If Not (frmLogon.Right = 5 Or frmLogon.Right = 1) Then
        rsGroupList.MoveFirst
        Do Until rsGroupList.EOF
            lstContact.AddItem rsGroupList!Name
            rsGroupList.MoveNext
        Loop
    End If
    
    rsContactList.MoveFirst
    Do Until rsContactList.EOF
        lstContact.AddItem rsContactList!Name
        rsContactList.MoveNext
    Loop
End Sub
