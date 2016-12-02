VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "fcdSysLogManagment"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Attribute VB_Ext_KEY = "RVB_UniqueId" ,"3DAFBD9B0039"
Attribute VB_Ext_KEY = "RVB_ModelStereotype" ,"Class Module"
Option Explicit

'管理短信发送的历史记录。


'得到某个时间段的系统日志。
'参数：
'startTime: date
'开始时间
'endTime: date
'截止时间
'return: recordset
'返回系统日志记录集
'##ModelId=3DABFE0100A5
Public Function GetSysLogByTime(startTime As Date, endTime As Date) As Recordset
    Dim objMngr As MainBusiness.HistoryManager
    Set objMngr = CreateObject("MainBusiness.HistoryManager")
    Set GetSysLogByTime = objMngr.GetSysLogByTime(startTime, endTime)
    Set objMngr = Nothing
    
End Function
