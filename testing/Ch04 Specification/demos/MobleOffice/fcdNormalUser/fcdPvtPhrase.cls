VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "fcdPvtPhrase"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Attribute VB_Ext_KEY = "RVB_UniqueId" ,"3DA96ADB022E"
Attribute VB_Ext_KEY = "RVB_ModelStereotype" ,"Class Module"
'�������˳���������Ƿ��ϵͳ������ϲ������˳������б��С�

Option Explicit


'��ó������ ID Ϊָ��ֵ�ļ�¼��
'������
'ID: long
'Return: Recordset
'##ModelId=3DB45EF000F0
Public Function GetPvtPhraseByID(ID As Long) As Recordset
    Dim objMngr As MainBusInterface.IMaintData
    Set objMngr = CreateObject("MainBusiness.PvtPhraseManager")
    Set GetPvtPhraseByID = objMngr.GetListByID(ID)
    Set objMngr = Nothing
    
End Function


'�����û����˳������Ƿ�ϲ�ϵͳ����������á�
'������
'rs: recordset
'�û���Ϣ�ļ�¼��
'##ModelId=3DAD7B25001F
Public Sub SaveUserInfo(rs As Recordset)
    Dim objMngr As MainBusInterface.IMaintData
    Set objMngr = CreateObject("MainBusiness.UserManager")
    objMngr.Save rs
    Set objMngr = Nothing
    
End Sub


'�õ��û��ĸ��˳����
'������
'UserID: Long
'��¼�û���ID��
'Return: Recordset
'���ش��û������и��˳�����
'##ModelId=3DAC00EA00D2
Public Function GetPvtPhraseList(UserID As Long) As Recordset
    Dim objMngr As MainBusInterface.IMaintData
    Set objMngr = CreateObject("MainBusiness.PvtPhraseManager")
    Set GetPvtPhraseList = objMngr.GetListByUserID(UserID)
    Set objMngr = Nothing
    
End Function


'������ĺ�ĸ��˳����
'������
'rs: Recordset
'�û����ĺ�����и��˳������¼��
'##ModelId=3DAC00EA0305
Public Sub SavePvtPhrase(rs As Recordset)
    Dim objMngr As MainBusInterface.IMaintData
    Set objMngr = CreateObject("MainBusiness.PvtPhraseManager")
    objMngr.Save rs
    Set objMngr = Nothing
    
End Sub


'�õ�һ���ռ�¼����
'������
'Return: Recordset
'����һ���ռ�¼��
'##ModelId=3DAC0739017D
Public Function GetEmptyRecordset() As Recordset
    Dim objMngr As MainBusInterface.IMaintData
    Set objMngr = CreateObject("MainBusiness.PvtPhraseManager")
    Set GetEmptyRecordset = objMngr.GetEmpty()
    Set objMngr = Nothing
    
End Function


'ɾ��һ�������
'������
'ID: Long
'Ҫɾ���ĳ�����ID��
'##ModelId=3DAC07390277
Public Sub DeletePhrase(ID As Long)
    Dim objMngr As MainBusInterface.IMaintData
    Set objMngr = CreateObject("MainBusiness.PvtPhraseManager")
    objMngr.Delete ID
    Set objMngr = Nothing
    
End Sub