VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "fcdMailNotify"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Attribute VB_Ext_KEY = "RVB_UniqueId" ,"3DABFBFC02F9"
Attribute VB_Ext_KEY = "RVB_ModelStereotype" ,"Class Module"
'邮件短信通知管理。

Option Explicit


'得到指定 ID 的邮件过滤规则
'##ModelId=3DB45DE3016F
Public Function GetRulerByID(ID As Long) As Recordset
    Dim objMngr As MainBusInterface.IMaintData
    Set objMngr = CreateObject("MainBusiness.MailNotifyManager")
    Set GetRulerByID = objMngr.GetListByID(ID)
    Set objMngr = Nothing
    
End Function


'得到用户的邮件过滤规则列表。
'参数：
'UserID: long
'用户的标识
'return: recordset
'邮件规则的记录集
'##ModelId=3DAFE880018A
Public Function GetRulerList(UserID As Long) As Recordset
    Dim objMngr As MainBusInterface.IMaintData
    Set objMngr = CreateObject("MainBusiness.MailNotifyManager")
    Set GetRulerList = objMngr.GetListByUserID(UserID)
    Set objMngr = Nothing
    
End Function


'删除指定 ID 邮件规则。
'参数：
'ID: long
'邮件规则的标识
'##ModelId=3DAFE95102DA
Public Sub DeleteRuler(ID As Long)
    Dim objMngr As MainBusInterface.IMaintData
    Set objMngr = CreateObject("MainBusiness.MailNotifyManager")
    objMngr.Delete ID
    Set objMngr = Nothing
    
End Sub


'得到一个空记录集。
'参数：
'Return: Recordset
'返回一个空记录集
'##ModelId=3DAFE9D60262
Public Function GetEmptyRecordset() As Recordset
    Dim objMngr As MainBusInterface.IMaintData
    Set objMngr = CreateObject("MainBusiness.MailNotifyManager")
    Set GetEmptyRecordset = objMngr.GetEmpty()
    Set objMngr = Nothing
    
End Function


'保存邮件过滤规则。
'参数：
'rs: recordset
'所有邮件过滤规则的记录集
'##ModelId=3DAFEA0D0032
Public Sub SaveRulers(rs As Recordset)
    Dim objMngr As MainBusInterface.IMaintData
    Set objMngr = CreateObject("MainBusiness.MailNotifyManager")
    objMngr.Save rs
    Set objMngr = Nothing
    
End Sub


'保存用户帐户的信息。(保存用户信息表中的邮件规则类型信息)
'参数：
'rs: recordset
'用户帐户的信息记录集
'##ModelId=3DAFEA7C0278
Public Sub SaveUserInfo(rs As Recordset)
    Dim objMngr As MainBusInterface.IMaintData
    Set objMngr = CreateObject("MainBusiness.UserManager")
    objMngr.Save rs
    Set objMngr = Nothing
    
End Sub
