@echo �Ƿ�ʼ����prod��
@echo Y/N
@set /p choice=��ȷ��:
@set choice=%choice:~0,1%
@if /I "%choice%"=="Y" goto Y
@if /I "%choice%"=="N" exit
@goto end

:Y
echo "deploy_prod_app_all start..."
set curdir=%~dp0
set curtxt=%curdir%script\script_prod_app_bank.txt
cd ../WinSCP
set WINSCP_EXE=WinSCP.com
%WINSCP_EXE% /console /script=%curtxt%
pause;