VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "fcdSysConfig"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Attribute VB_Ext_KEY = "RVB_UniqueId" ,"3DB0F74A02E0"
Attribute VB_Ext_KEY = "RVB_ModelStereotype" ,"Class Module"
Option Explicit

'实现系统配置管理。


'得到系统配置信息。
'参数：
'return: recordset
'返回系统配置信息的记录集
'##ModelId=3DB156C4032D
Public Function GetSysConfig() As Recordset
    Dim objMngr As MainBusInterface.IMaintData
    Set objMngr = CreateObject("MainBusiness.SysConfigManager")
    Set GetSysConfig = objMngr.GetAll()
    Set objMngr = Nothing
    
    '配置信息包括:
    '是否过滤敏感词汇，Key=HotWords，Value="true"。
    '发现敏感词后的动作，Key=HotAction，Value="1"。（1是警告用户，并让用户选择继续发送还是取消发送；2是不警告用户，直接截取敏感词汇并发送；3是不发送短信，并给予警告提示。）
    '单发短信长度，Key=MsgLen，Value="60"。
    '群发短信长度，Key=MsgsLen，Value="60"。
    'IP地址是否绑定，Key=IPBinding，Value="true"。
    '邮件过滤配置，Key=EmlFilter，Value=""。
    '邮件提醒间隔，Key=EmlNtfWait，Value="5"。（单位：分钟）
End Function

'保存系统配置信息。
'参数：
'rs: recordset
'系统配置信息保存的记录集
'##ModelId=3DB156D50233
Public Sub SaveSysConfig(rs As Recordset)
    Dim objMngr As MainBusInterface.IMaintData
    Set objMngr = CreateObject("MainBusiness.SysConfigManager")
    objMngr.Save rs
    Set objMngr = Nothing
    
End Sub


'保存管理员的信息。
'参数：
'rs: recordset
'管理员信息的记录集
'##ModelId=3DB15C57006C
Public Sub SaveAdminInfo(rs As Recordset)
    Dim objMngr As MainBusInterface.IMaintData
    Set objMngr = CreateObject("MainBusiness.SysConfigManager")
    objMngr.Save rs
    Set objMngr = Nothing
    
End Sub


'///////////////////////////////////////////////////////////////////////////////////////////////
'// HotWord
'////////////////////
'得到系统敏感词汇列表。
'参数：
'return: recordset
'返回系统敏感词汇列表
'##ModelId=3DB15F7E02D2
Public Function GetHotWordsList() As Recordset
    Dim objMngr As MainBusInterface.IMaintData
    Set objMngr = CreateObject("MainBusiness.HotWordManager")
    Set GetHotWordsList = objMngr.GetAll()
    Set objMngr = Nothing
    
End Function

'删除敏感词汇。
'参数：
'ID: long
'敏感词汇的标识
'##ModelId=3DB15F8F02A3
Public Sub DelHotWord(ID As Long)
    Dim objMngr As MainBusInterface.IMaintData
    Set objMngr = CreateObject("MainBusiness.HotWordManager")
    objMngr.Delete ID
    Set objMngr = Nothing
    
End Sub

'保存敏感词汇列表。
'参数：
'rs: recordset
'更改过的敏感词汇列表
'##ModelId=3DB15F9D0320
Public Sub SaveHotWord(rs As Recordset)
    Dim objMngr As MainBusInterface.IMaintData
    Set objMngr = CreateObject("MainBusiness.HotWordManager")
    objMngr.Save rs
    Set objMngr = Nothing
    
End Sub

'返回空的敏感词汇列表。
'参数：
'return: recordset
'空敏感词汇列表
'##ModelId=3DB15FAA013B
Public Function GetEmptyHotWord() As Recordset
    Dim objMngr As MainBusInterface.IMaintData
    Set objMngr = CreateObject("MainBusiness.HotWordManager")
    Set GetEmptyHotWord = objMngr.GetEmpty()
    Set objMngr = Nothing
    
End Function

'##ModelId=3DB45FC0022B
Public Function GetHotWordByID(ID As Long) As Recordset
    Dim objMngr As MainBusInterface.IMaintData
    Set objMngr = CreateObject("MainBusiness.HotWordManager")
    Set GetHotWordByID = objMngr.GetListByID(ID)
    Set objMngr = Nothing
    
End Function

