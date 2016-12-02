VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "fcdPvtInfoMaint"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Attribute VB_Ext_KEY = "RVB_UniqueId" ,"3DABFC12003C"
Attribute VB_Ext_KEY = "RVB_ModelStereotype" ,"Class Module"
'维护用户个人信息。

Option Explicit


'保存用户的更改信息。
'参数：
'rs: Recordset
'此用户所有更改后的信息记录集
'##ModelId=3DAC4F1201E5
Public Sub SaveUserInfo(rs As Recordset)
    Dim objMngr As MainBusInterface.IMaintData
    Set objMngr = CreateObject("MainBusiness.UserManager")
    objMngr.Save rs
    Set objMngr = Nothing
    
End Sub
