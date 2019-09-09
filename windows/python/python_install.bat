rem https://docs.python.org/3.7/using/windows.html

set USER=weyand_l
set python_path=C:\Users\%USER%\Downloads
set python_exec=python-3.7.4.exe
set install_dir=C:\Data\python

%python_path%\%python_exec% TargetDir=%install_dir% PrependPath=1 Include_doc=1 Include_dev=0 Include_exe=1 Include_launcher=1 Include_lib=1  Include_pip=1 Include_tcltk=1 Include_test=1 Include_tools=1
