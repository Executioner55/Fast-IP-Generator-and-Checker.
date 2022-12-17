@echo off
setlocal enabledelayedexpansion
set /A c=0
:start
set /a t1=!random! %% 255 + 1
set /a t2=!random! %% 255 + 1
set /a t3=!random! %% 255 + 1
set /a t4=!random! %% 255 + 1
set ip=!t1!.!t2!.!t3!.!t4!
ping -w 50 -n 1 !ip! >nul
if "!errorlevel!"=="0" (set /A c=!c!+1 && Title Working : !c! && echo !ip!>>Working.txt && echo [40;32m!ip! Valid) else (echo [40;31m!ip! Invalid)
goto :start
endlocal
exit
:: ~ Made by 
::
::___________                            __  .__                            
::\_   _____/__  ___ ____   ____  __ ___/  |_|__| ____   ____   ___________ 
:: |    __)_\  \/  // __ \_/ ___\|  |  \   __\  |/  _ \ /    \_/ __ \_  __ \
:: |        \>    <\  ___/\  \___|  |  /|  | |  (  <_> )   |  \  ___/|  | \/
::/_______  /__/\_ \\___  >\___  >____/ |__| |__|\____/|___|  /\___  >__|   
::        \/      \/    \/     \/                           \/     \/       
