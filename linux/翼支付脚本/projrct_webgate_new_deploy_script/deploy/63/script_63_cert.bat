@echo 是否开始部署63？
@echo Y/N
@set /p choice=请确认:
@set choice=%choice:~0,1%
@if /I "%choice%"=="Y" goto Y
@if /I "%choice%"=="N" exit
@goto end

:Y
echo "deploy_63_cert start..."
set curdir=%~dp0
set curtxt=%curdir%script\script_63_cert.txt
cd ..
set WINSCP_EXE=WinSCP\WinSCP.com
set zipdir=7-Zip\7z

@echo 开始压缩证书...
@echo %zipdir%
%zipdir% a -r -ttar C:\alljar\bank-cert.tar C:\alljar\bank-cert\*
%zipdir% a -r -tgzip C:\alljar\bank-cert.tar.gz C:\alljar\bank-cert.tar
del C:\alljar\bank-cert.tar
@echo 开始传输证书...
%WINSCP_EXE% /console /script=%curtxt%
pause;