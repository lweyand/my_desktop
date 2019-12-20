@echo off
rem cls
echo ========================================================
echo Please wait while Office PuTTY  installs.......
echo ========================================================
echo.
setlocal

pushd .
cd ..
call config.bat
popd

set putty_archive=%BINARIES_DIR%\%PUTTY_EXE%

rem if not exist %SystemDrive%\install\Logs md %SystemDrive%\Install\Logs

msiexec /i %putty_archive% /qb

REM Return exit code to
exit /B %EXIT_CODE%
