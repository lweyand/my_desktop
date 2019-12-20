@echo off
rem cls
echo ========================================================
echo Please wait while Maven installs.......
echo ========================================================
echo.
setlocal

pushd .
cd ..
call config.bat
popd

rem set USER=weyand_l
set maven_archive=%BINARIES_DIR%\%MAVEN_ARCHIVE%
set maven_install_dir=%INSTALL_BASE_DIR%\maven


mkdir %maven_install_dir%
unzip %maven_archive% -d %maven_install_dir%
mklink /J %maven_install_dir%\maven %maven_install_dir%\apache-maven-3.5.4
