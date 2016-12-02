VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "IMaintData"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Attribute VB_Ext_KEY = "RVB_UniqueId" ,"3DB2EBE200EF"
Attribute VB_Ext_KEY = "RVB_ModelStereotype" ,"Interface"
Option Explicit

'得到一组记录集。
'参数：
'ID: long
'标识
'##ModelId=3DB553D5008F
Public Function GetListByUserID(UserID As Long) As Recordset

End Function

'##ModelId=3DB2EA8D0364
Public Sub Save(rs As Recordset)

End Sub

'得到一个记录集。
'参数：
'ID: long
'标识
'##ModelId=3DB2EAAF0171
Public Function GetListByID(ID As Long) As Recordset

End Function

'##ModelId=3DB2EAFD0191
Public Function GetEmpty() As Recordset

End Function

'##ModelId=3DB2EB280318
Public Sub Delete(ID As Long)

End Sub


'得到所有的记录集。
'参数：
'return: recordset
'返回所有的记录集
'##ModelId=3DB37916018D
Public Function GetAll() As Recordset

End Function
