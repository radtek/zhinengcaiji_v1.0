@echo off
title NBI 1.0 (NBI 2.5期部省上报测试  运行中,请不要关闭此窗口)
cls
color 0A

echo.
echo -------------------------------------------------------
echo                        NBI 1.0
echo                       2011-5-12
echo        Copyright 2010-2020 Uway All Rights Reserved 
echo -------------------------------------------------------
echo.

cd ..

set JDK_PATH=C:\Program Files\Java\jdk1.7.0_01\bin

set /p tip=初始化系统环境变量    <nul

SET _TAGET_PATH=.\lib\*.jar
SET LIB_PATH=.\lib\
setlocal enabledelayedexpansion
for /f "delims=" %%i in ('dir "!_TAGET_PATH!" /a-d /b !SUBDIR! ') do (
SET CLASSPATH=%LIB_PATH%%%i;!CLASSPATH!
)


set PATH=%JDK_PATH%;%PATH%;

set /p tip=--------------------------[ OK ]<nul
echo.
echo.
set /p tip=Starting Report              <nul

java -server -DoEscapeAnalysis -Xms512m -Xmx1024m -Dfile.encoding=gbk cn.uway.nbi.NBI 1>log\out.log 2>log\error.log

if %ERRORLEVEL% NEQ 0 goto err

:err
set /p tip=--------------------------[Fail]<nul
echo %PATH%
echo.
echo.
echo 程序加载错误,原因:
type log\error.log
echo.
echo.
echo NBI停止,按任意键结束.
@endlocal
pause>nul