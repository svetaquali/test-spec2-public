@echo off
echo Printing all arguments passed to the script:

:loop
if "%1"=="" goto end
echo %1
shift
goto loop

:end
