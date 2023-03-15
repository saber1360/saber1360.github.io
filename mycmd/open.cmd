@echo off
chcp 65001

dir .\source\_posts\ /a-d

set input=

set /p input=请输入文章名:

echo %input%| findstr "\.md$" > nul && (start .\source\_posts\%input%) || (start .\source\_posts\%input%.md)

exit



