include "./dto/CommonDto.thrift"

//�����php��д������:namespace php epdcloud.epsp.api.eschool
//����namespace���������ڵ���thrift������Զ����ɵ�api�����package����
namespace java com.autogenerateinterface
service SchoolSpaceApi{
	string teString(1:string para)
	i32 teInt(1:i32 para)
	bool teBoolean(1:bool para)
	void teVoid()
	string teNull()
	//ѧУ����-> �༶���� ��Ӱ༶��ʦ�б�
	string showSetTeacherList(1:map<string, CommonDto.TObject> paramMap,2:string classId);
}