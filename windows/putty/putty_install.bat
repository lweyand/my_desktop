@echo off
rem cls
echo ========================================================
echo Please wait while Office PuTTY 0.62 installs.......
echo ========================================================
echo.
setlocal
set putty_archive=C:\Users\weyand_l\Downloads\putty-64bit-0.70-installer.msi

rem if not exist %SystemDrive%\install\Logs md %SystemDrive%\Install\Logs

msiexec /i %putty_archive% /qb

REM Return exit code to
exit /B %EXIT_CODE%
