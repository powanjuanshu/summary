@echo 是否开始部署32？
@echo Y/N
@set /p choice=请确认:
@set choice=%choice:~0,1%
@if /I "%choice%"=="Y" goto Y
@if /I "%choice%"=="N" exit
@goto end

:Y
echo "deploy_32_lib_bank start..."
set curdir=%~dp0
set curtxt=%curdir%script\script_32_lib_bank.txt
cd ..
set WINSCP_EXE=WinSCP\WinSCP.com
set zipdir=7-Zip\7z

@echo 开始压缩bank-lib...
del C:\alljar\bank-lib.tar.gz
@echo %zipdir%
%zipdir% a -r -ttar C:\alljar\bank-lib.tar C:\alljar\bank-lib\*
%zipdir% a -r -tgzip C:\alljar\bank-lib.tar.gz C:\alljar\bank-lib.tar
del C:\alljar\bank-lib.tar
@echo 开始传输bank-lib...
%WINSCP_EXE% /console /script=%curtxt%
pause;