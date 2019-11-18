rem https://docs.python.org/3.7/using/windows.html

@echo off
rem cls
echo ========================================================
echo Please wait while Python  installs.......
echo ========================================================
echo.
setlocal

pushd .
cd ..
call config.bat
popd

set python_path=%BINARIES_DIR%
set python_exec=python-3.7.4.exe
set python_install_dir=%INSTALL_BASE_DIR%\python

%python_path%\%python_exec% TargetDir=%python_install_dir% PrependPath=1 Include_doc=1 Include_dev=0 Include_exe=1 Include_launcher=1 Include_lib=1  Include_pip=1 Include_tcltk=1 Include_test=1 Include_tools=1
