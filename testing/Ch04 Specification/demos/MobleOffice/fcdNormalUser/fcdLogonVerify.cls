VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "fcdLogonVerify"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Attribute VB_Ext_KEY = "RVB_UniqueId" ,"3DA82052019E"
Attribute VB_Ext_KEY = "RVB_ModelStereotype" ,"Class Module"
'用来验证用户身份。
Option Explicit


'验证用户身份。
'参数：
'User: Recordset
'用户信息的记录集
'Returns: Boolean
'返回用户身份是否合法
'注意：
'User同时用来返回合法用户的完全信息。
'##ModelId=3DA82CF602AF
Public Function Verify(ByRef User As Recordset) As Boolean
    Dim objMngr As MainBusiness.Logon
    Set objMngr = CreateObject("MainBusiness.Logon")
    Verify = objMngr.Verify(User)
    Set objMngr = Nothing
    
End Function


'根据用户 ID 获得用户信息
'##ModelId=3DB83DCA005F
Public Function GetUserByID(UserID As Long) As Recordset
    Dim objMngr As MainBusInterface.IMaintData
    Set objMngr = CreateObject("MainBusiness.UserManager")
    Set GetUserByID = objMngr.GetListByID(UserID)
    Set objMngr = Nothing
    
End Function
