VERSION 5.00
Object = "{67397AA1-7FB1-11D0-B148-00A0C922E820}#6.0#0"; "MSADODC.OCX"
Object = "{F0D2F211-CCB0-11D0-A316-00AA00688B10}#1.0#0"; "MSDATLST.OCX"
Begin VB.Form frmSysDepartment 
   Caption         =   "部门管理"
   ClientHeight    =   6435
   ClientLeft      =   60
   ClientTop       =   450
   ClientWidth     =   7935
   LinkTopic       =   "Form1"
   ScaleHeight     =   6435
   ScaleWidth      =   7935
   StartUpPosition =   2  '屏幕中心
   Begin MSAdodcLib.Adodc adcDeptName 
      Height          =   375
      Left            =   840
      Top             =   2040
      Visible         =   0   'False
      Width           =   2400
      _ExtentX        =   4233
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
      Caption         =   "DeptName"
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
   Begin VB.CommandButton cmdDelete 
      Caption         =   "删除"
      Height          =   375
      Left            =   1560
      TabIndex        =   5
      Top             =   5400
      Width           =   855
   End
   Begin VB.CommandButton cmdModify 
      Caption         =   "修改"
      Height          =   375
      Left            =   2640
      TabIndex        =   4
      Top             =   5400
      Width           =   855
   End
   Begin VB.CommandButton cmdAdd 
      Caption         =   "添加"
      Height          =   375
      Left            =   480
      TabIndex        =   3
      Top             =   5400
      Width           =   855
   End
   Begin VB.CommandButton cmdChangeDept 
      Caption         =   "更改成员所属部门"
      Height          =   375
      Left            =   4920
      TabIndex        =   2
      Top             =   5400
      Width           =   2055
   End
   Begin VB.TextBox txtDeptDescription 
      Height          =   1215
      Left            =   1560
      MultiLine       =   -1  'True
      TabIndex        =   1
      Top             =   3960
      Width           =   1935
   End
   Begin VB.TextBox txtDeptName 
      Height          =   375
      Left            =   1560
      TabIndex        =   0
      Top             =   3360
      Width           =   1935
   End
   Begin VB.Frame Frame1 
      Caption         =   "部门管理"
      Height          =   5895
      Left            =   240
      TabIndex        =   6
      Top             =   240
      Width           =   3615
      Begin MSDataListLib.DataList dblDepartmentName 
         Bindings        =   "frmSysDepartment.frx":0000
         Height          =   2370
         Left            =   360
         TabIndex        =   10
         Top             =   360
         Width           =   2895
         _ExtentX        =   5106
         _ExtentY        =   4180
         _Version        =   393216
         ListField       =   "Name"
      End
      Begin VB.Label Label1 
         Caption         =   "部门名称"
         Height          =   375
         Left            =   360
         TabIndex        =   8
         Top             =   3240
         Width           =   855
      End
      Begin VB.Label Label5 
         Caption         =   "部门简介"
         Height          =   375
         Left            =   360
         TabIndex        =   7
         Top             =   4080
         Width           =   855
      End
   End
   Begin VB.Frame Frame2 
      Caption         =   "成员设置"
      Height          =   5895
      Left            =   4200
      TabIndex        =   9
      Top             =   240
      Width           =   3375
      Begin MSAdodcLib.Adodc adcMemberName 
         Height          =   375
         Left            =   480
         Top             =   1920
         Visible         =   0   'False
         Width           =   2295
         _ExtentX        =   4048
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
         Caption         =   "MemberName"
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
      Begin MSDataListLib.DataList dblMemberName 
         Bindings        =   "frmSysDepartment.frx":001A
         DataSource      =   "adcMemberName"
         Height          =   3420
         Left            =   360
         TabIndex        =   11
         Top             =   360
         Width           =   2655
         _ExtentX        =   4683
         _ExtentY        =   6033
         _Version        =   393216
         ListField       =   "Name"
      End
   End
End
Attribute VB_Name = "frmSysDepartment"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Attribute VB_Ext_KEY = "RVB_UniqueId" ,"3DA9359102FB"
Attribute VB_Ext_KEY = "RVB_ModelStereotype" ,"Form"

'##ModelId=3DABB1C901EE
Private Sub cmdChangeDept_Click()

End Sub

'##ModelId=3DABB1C9021D
Private Sub dblDepartmentName_Click()
    
End Sub

'##ModelId=3DABB1C9025B
Private Sub dblMemberName_Click()

End Sub

'##ModelId=3DABB1C9028A
Private Sub Form_Load()

End Sub
'##ModelId=3DABB1C902B9
Private Sub ShowDeptInfo()
End Sub

'##ModelId=3DABB1C902E8
Private Sub GetMemberInfoById(DeptId As Integer)
    
End Sub
