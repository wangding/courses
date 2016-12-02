VERSION 5.00
Begin VB.Form frmLogon 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "登录"
   ClientHeight    =   2700
   ClientLeft      =   45
   ClientTop       =   435
   ClientWidth     =   4680
   LinkTopic       =   "Form1"
   LockControls    =   -1  'True
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   2700
   ScaleWidth      =   4680
   StartUpPosition =   3  '窗口缺省
   Begin VB.TextBox txtIPAddr 
      Height          =   345
      IMEMode         =   3  'DISABLE
      Left            =   1920
      TabIndex        =   8
      Top             =   1560
      Width           =   2505
   End
   Begin VB.CommandButton btnExit 
      Caption         =   "退　出"
      Height          =   435
      Left            =   3180
      TabIndex        =   6
      Top             =   2130
      Width           =   1245
   End
   Begin VB.CommandButton btnCancel 
      Caption         =   "取　消"
      Height          =   435
      Left            =   1770
      TabIndex        =   5
      Top             =   2130
      Width           =   1245
   End
   Begin VB.CommandButton btnLogon 
      Caption         =   "登　录"
      Height          =   435
      Left            =   390
      TabIndex        =   4
      Top             =   2130
      Width           =   1245
   End
   Begin VB.TextBox txtPassword 
      Height          =   345
      IMEMode         =   3  'DISABLE
      Left            =   1920
      PasswordChar    =   "*"
      TabIndex        =   3
      Top             =   960
      Width           =   2505
   End
   Begin VB.TextBox txtUserName 
      Height          =   345
      Left            =   1920
      TabIndex        =   1
      Top             =   330
      Width           =   2505
   End
   Begin VB.Label Label3 
      Caption         =   "IP地址："
      Height          =   285
      Left            =   390
      TabIndex        =   7
      Top             =   1590
      Width           =   1185
   End
   Begin VB.Label Label2 
      Caption         =   "口　令："
      Height          =   285
      Left            =   390
      TabIndex        =   2
      Top             =   990
      Width           =   1185
   End
   Begin VB.Label Label1 
      Caption         =   "用户名："
      Height          =   285
      Left            =   390
      TabIndex        =   0
      Top             =   330
      Width           =   1185
   End
End
Attribute VB_Name = "frmLogon"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Attribute VB_Ext_KEY = "RVB_UniqueId" ,"3DA812C50088"
Attribute VB_Ext_KEY = "RVB_ModelStereotype" ,"Form"
Option Explicit

'##ModelId=3DA842070235
Private mblnSuccessLogon As Boolean

'##ModelId=3DA842080098
Private mnUserRight As Integer

'##ModelId=3DA84B5801CF
Private mnUserID As Long

'##ModelId=3DA8420801E5
Private Sub btnCancel_Click()
    '清空登录信息
    txtUserName.Text = ""
    txtPassword.Text = ""
End Sub

'##ModelId=3DA84B580356
Private Sub btnExit_Click()
    '初始化
    
    mblnSuccessLogon = False
    mnUserRight = 0
    
    txtUserName.Text = ""
    txtPassword.Text = ""
    
    Unload Me
End Sub

'##ModelId=3DA8420901D5
Private Sub btnLogon_Click()
    '验证
    
    Dim rs As ADOR.Recordset
    Set rs = CreateObject("ADOR.Recordset")
    rs.Fields.Append "ID", adInteger, 4
    rs.Fields.Append "Name", adVarChar, 10
    rs.Fields.Append "LogonName", adVarChar, 10
    rs.Fields.Append "Password", adVarChar, 10
    rs.Fields.Append "IPAddr", adVarChar, 20
    rs.Fields.Append "MobileNumber", adVarChar, 11
    rs.Fields.Append "DeptID", adInteger, 4
    rs.Fields.Append "Permission", adInteger, 4
    
    rs.Open
    rs.AddNew
    rs!LogonName = txtUserName.Text
    rs!Password = txtPassword.Text
    rs!IPAddr = txtIPAddr.Text
        

    Dim logon As fcdNormalUser.fcdLogonVerify
    Set logon = CreateObject("fcdNormalUser.fcdLogonVerify")
    mblnSuccessLogon = logon.verify(rs)
    
    If mblnSuccessLogon Then
        txtUserName.Text = ""
        txtPassword.Text = ""
        MsgBox "OK! Welcome to " & rs!Name & "."
    End If
    
End Sub

'##ModelId=3DA842090293
Public Property Get IsLogon() As Boolean
    IsLogon = mblnSuccessLogon
End Property

'##ModelId=3DA8420A0097
Public Property Get Right() As Integer
    Right = mnUserRight
End Property

'##ModelId=3DA8420A02A2
Private Sub Form_Load()
    ' 初始化
    mblnSuccessLogon = False
    mnUserRight = 0
End Sub

'##ModelId=3DA84B590191
Public Property Get UserID() As Long
    UserID = mnUserID
End Property

'##ModelId=3DA9260B005B
Private Sub Form_Unload(Cancel As Integer)
    txtUserName.Text = ""
    txtPassword.Text = ""
End Sub
