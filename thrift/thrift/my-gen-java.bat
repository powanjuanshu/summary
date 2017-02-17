@echo off
::设置生成api的目录为当前目录下的上一级目录下的api\src\main\java目录
set GEN_SRC_DIR="%~dp0..\api\src\main\java"
if exist %GEN_SRC_DIR% rd /Q /S %GEN_SRC_DIR%
thrift-0.9.0.exe -version
::若无-out %GEN_SRC_DIR%会默认生成在当前目录下的gen-java文件夹下,php则是在gen-php文件夹下
::php的写法为:thrift.exe -r %GEN_SRC_PARENT_DIR% -gen php idls/api/eschool/SchoolSpaceApi.thrift
::-r表示-r[ecurse]  Also generate included files若thrift文件中有include则同时生成即dto生成
thrift-0.9.0.exe -v -r -out %GEN_SRC_DIR% --gen java idls/api/eschool/SchoolSpaceApi.thrift
if "%1"=="skipPause" goto finally
@pause
:finally
