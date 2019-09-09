set workspace_base_dir='/cygdrive/c/Data/Workspace/git'

set USER=weyand_l
set maven_dir=C:\Data\maven

set maven_archive=C:\Users\%USER%\Downloads\apache-maven-3.5.4-bin.zip

mkdir %maven_dir%
unzip %maven_archive% -d %maven_dir%
mklink /J %maven_dir%\maven %maven_dir%\apache-maven-3.5.4
