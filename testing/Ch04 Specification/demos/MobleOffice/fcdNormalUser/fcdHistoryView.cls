VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "fcdHistoryView"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Attribute VB_Ext_KEY = "RVB_UniqueId" ,"3DABFBBC01CA"
Attribute VB_Ext_KEY = "RVB_ModelStereotype" ,"Class Module"
Option Explicit

'用来返回用户发送的历史数据。


'得到某个用户某一段时间的发送历史记录。
'参数：
'StartTime: string
'开始时间
'EndTime: string
'结束时间
'UserID: long
'用户的ID号
'return: Recordset
'返回用户查看的时间段的发送历史记录。
'##ModelId=3DAD5F6101A3
Public Function GetHistory(StartTime As String, EndTime As String, UserID As Long) As Recordset
    Dim objMngr As MainBusiness.HistoryManager
    Set objMngr = CreateObject("MainBusiness.HistoryManager")
    Set GetHistory = objMngr.GetHistory(StartTime, EndTime, UserID)
    Set objMngr = Nothing
    
End Function
