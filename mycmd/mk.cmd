@echo off
rem 关闭自动输出
chcp 65001

rem 接收输入

set input=
set /p input=请输入文章标题:

echo %input%| findstr "\.md" > nul && (call hexo n "%input:~0,-3%" & call start .\source\_posts\%input%)||(call hexo n "%input%" & call start .\source\_posts\%input%.md)

exit
rem 输出得到的输入信息

rem echo 您输入的字符串是："..\source\_posts\%input%.md"

rem call start .\source\_posts\%input%.md


rem 从begin标签出，再次运行