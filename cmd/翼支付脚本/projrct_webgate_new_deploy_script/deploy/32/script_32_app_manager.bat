@echo �Ƿ�ʼ����32��
@echo Y/N
@set /p choice=��ȷ��:
@set choice=%choice:~0,1%
@if /I "%choice%"=="Y" goto Y
@if /I "%choice%"=="N" exit
@goto end

:Y
echo "deploy_32_app_all start..."
set curdir=%~dp0
set curtxt=%curdir%script\script_32_app_manager.txt
cd ../WinSCP
set WINSCP_EXE=WinSCP.com
%WINSCP_EXE% /console /script=%curtxt%
pause;