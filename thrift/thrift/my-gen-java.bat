@echo off
::��������api��Ŀ¼Ϊ��ǰĿ¼�µ���һ��Ŀ¼�µ�api\src\main\javaĿ¼
set GEN_SRC_DIR="%~dp0..\api\src\main\java"
if exist %GEN_SRC_DIR% rd /Q /S %GEN_SRC_DIR%
thrift-0.9.0.exe -version
::����-out %GEN_SRC_DIR%��Ĭ�������ڵ�ǰĿ¼�µ�gen-java�ļ�����,php������gen-php�ļ�����
::php��д��Ϊ:thrift.exe -r %GEN_SRC_PARENT_DIR% -gen php idls/api/eschool/SchoolSpaceApi.thrift
::-r��ʾ-r[ecurse]  Also generate included files��thrift�ļ�����include��ͬʱ���ɼ�dto����
thrift-0.9.0.exe -v -r -out %GEN_SRC_DIR% --gen java idls/api/eschool/SchoolSpaceApi.thrift
if "%1"=="skipPause" goto finally
@pause
:finally
