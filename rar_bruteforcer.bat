echo off
color a
del UnRAR.exe
title RAR_BRUTEFORCER-BY-AK-HACKS-OR-TRICKS
cls

:takefile
set /P winloc="Enter The Location Where WINRAR Is Installed: "

if EXIST "%winloc%\UnRAR.exe" (
goto brutestart
) else (
goto errorbrute
)

:errorbrute
color c
cls
echo SORRY, PROGRAM CANNOT PERFORM BRUTEFORCE 
echo ........................................................
echo          [ POSSIBLE REASONS ]                          .
echo       1: WINRAR IS NOT INSTALLED                       .
echo       2: WINRAR IS NOT PROPERLY INSTALLED              .
echo       3: COPY OF IMPORTANT FILE IS DENIED BY SYSTEM    .
echo ........................................................
echo          [ POSSIBLE SOLUTIONS ]                        .
echo       1: INSTALL WINRAR                                .
echo       2: REINSTALL WINRAR IF ALREADY INSTALLED         .
echo       3: RUN THIS PROGRAM AS ADMINISTRATOR             .
echo ........................................................
echo.
pause
exit

:brutestart
set /P rarloc="ENTER THE FOLDER LOCATION OF YOUR RAR FILE: "
copy "%winloc%\UnRAR.exe" "%rarloc%"
cls
goto brutestarts

:brutestarts
echo Your WINRAR INSTALLED LOCATION: %winloc%
echo Your RAR FILE'S FOLDER LOCATION: %rarloc%
echo.
set /P rarfile="ENTER THE NAME OF YOUR RAR FILE: "

if EXIST "%rarloc%\%rarfile%" (
goto bruteforce
) else (
goto error
)

:error
cls
echo YOUR RAR FILE IS NOT FOUND IN THAT FOLDER LOCATION
echo PLEASE ENTER YOUR RAR FILE NAME AGAIN WITH EXTENSION
echo.
goto brutestarts

set /A onepin=0
:bruteforce
set /A fh=%onepin%+1
set /A onepin=%fh%
goto finaleone

:finaleone
echo TRYING POSSIBLE PINS: %fh%
UnRAR.exe E -INUL -P%fh% "%rarloc%\%rarfile%"

if %ERRORLEVEL%==0 (
goto cracked
) else (
goto bruteforce
)

:cracked
color f
cls
echo            ..........
echo            .  INFO  .
echo            ..........
echo FOLDER LOCATION: %rarloc%                      
echo FILE NAME: %rarfile%                           
echo FULL FILE LOCATION: %rarloc%\%rarfile%         
echo STATUS: EXTRACTED                              
echo PASSKEY: %fh%                                  
echo.
echo THANK YOU VERY MUCH FOR USING OUR PROGRAM
echo.
pause
del UnRAR.exe
exit