VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "fcdSysStatistic"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Attribute VB_Ext_KEY = "RVB_UniqueId" ,"3DAFBD9C02D9"
Attribute VB_Ext_KEY = "RVB_ModelStereotype" ,"Class Module"
Option Explicit

'实现流量统计。


'某个时间段所有部门的流量统计。
'参数：
'startTime: date
'开始时间
'endTime: date
'结束时间
'return: recordset
'一个部门与流量统计的记录集
'##ModelId=3DAFBD9C0395
Public Function GetDeptStatisticByTime(startTime As Date, endTime As Date) As Recordset
    Dim objMngr As MainBusiness.HistoryManager
    Set objMngr = CreateObject("MainBusiness.HistoryManager")
    Set GetDeptStatisticByTime = objMngr.GetDeptStatisticByTime(startTime, endTime)
    Set objMngr = Nothing
    
End Function


'得到所有个人的流量统计。
'参数：
'startTime: date
'开始时间
'endTime: date
'结束时间
'return: recordset
'返回所有人和流量统计的记录集
'##ModelId=3DAFBD9D00C6
Public Function GetPersonStatisticByTime(startTime As Date, endTime As Date) As Recordset
    Dim objMngr As MainBusiness.HistoryManager
    Set objMngr = CreateObject("MainBusiness.HistoryManager")
    Set GetPersonStatisticByTime = objMngr.GetPersonStatisticByTime(startTime, endTime)
    Set objMngr = Nothing
    
End Function

