@echo �Ƿ�ʼ����63��
@echo Y/N
@set /p choice=��ȷ��:
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

@echo ��ʼѹ��֤��...
@echo %zipdir%
%zipdir% a -r -ttar C:\alljar\bank-cert.tar C:\alljar\bank-cert\*
%zipdir% a -r -tgzip C:\alljar\bank-cert.tar.gz C:\alljar\bank-cert.tar
del C:\alljar\bank-cert.tar
@echo ��ʼ����֤��...
%WINSCP_EXE% /console /script=%curtxt%
pause;