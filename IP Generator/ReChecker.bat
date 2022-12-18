@echo off
if not exist src exit
cd src
if exist Rechecked.txt del Rechecked.txt.*
set /A count=0
set /A NWorking=0
set /A Working=0
for /f "tokens=*" %%a in (Working.txt) do call :processline %%a

pause
goto :eof

:processline
Title Working : %Working%  /\  Not Working : %NWorking%  /\  Checking : %*...
ping -w 100 -n 1 -l 32 %* >nul
IF ERRORLEVEL 1 (
	set color=[40;33m
	ping -w 100 -n 2 -l 64 %* >nul
	IF ERRORLEVEL 1 (
		set /A NWorking=%NWorking%+1
		set color=[40;31m
		goto n:
		)
	)
set color=[40;32m
set /A Working=%Working%+1
echo %*>>Rechecked.txt
:n
set /A count=%count%+1
echo [40;34m%count% [40;37m# %color%%*

goto :eof

:eof