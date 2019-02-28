rem Scrip DOS pour installer et configurer cygwin

set USER="<USER>"
set CYGWIN_PATH="C:\Users\%USER%\Downloads"
set CYGWIN_EXE="setup-x86_64.exe"
set CYGWIN_ROOT="C:\cygwin64"

rem --- Installation de cygwin ---

"%CYGWIN_PATH%\%CYGWIN_EXE%" ^
--quiet-mode ^
rem --proxy http://localhost:3189 ^
--root "%CYGWIN_ROOT%" ^
--arch x86_64 ^
--local-package-dir "%CYGWIN_PATH%" ^
--verbose ^
--packages bash-completion,curl,dos2unix,git,grep,jq,less,nano,openssh,openssl,rsync,tmux,tree,wget

rem --- Mise en place de la home windows dans la home cygwin ---

rename "%CYGWIN_ROOT%\home\%USER%" "%CYGWIN_ROOT%\home\%USER%.old"
mklink /J "%CYGWIN_ROOT%\home\%USER%" "C:\Users\%USER%"
