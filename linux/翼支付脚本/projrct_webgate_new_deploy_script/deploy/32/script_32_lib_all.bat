@echo 是否开始部署32？
@echo Y/N
@set /p choice=请确认:
@set choice=%choice:~0,1%
@if /I "%choice%"=="Y" goto Y
@if /I "%choice%"=="N" exit
@goto end

:Y
echo "deploy_32_lib_all start..."
set curdir=%~dp0
set curtxt=%curdir%script\script_32_lib_all.txt
cd ..
set WINSCP_EXE=WinSCP\WinSCP.com
set zipdir=7-Zip\7z

@echo 开始压缩bank-lib...
@echo %zipdir%
del C:\alljar\bank-lib.tar.gz
%zipdir% a -r -ttar C:\alljar\bank-lib.tar C:\alljar\bank-lib\*
%zipdir% a -r -tgzip C:\alljar\bank-lib.tar.gz C:\alljar\bank-lib.tar
del C:\alljar\bank-lib.tar

@echo 开始压缩manager-lib...
@echo %zipdir%
del C:\alljar\manager-lib.tar.gz
%zipdir% a -r -ttar C:\alljar\manager-lib.tar C:\alljar\manager-lib\*
%zipdir% a -r -tgzip C:\alljar\manager-lib.tar.gz C:\alljar\manager-lib.tar
del C:\alljar\manager-lib.tar
@echo 开始传输bank-lib...manager-lib...
%WINSCP_EXE% /console /script=%curtxt%
pause;