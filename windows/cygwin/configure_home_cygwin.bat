rem Script DOS pour installer et configurer cygwin

set CYGWIN_EXE=setup-x86_64.exe
set CYGWIN_ROOT=C:\cygwin64

rem --- Mise en place de la home windows dans la home cygwin ---

rename %CYGWIN_ROOT%\home\%USER% %USER%.old
mklink /J %CYGWIN_ROOT%\home\%USER% C:\Users\%USER%
