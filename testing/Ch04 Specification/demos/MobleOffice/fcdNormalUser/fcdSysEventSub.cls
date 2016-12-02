VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "fcdEventSub"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Attribute VB_Ext_KEY = "RVB_UniqueId" ,"3DABFC6D00D1"
Attribute VB_Ext_KEY = "RVB_ModelStereotype" ,"Class Module"
'维护系统日志订阅。

Option Explicit


'得到订阅的列表。
'参数：
'UserID: long
'用户标识号
'return: recordset
'订阅的列表
'##ModelId=3DB03DA601EF
Public Function GetSubList(UserID As Long) As Recordset
    Dim objMngr As MainBusInterface.IMaintData
    Set objMngr = CreateObject("MainBusiness.EventSubManager")
    Set GetSubList = objMngr.GetListByUserID(UserID)
    Set objMngr = Nothing
    
End Function


'得到一个空的记录集。
'参数：
'return: recordset
'空记录集
'##ModelId=3DB03E16029E
Public Function GetEmptyRecord() As Recordset
    Dim objMngr As MainBusInterface.IMaintData
    Set objMngr = CreateObject("MainBusiness.EventSubManager")
    Set GetEmptyRecord = objMngr.GetEmpty()
    Set objMngr = Nothing
    
End Function


'删除对某台服务器的事件订阅。
'参数：
'ID: long
'订阅事件的标识
'##ModelId=3DB03E360203
Public Sub DeleteSub(ID As Long)
    Dim objMngr As MainBusInterface.IMaintData
    Set objMngr = CreateObject("MainBusiness.EventSubManager")
    objMngr.Delete ID
    Set objMngr = Nothing
    
End Sub


'保存对事件订阅的更改。
'参数：
'rs: recordset
'要保存的记录集信息。
'##ModelId=3DB04580038F
Public Sub Save(rs As Recordset)
    Dim objMngr As MainBusInterface.IMaintData
    Set objMngr = CreateObject("MainBusiness.EventSubManager")
    objMngr.Save rs
    Set objMngr = Nothing
    
End Sub
