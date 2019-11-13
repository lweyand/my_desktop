rem Script DOS pour installer et configurer cygwin

set USER_ADMIN=<MY_ADMIN_ACCOUNT>
set CYGWIN_ROOT=C:\cygwin64
set CONF_DIR=admin_conf
rem --- Configuration de la home de l'admin ---


mkdir %CYGWIN_ROOT%\home\%USER_ADMIN%
copy %CONF_DIR%\*.* %CYGWIN_ROOT%\home\%USER_ADMIN%
