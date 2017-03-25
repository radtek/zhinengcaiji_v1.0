@echo off
title NBI 1.0 (NBI 2.5�ڲ�ʡ�ϱ�����  ������,�벻Ҫ�رմ˴���)
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

set /p tip=��ʼ��ϵͳ��������    <nul

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
echo ������ش���,ԭ��:
type log\error.log
echo.
echo.
echo NBIֹͣ,�����������.
@endlocal
pause>nul