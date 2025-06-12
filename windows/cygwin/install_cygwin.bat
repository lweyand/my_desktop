rem Script DOS pour installer et configurer cygwin

@echo off
rem cls
echo ========================================================
echo Please wait while Cygwin installs.......
echo ========================================================
echo.
setlocal

pushd .
cd ..
call config.bat
popd

set CYGWIN_PATH=%BINARIES_DIR%
set CYGWIN_REPO=%CYGWIN_PATH%
set CYGWIN_ROOT=C:\cygwin64

rem --- Installation de cygwin ---

%CYGWIN_PATH%\%CYGWIN_EXE% ^
--quiet-mode ^
--wait ^
--site http://mirror.easyname.at/cygwin/ ^
--root "%CYGWIN_ROOT%" ^
--arch x86_64 ^
--local-package-dir "%CYGWIN_REPO%" ^
--verbose ^
--packages bash-completion,curl,dos2unix,git,grep,jq,less,nano,openssh,openssl,rsync,tmux,tree,wget,procps-ng

rem --proxy http://127.0.0.1:3129/ ^
