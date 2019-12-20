rem Script DOS pour installer et configurer cygwin

pushd .
cd ..
call config.bat
popd

set CYGWIN_ROOT=C:\cygwin64

rem --- Mise en place de la home windows dans la home cygwin ---

rename %CYGWIN_ROOT%\home\%USER% %USER%.old
mklink /J %CYGWIN_ROOT%\home\%USER% C:\Users\%USER%
