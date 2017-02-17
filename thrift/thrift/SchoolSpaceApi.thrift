include "./dto/CommonDto.thrift"

//如果是php则写成这样:namespace php epdcloud.epsp.api.eschool
//这里namespace的作用是在调用thrift命令后自动生成的api会带有package包名
namespace java com.autogenerateinterface
service SchoolSpaceApi{
	string teString(1:string para)
	i32 teInt(1:i32 para)
	bool teBoolean(1:bool para)
	void teVoid()
	string teNull()
	//学校管理-> 班级管理 添加班级教师列表
	string showSetTeacherList(1:map<string, CommonDto.TObject> paramMap,2:string classId);
}