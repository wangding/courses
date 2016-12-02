VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "fcdSysUserandDept"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Attribute VB_Ext_KEY = "RVB_UniqueId" ,"3DAFBD9D01FF"
Attribute VB_Ext_KEY = "RVB_ModelStereotype" ,"Class Module"
Option Explicit


'得到指定部门
'参数
'ID: long
'return: Recordset
'包含指定部门的单条记录
'##ModelId=3DB45F70025F
Public Function GetDeptByID(ID As Long) As Recordset
    Dim objMngr As MainBusInterface.IMaintData
    Set objMngr = CreateObject("MainBusiness.DeptManager")
    Set GetDeptByID = objMngr.GetListByID(ID)
    Set objMngr = Nothing
    
End Function


'得到指定用户
'参数
'ID: long
'return: Recordset
'包含指定用户的单条记录
'##ModelId=3DB45FFF02D3
Public Function GetUserByID(ID As Long) As Recordset
    Dim objMngr As MainBusInterface.IMaintData
    Set objMngr = CreateObject("MainBusiness.UserManager")
    Set GetUserByID = objMngr.GetListByID(ID)
    Set objMngr = Nothing
    
End Function


'删除单个部门。
'参数
'ID: long
'部门的标识
'##ModelId=3DB18BB0034F
Public Sub DeleteDept(ID As Long)
    Dim objMngr As MainBusInterface.IMaintData
    Set objMngr = CreateObject("MainBusiness.DeptManager")
    objMngr.Delete ID
    Set objMngr = Nothing
    
End Sub


'删除单个用户。
'参数
'ID: long
'用户的标识
'##ModelId=3DB18B6E0264
Public Sub DeleteUser(ID As Long)
    Dim objMngr As MainBusInterface.IMaintData
    Set objMngr = CreateObject("MainBusiness.UserManager")
    objMngr.Delete ID
    Set objMngr = Nothing
    
End Sub


'保存部门的更改信息。
'参数
'rs: Recordset
'部门信息记录集
'##ModelId=3DB18C3A017B
Public Sub SaveDeptInfo(rs As Recordset)
    Dim objMngr As MainBusInterface.IMaintData
    Set objMngr = CreateObject("MainBusiness.DeptManager")
    objMngr.Save rs
    Set objMngr = Nothing
    
End Sub


'保存用户的更改信息。
'参数：
'rs: Recordset
'用户的信息记录集
'##ModelId=3DAFBD9D0347
Public Sub SaveUserInfo(rs As Recordset)
    Dim objMngr As MainBusInterface.IMaintData
    Set objMngr = CreateObject("MainBusiness.UserManager")
    objMngr.Save rs
    Set objMngr = Nothing
    
End Sub


'得到部门的空记录集
'参数
'return: Recordset
'部门的空记录集
'##ModelId=3DB18CEC012E
Public Function GetDeptEmptyRec() As Recordset
    Dim objMngr As MainBusInterface.IMaintData
    Set objMngr = CreateObject("MainBusiness.DeptManager")
    Set GetDeptEmptyRec = objMngr.GetEmpty()
    Set objMngr = Nothing
    
End Function


'得到用户的空记录集。
'参数：
'return: Recordset
'用户的空记录集
'##ModelId=3DAFBD9D03A5
Public Function GetUserEmptyRec() As Recordset
    Dim objMngr As MainBusInterface.IMaintData
    Set objMngr = CreateObject("MainBusiness.UserManager")
    Set GetUserEmptyRec = objMngr.GetEmpty()
    Set objMngr = Nothing
    
End Function


'获得全部部门列表。
'参数：
'return: Recordset
'返回部门的列表
'##ModelId=3DAFBD9D02E9
Public Function GetDepartmentList() As Recordset
    Dim objMngr As MainBusInterface.IMaintData
    Set objMngr = CreateObject("MainBusiness.DeptManager")
    Set GetDepartmentList = objMngr.GetAll()
    Set objMngr = Nothing
    
End Function


'获得全部用户信息。
'参数：
'return: Recordset
'系统所有帐户的记录集
'##ModelId=3DAFBD9D02AB
Public Function GetUserList() As Recordset
    Dim objMngr As MainBusInterface.IMaintData
    Set objMngr = CreateObject("MainBusiness.UserManager")
    Set GetUserList = objMngr.GetAll()
    Set objMngr = Nothing
    
End Function


'获得全部用户信息。
'参数：
'return: Recordset
'系统所有帐户的记录集
'##ModelId=3DAFBD9D02AB
Public Function GetExgEmails() As Recordset
    Dim objMngr As MainBusiness.UserManager
    Set objMngr = CreateObject("MainBusiness.UserManager")
    Set GetUserList = objMngr.GetExgEmails()
    Set objMngr = Nothing
End Function

