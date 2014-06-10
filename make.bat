REM @echo off
set GIT="C:\Program Files (x86)\Git\bin\git.exe"
if exist %1 goto Make
echo Usage: make ThesisFile.tex
goto End
:Make
%GIT% add figures
%GIT% clean -dfx
latex %1
bibtex8 -H -c cp1251 %~n1.aux
latex %1
latex %1
dvips %~n1.dvi
mgs -sDEVICE=pdfwrite -DNOPAUSE -DBATCH -sOutputFile=%~n1.pdf %~n1.ps
REM %GIT% clean -dfx
:End