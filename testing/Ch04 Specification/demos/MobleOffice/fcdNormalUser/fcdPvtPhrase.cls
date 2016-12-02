VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "fcdPvtPhrase"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Attribute VB_Ext_KEY = "RVB_UniqueId" ,"3DA96ADB022E"
Attribute VB_Ext_KEY = "RVB_ModelStereotype" ,"Class Module"
'管理个人常用语，配置是否把系统常用语合并到个人常用语列表中。

Option Explicit


'获得常用语的 ID 为指定值的记录。
'参数：
'ID: long
'Return: Recordset
'##ModelId=3DB45EF000F0
Public Function GetPvtPhraseByID(ID As Long) As Recordset
    Dim objMngr As MainBusInterface.IMaintData
    Set objMngr = CreateObject("MainBusiness.PvtPhraseManager")
    Set GetPvtPhraseByID = objMngr.GetListByID(ID)
    Set objMngr = Nothing
    
End Function


'保存用户个人常用语是否合并系统常用语的设置。
'参数：
'rs: recordset
'用户信息的记录集
'##ModelId=3DAD7B25001F
Public Sub SaveUserInfo(rs As Recordset)
    Dim objMngr As MainBusInterface.IMaintData
    Set objMngr = CreateObject("MainBusiness.UserManager")
    objMngr.Save rs
    Set objMngr = Nothing
    
End Sub


'得到用户的个人常用语。
'参数：
'UserID: Long
'登录用户的ID号
'Return: Recordset
'返回此用户的所有个人常用语
'##ModelId=3DAC00EA00D2
Public Function GetPvtPhraseList(UserID As Long) As Recordset
    Dim objMngr As MainBusInterface.IMaintData
    Set objMngr = CreateObject("MainBusiness.PvtPhraseManager")
    Set GetPvtPhraseList = objMngr.GetListByUserID(UserID)
    Set objMngr = Nothing
    
End Function


'保存更改后的个人常用语。
'参数：
'rs: Recordset
'用户更改后的所有个人常用语记录集
'##ModelId=3DAC00EA0305
Public Sub SavePvtPhrase(rs As Recordset)
    Dim objMngr As MainBusInterface.IMaintData
    Set objMngr = CreateObject("MainBusiness.PvtPhraseManager")
    objMngr.Save rs
    Set objMngr = Nothing
    
End Sub


'得到一个空记录集。
'参数：
'Return: Recordset
'返回一个空记录集
'##ModelId=3DAC0739017D
Public Function GetEmptyRecordset() As Recordset
    Dim objMngr As MainBusInterface.IMaintData
    Set objMngr = CreateObject("MainBusiness.PvtPhraseManager")
    Set GetEmptyRecordset = objMngr.GetEmpty()
    Set objMngr = Nothing
    
End Function


'删除一个常用语。
'参数：
'ID: Long
'要删除的常用语ID号
'##ModelId=3DAC07390277
Public Sub DeletePhrase(ID As Long)
    Dim objMngr As MainBusInterface.IMaintData
    Set objMngr = CreateObject("MainBusiness.PvtPhraseManager")
    objMngr.Delete ID
    Set objMngr = Nothing
    
End Sub
