VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "fcdContactListMaint"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Attribute VB_Ext_KEY = "RVB_UniqueId" ,"3DA924A4014E"
Attribute VB_Ext_KEY = "RVB_ModelStereotype" ,"Class Module"
Option Explicit


'维护用户的个人通讯录。


'根据联系人的 ID 得到指定记录。
'参数：
'ID: long
'Return: Recordset
'返回空记录集
'##ModelId=3DB45E4201E5
Public Function GetContactsByID(ID As Long) As Recordset
    Dim objMngr As MainBusInterface.IMaintData
    Set objMngr = CreateObject("MainBusiness.ContactManager")
    Set GetContactsByID = objMngr.GetListByID(ID)
    Set objMngr = Nothing
    
End Function


'根据通讯组的 ID 得到指定记录。
'参数：
'ID: long
'Return: Recordset
'返回空记录集
'##ModelId=3DB45E770240
Public Function GetGroupByID(ID As Long) As Recordset
    Dim objMngr As MainBusInterface.IMaintData
    Set objMngr = CreateObject("MainBusiness.GroupManager")
    Set GetGroupByID = objMngr.GetListByID(ID)
    Set objMngr = Nothing
    
End Function


'得到一个空的联系人。
'参数：
'Return: Recordset
'返回空记录集
'##ModelId=3DAC29D4037D
Public Function GetEmptyContact() As Recordset
    Dim objMngr As MainBusInterface.IMaintData
    Set objMngr = CreateObject("MainBusiness.ContactManager")
    Set GetEmptyContact = objMngr.GetEmpty()
    Set objMngr = Nothing
    
End Function


'得到一个空的通信组。
'参数：
'Return: Recordset
'返回此空记录集
'##ModelId=3DAC2A1E02BD
Public Function GetEmptyGroup() As Recordset
    Dim objMngr As MainBusInterface.IMaintData
    Set objMngr = CreateObject("MainBusiness.GroupManager")
    Set GetEmptyGroup = objMngr.GetEmpty()
    Set objMngr = Nothing
    
End Function


'删除一个联系人。
'参数：
'ID: Long
'删除联系人的ID号
'##ModelId=3DAC2A9701BB
Public Sub DeleteContact(ID As Long)
    Dim objMngr As MainBusInterface.IMaintData
    Set objMngr = CreateObject("MainBusiness.ContactManager")
    objMngr.Delete ID
    Set objMngr = Nothing
    
End Sub


'删除一个通信组。
'参数：
'ID: Long
'删除组的ID号
'##ModelId=3DAC2AF6025C
Public Sub DeleteGroup(ID As Long)
    Dim objMngr As MainBusInterface.IMaintData
    Set objMngr = CreateObject("MainBusiness.GroupManager")
    objMngr.Delete ID
    Set objMngr = Nothing
    
End Sub


'保存更改过的联系人列表。
'参数：
'rs: Recordset
'更改后的所有联系人记录集
'##ModelId=3DAC2B48019E
Public Sub SaveContacts(rs As Recordset)
    Dim objMngr As MainBusInterface.IMaintData
    Set objMngr = CreateObject("MainBusiness.ContactManager")
    objMngr.Save rs
    Set objMngr = Nothing
    
End Sub


'保存更改过的通信组信息。
'参数：
'rs: Recordset
'更改后的所有通信组记录集
'##ModelId=3DAC2B700129
Public Sub SaveGroups(rs As Recordset)
    Dim objMngr As MainBusInterface.IMaintData
    Set objMngr = CreateObject("MainBusiness.GroupManager")
    objMngr.Save rs
    Set objMngr = Nothing
    
End Sub


'得到某用户的所有联系人。
'参数：
'UserID: Long
'登录用户的ID号
'Return: Recordset
'返回此用户的所有联系人的记录集
'##ModelId=3DAC292401E3
Public Function GetContacts(UserID As Long) As Recordset
    Dim objMngr As MainBusInterface.IMaintData
    Set objMngr = CreateObject("MainBusiness.ContactManager")
    Set GetContacts = objMngr.GetListByUserID(UserID)
    Set objMngr = Nothing
    
End Function


'得到某用户的所有通信组。
'参数：
'UserID: Long
'登录用户的ID号
'Return: Recordset
'返回此用户的所有通信组的记录集
'##ModelId=3DAC292402FB
Public Function GetGroups(UserID As Long) As Recordset
    Dim objMngr As MainBusInterface.IMaintData
    Set objMngr = CreateObject("MainBusiness.GroupManager")
    Set GetGroups = objMngr.GetListByUserID(UserID)
    Set objMngr = Nothing
    
End Function
