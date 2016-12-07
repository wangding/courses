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
'����ʵ�ַ��Ͷ��š�

Option Explicit


'�õ�ȫ��ͨѶ¼�е���ϵ�ˡ������е�Ա����
'������
'return: recordset
'ȫ��ͨѶ¼�е���ϵ�˼�¼��
'##ModelId=3DB25A5B034C
Public Function GetGloableContact() As Recordset
    Dim objMngr As MainBusiness.UserManager
    Set objMngr = CreateObject("MainBusiness.UserManager")
    Set GetGloableContact = objMngr.GetUserInGL()
    Set objMngr = Nothing
    
End Function


'�õ�ȫ��ͨѶ¼�еĲ���ͨѶ�顣�����еĲ��ţ�
'������
'return: recordset
'ȫ��ͨѶ¼�еĲ���ͨѶ���¼��
'##ModelId=3DB25A7A01E9
Public Function GetGloableGroup() As Recordset
    Dim objMngr As MainBusInterface.IMaintData
    Set objMngr = CreateObject("MainBusiness.DeptManager")
    Set GetGloableGroup = objMngr.GetAll()
    Set objMngr = Nothing
    
End Function


'���Ͷ��š�(�ɷ��ͳ���ͬʱ���� MRU)
'������
'rs: recordset
'##ModelId=3DAD866102C1
Public Sub SendMessage(rs As Recordset)
    Dim objMngr As MainBusiness.HistoryManager
    Set objMngr = CreateObject("MainBusiness.HistoryManager")
    objMngr.SendMessage rs
    Set objMngr = Nothing
    
End Sub


'�õ����˳����
'������
'UserID: long
'�û���ID��
'return: recordset
'����ϵͳ�������¼��
'##ModelId=3DAD7D1D0397
Public Function GetPvtPhrase(UserID As Long) As Recordset
    Dim objMngr As MainBusInterface.IMaintData
    Set objMngr = CreateObject("MainBusiness.PvtPhraseManager")
    Set GetPvtPhrase = objMngr.GetListByUserID(UserID)
    Set objMngr = Nothing
    
End Function


'�����û�����Ľ��շ��ֻ��š�
'������
'UserID: long
'�û�ID
'return: recordset
'������ֻ��ż�¼��
'##ModelId=3DAD71B801D2
Public Function GetMRUMobile(UserID As Long) As Recordset
    Dim objMngr As MainBusInterface.IMaintData
    Set objMngr = CreateObject("MainBusiness.MRUManager")
    Set GetMRUMobile = objMngr.GetListByUserID(UserID)
    Set objMngr = Nothing
    
End Function


'�õ�ϵͳ�����
'������
'return: recordset
'����ϵͳ�������¼��
'##ModelId=3DAD73150354
Public Function GetSysPhrase() As Recordset
    Dim objMngr As MainBusInterface.IMaintData
    Set objMngr = CreateObject("MainBusiness.SysPhraseManager")
    Set GetSysPhrase = objMngr.GetAll()
    Set objMngr = Nothing
    
End Function


'�õ�ĳ���˵ĸ�����ϵ�ˡ�
'������
'UserID: long
'�û��ı�ʶ
'Return: Recordset
'���ط�������ģʽ�ĸ�����ϵ�˵ļ�¼��
'##ModelId=3DA93AFA02BC
Public Function GetPvtContactList(UserID As Long) As Recordset
    Dim objMngr As MainBusInterface.IMaintData
    Set objMngr = CreateObject("MainBusiness.ContactManager")
    Set GetPvtContactList = objMngr.GetListByUserID(UserID)
    Set objMngr = Nothing
    
End Function


'�õ�ĳ���˵ĸ���ͨ���顣
'������
'UserID: long
'�û��ı�ʶ
'Return: Recordset
'���ط�������ģʽ�ĸ���ͨ����ļ�¼��
'
'##ModelId=3DA93AFB0193
Public Function GetPvtGroupList(UserID As Long) As Recordset
    Dim objMngr As MainBusInterface.IMaintData
    Set objMngr = CreateObject("MainBusiness.GroupManager")
    Set GetPvtGroupList = objMngr.GetListByUserID(UserID)
    Set objMngr = Nothing
    
End Function


'����ַ����Ƿ�������дʻ�
'������
's: string
'Ҫ�����ַ���
'Return: integer
'����0�����������дʣ����������дʲ�ȡ�Ķ���

'##ModelId=3DB83DCA039F
Public Function ChkStrForHotword(s As String) As Integer
    Dim obj As MainBusiness.HotWordManager
    Set obj = CreateObject("MainBusiness.HotWordManager")
    ChkStrForHotword = obj.IsIncludeHotWord(s)
    Set obj = Nothing
    
End Function