VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "fcdSMSSend"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Attribute VB_Ext_KEY = "RVB_UniqueId" ,"3DA9149B03C5"
Attribute VB_Ext_KEY = "RVB_ModelStereotype" ,"Class Module"
'用来实现发送短信。

Option Explicit


'得到全局通讯录中的联系人。（所有的员工）
'参数：
'return: recordset
'全局通讯录中的联系人记录集
'##ModelId=3DB25A5B034C
Public Function GetGloableContact() As Recordset
    Dim objMngr As MainBusiness.UserManager
    Set objMngr = CreateObject("MainBusiness.UserManager")
    Set GetGloableContact = objMngr.GetUserInGL()
    Set objMngr = Nothing
    
End Function


'得到全局通讯录中的部门通讯组。（所有的部门）
'参数：
'return: recordset
'全局通讯录中的部门通讯组记录集
'##ModelId=3DB25A7A01E9
Public Function GetGloableGroup() As Recordset
    Dim objMngr As MainBusInterface.IMaintData
    Set objMngr = CreateObject("MainBusiness.DeptManager")
    Set GetGloableGroup = objMngr.GetAll()
    Set objMngr = Nothing
    
End Function


'发送短信。(由发送程序同时更新 MRU)
'参数：
'rs: recordset
'##ModelId=3DAD866102C1
Public Sub SendMessage(rs As Recordset)
    Dim objMngr As MainBusiness.HistoryManager
    Set objMngr = CreateObject("MainBusiness.HistoryManager")
    objMngr.SendMessage rs
    Set objMngr = Nothing
    
End Sub


'得到个人常用语。
'参数：
'UserID: long
'用户的ID号
'return: recordset
'返回系统常用语记录集
'##ModelId=3DAD7D1D0397
Public Function GetPvtPhrase(UserID As Long) As Recordset
    Dim objMngr As MainBusInterface.IMaintData
    Set objMngr = CreateObject("MainBusiness.PvtPhraseManager")
    Set GetPvtPhrase = objMngr.GetListByUserID(UserID)
    Set objMngr = Nothing
    
End Function


'返回用户记忆的接收方手机号。
'参数：
'UserID: long
'用户ID
'return: recordset
'记忆的手机号记录集
'##ModelId=3DAD71B801D2
Public Function GetMRUMobile(UserID As Long) As Recordset
    Dim objMngr As MainBusInterface.IMaintData
    Set objMngr = CreateObject("MainBusiness.MRUManager")
    Set GetMRUMobile = objMngr.GetListByUserID(UserID)
    Set objMngr = Nothing
    
End Function


'得到系统常用语。
'参数：
'return: recordset
'返回系统常用语记录集
'##ModelId=3DAD73150354
Public Function GetSysPhrase() As Recordset
    Dim objMngr As MainBusInterface.IMaintData
    Set objMngr = CreateObject("MainBusiness.SysPhraseManager")
    Set GetSysPhrase = objMngr.GetAll()
    Set objMngr = Nothing
    
End Function


'得到某个人的个人联系人。
'参数：
'UserID: long
'用户的标识
'Return: Recordset
'返回符合名称模式的个人联系人的记录集
'##ModelId=3DA93AFA02BC
Public Function GetPvtContactList(UserID As Long) As Recordset
    Dim objMngr As MainBusInterface.IMaintData
    Set objMngr = CreateObject("MainBusiness.ContactManager")
    Set GetPvtContactList = objMngr.GetListByUserID(UserID)
    Set objMngr = Nothing
    
End Function


'得到某个人的个人通信组。
'参数：
'UserID: long
'用户的标识
'Return: Recordset
'返回符合名称模式的个人通信组的记录集
'
'##ModelId=3DA93AFB0193
Public Function GetPvtGroupList(UserID As Long) As Recordset
    Dim objMngr As MainBusInterface.IMaintData
    Set objMngr = CreateObject("MainBusiness.GroupManager")
    Set GetPvtGroupList = objMngr.GetListByUserID(UserID)
    Set objMngr = Nothing
    
End Function


'检测字符串是否包含敏感词汇
'参数：
's: string
'要检查的字符串
'Return: integer
'返回0，不包含敏感词；其他，敏感词采取的动作

'##ModelId=3DB83DCA039F
Public Function ChkStrForHotword(s As String) As Integer
    Dim obj As MainBusiness.HotWordManager
    Set obj = CreateObject("MainBusiness.HotWordManager")
    ChkStrForHotword = obj.IsIncludeHotWord(s)
    Set obj = Nothing
    
End Function
