@echo off

chcp 65001

:begin

echo 1.列出myblog
echo 2.打开blog
echo 3.创建并打开blog
echo 4.运行系统
echo 5.部署

set op=
set /p op=输入操作数

rem 跳转表
:jmp_table
if %op%==1 goto op1
if %op%==2 goto op2
if %op%==3 goto op3
if %op%==4 goto op4
if %op%==5 goto op5

:op1
start mycmd\list.cmd
goto clean
:op2
start mycmd\open.cmd
goto clean
:op3
start mycmd\mk.cmd
goto clean
:op4
start mycmd\run.cmd
goto clean
:op5
start mycmd\deploy.cmd
goto clean


:clean
cls

goto begin