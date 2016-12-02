VERSION 5.00
Begin VB.Form frmSysUsers 
   Caption         =   "账户管理"
   ClientHeight    =   5730
   ClientLeft      =   60
   ClientTop       =   450
   ClientWidth     =   6285
   LinkTopic       =   "Form1"
   ScaleHeight     =   5730
   ScaleWidth      =   6285
   StartUpPosition =   2  '屏幕中心
   Begin VB.TextBox Text5 
      Height          =   375
      Left            =   3240
      TabIndex        =   25
      Top             =   1440
      Width           =   2175
   End
   Begin VB.CheckBox Check1 
      Caption         =   "添加到全局通讯组"
      Height          =   375
      Left            =   3240
      TabIndex        =   22
      Top             =   4560
      Width           =   1815
   End
   Begin VB.CommandButton Command5 
      Caption         =   "添加"
      Height          =   375
      Left            =   1560
      TabIndex        =   21
      Top             =   5280
      Width           =   1215
   End
   Begin VB.CommandButton Command4 
      Caption         =   "修改"
      Height          =   375
      Left            =   4200
      TabIndex        =   20
      Top             =   5280
      Width           =   1215
   End
   Begin VB.CommandButton Command3 
      Caption         =   "删除"
      Height          =   375
      Left            =   2880
      TabIndex        =   19
      Top             =   5280
      Width           =   1215
   End
   Begin VB.CommandButton Command2 
      Caption         =   "+..."
      Height          =   375
      Left            =   5520
      TabIndex        =   18
      Top             =   3600
      Width           =   495
   End
   Begin VB.ListBox List3 
      Height          =   960
      Left            =   3240
      TabIndex        =   17
      Top             =   3600
      Width           =   2175
   End
   Begin VB.OptionButton Option2 
      Caption         =   "否"
      Height          =   255
      Left            =   3960
      TabIndex        =   16
      Top             =   3240
      Width           =   615
   End
   Begin VB.OptionButton Option1 
      Caption         =   "是"
      Height          =   255
      Left            =   3240
      TabIndex        =   15
      Top             =   3240
      Width           =   615
   End
   Begin VB.ComboBox Combo2 
      Height          =   300
      Left            =   3240
      TabIndex        =   14
      Top             =   2760
      Width           =   2175
   End
   Begin VB.ComboBox Combo1 
      Height          =   300
      Left            =   3240
      TabIndex        =   13
      Top             =   2400
      Width           =   2175
   End
   Begin VB.TextBox Text4 
      Height          =   375
      IMEMode         =   3  'DISABLE
      Left            =   3240
      PasswordChar    =   "*"
      TabIndex        =   12
      Top             =   1920
      Width           =   2175
   End
   Begin VB.TextBox Text3 
      Height          =   375
      IMEMode         =   3  'DISABLE
      Left            =   3240
      PasswordChar    =   "*"
      TabIndex        =   11
      Top             =   960
      Width           =   2175
   End
   Begin VB.TextBox Text2 
      Height          =   375
      Left            =   3240
      TabIndex        =   10
      Top             =   480
      Width           =   2175
   End
   Begin VB.TextBox Text1 
      Height          =   375
      Left            =   3240
      TabIndex        =   9
      Top             =   0
      Width           =   2175
   End
   Begin VB.ListBox ListUsers 
      Height          =   4200
      Left            =   120
      TabIndex        =   0
      Top             =   120
      Width           =   1935
   End
   Begin VB.Label Label10 
      Caption         =   "ip"
      Height          =   255
      Left            =   2400
      TabIndex        =   24
      Top             =   1560
      Width           =   735
   End
   Begin VB.Label Label9 
      Caption         =   "add from exchange"
      Height          =   375
      Left            =   5520
      TabIndex        =   23
      Top             =   3960
      Width           =   735
   End
   Begin VB.Label Label8 
      Caption         =   "系统日志订阅权限"
      Height          =   375
      Left            =   2400
      TabIndex        =   8
      Top             =   3120
      Width           =   855
   End
   Begin VB.Label Label7 
      Caption         =   "安全组"
      Height          =   255
      Left            =   2400
      TabIndex        =   7
      Top             =   2760
      Width           =   615
   End
   Begin VB.Label Label6 
      Caption         =   "电子邮件"
      Height          =   255
      Left            =   2400
      TabIndex        =   6
      Top             =   3600
      Width           =   855
   End
   Begin VB.Label Label5 
      Caption         =   "登录名"
      Height          =   255
      Left            =   2400
      TabIndex        =   5
      Top             =   600
      Width           =   615
   End
   Begin VB.Label Label4 
      Caption         =   "口令"
      Height          =   255
      Left            =   2400
      TabIndex        =   4
      Top             =   1080
      Width           =   615
   End
   Begin VB.Label Label3 
      Caption         =   "手机号"
      Height          =   255
      Left            =   2400
      TabIndex        =   3
      Top             =   2040
      Width           =   615
   End
   Begin VB.Label Label2 
      Caption         =   "所属部门"
      Height          =   255
      Left            =   2400
      TabIndex        =   2
      Top             =   2400
      Width           =   855
   End
   Begin VB.Label Label1 
      Caption         =   "姓名"
      Height          =   255
      Left            =   2400
      TabIndex        =   1
      Top             =   120
      Width           =   615
   End
End
Attribute VB_Name = "frmSysUsers"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Attribute VB_Ext_KEY = "RVB_UniqueId" ,"3DA9359D0230"
Attribute VB_Ext_KEY = "RVB_ModelStereotype" ,"Form"
'##ModelId=3DA9262401DE
Private Sub Form_Load()
    Dim f As New fcdAdminUser.fcdSysUserandDept
    Dim rs As New Recordset
    Set rs = f.GetUserList()
    rs.MoveFirst
    Dim i As Integer
    For i = 0 To rs.RecordCount - 1
        ListUsers.AddItem rs!Name, i
        rs.MoveNext
    Next
    rs.Close
End Sub

