@echo off
set /p b=输入一个数字：
echo %b%
set /a a=2*%b%
echo %b%+%b%=%a%
pause