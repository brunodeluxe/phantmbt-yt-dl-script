@echo off
set mypath=%cd%
echo ###### YOUTUBE PLAYLIST CONVERTER ######
echo #                                      #
echo #                                      #
echo #   batched by twitch.tv/brunodeluxe   #
echo #                                      #
echo #     based on youtube-dl Project     #
echo # Copyright by Ricardo Garcia Gonzalez #
echo #                                      #
echo ########################################
echo.
if exist youtube-dl.exe (
goto FINE 
)
else (
echo !!! youtube-dl.exe not found! !!!
echo.
echo please visit https://rg3.github.io/youtube-dl/ 
echo and download youtube-dl.exe to the current directory
echo.
pause
exit

:FINE 
echo Attention: only alphanumeric letters expect " _-.: "
set NAMEPL=
set /p NAMEPL=Name for Playlist: 
echo Abort with STRG-C
echo.
set ID=
set /p ID=paste here YT-Playlist-ID with right-click: 
echo.
ping -n 1 localhost > NUL
set NAMEPL=%NAMEPL%.txt

%mypath%\youtube-dl.exe --newline --yes-playlist --get-id %ID% > %mypath%\%NAMEPL%

echo Done. %NAMEPL% created!
set NEXTPL=
set /p NEXTPL=Wanna create another Playlist (yes/no):
ping -n 1 localhost > NUL 
CALL :%NEXTPL%
IF ERRORLEVEL 1 CALL :FAIL

:y
cls
goto FINE

:yes
cls
goto FINE

:no
echo Bye :D
ping -n 8 localhost > NUL
exit

:n
goto no

:FAIL
echo Unknown answer! Leaving...
goto no


