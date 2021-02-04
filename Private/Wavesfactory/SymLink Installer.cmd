@Echo off
Echo ############################################################
Echo ##                                                        ##
Echo ##                   SymLink Installer                    ##
Echo ##                                                        ##
Echo ##                      !ATTENTION!                       ##
Echo ##                                                        ##
Echo ##  THIS CMD FILE CREATES A SYMLINKS FROM THE FOLDER /C/  ##
Echo ##      !Edit VST 2 paths in this file, if necessary!     ##
Echo ##                                                        ##
Echo ############################################################
chcp 861>nul

:: BatchGotAdmin BEGIN https://sites.google.com/site/eneerge/home/BatchGotAdmin | https://ss64.com/nt/rem.html | https://ss64.com/nt/cacls.html
:: Check for permissions
mkdir "%windir%\GotAdminTestCreateDir"
if '%errorlevel%' == '0' (
    rmdir "%windir%\GotAdminTestCreateDir" &goto gotAdmin
) else ( goto UACPrompt )




:UACPrompt
    echo Set UAC = CreateObject^("Shell.Application"^) > "%~dp0getadmin.vbs"
    echo UAC.ShellExecute "%~s0", "", "", "runas", 1 >> "%~dp0getadmin.vbs"

    "%~dp0getadmin.vbs"
    exit /B

:gotAdmin
    if exist "%~dp0getadmin.vbs" ( del "%~dp0getadmin.vbs" )
    pushd "%CD%"
    CD /D "%~dp0"
:: BatchGotAdmin END

:: x86? BEGIN
Set xOS=x64& If "%PROCESSOR_ARCHITECTURE%"=="x86" (
If Not Defined PROCESSOR_ARCHITEW6432 Set xOS=x86
)
Echo OS - %xOS%
If "%xOS%"=="x86" (
  goto x86Windows
) Else (
  goto x64Windows
)
:: x86? END

GOTO START_POINT
:: Source Directories Structure BEGIN

Note: Characters "- ", before these lines, mean - "not for x86 Windows".


- C\Program Files\Common Files\Avid\Audio\Plug-Ins\Wavesfactory
- C\Program Files\Common Files\VST3\Wavesfactory
C\Program Files (x86)\VSTPlugins\Wavesfactory
- C\Program Files\VSTPlugins\Wavesfactory
C\Users\(Current User Name)\AppData\Roaming\Wavesfactory



:: Source Directories Structure END
:START_POINT

:x64Windows
:: x64 Windows BEGIN


cmd /c mkdir "%COMMONPROGRAMFILES%\Avid\Audio\Plug-Ins"
cmd /c mklink /j "%COMMONPROGRAMFILES%\Avid\Audio\Plug-Ins\Wavesfactory" "%~dp0C\Program Files\Common Files\Avid\Audio\Plug-Ins\Wavesfactory"
cmd /c mkdir "%COMMONPROGRAMFILES%\VST3"
cmd /c mklink /j "%COMMONPROGRAMFILES%\VST3\Wavesfactory" "%~dp0C\Program Files\Common Files\VST3\Wavesfactory"
REM cmd /c mkdir "%PROGRAMFILES(x86)%\VSTPlugins"
REM cmd /c mklink /j "%PROGRAMFILES(x86)%\VSTPlugins\Wavesfactory" "%~dp0C\Program Files (x86)\VSTPlugins\Wavesfactory"
cmd /c mkdir "%PROGRAMFILES%\VSTPlugins"
cmd /c mklink /j "%PROGRAMFILES%\VSTPlugins\Wavesfactory" "%~dp0C\Program Files\VSTPlugins\Wavesfactory"
cmd /c mklink /j "%USERPROFILE%\AppData\Roaming\Wavesfactory" "%~dp0C\Users\(Current User Name)\AppData\Roaming\Wavesfactory"
REM cmd /c mkdir "%COMMONPROGRAMFILES(x86)%\VST3"
REM cmd /c mklink /j "%COMMONPROGRAMFILES(x86)%\VST3\Wavesfactory" "%~dp0C\Program Files (x86)\Common Files\VST3\Wavesfactory"


CD /d "%~dp0"
:: [[[OPTIONAL: IT IS A PLACE FOR ADDITIONAL x64 Windows COMMANDS]]]

:: x64 Windows END
goto OUT

:x86Windows
:: x86 Windows BEGIN


cmd /c mkdir "%PROGRAMFILES%\VSTPlugins"
cmd /c mklink /j "%PROGRAMFILES%\VSTPlugins\Wavesfactory" "%~dp0C\Program Files (x86)\VSTPlugins\Wavesfactory"
cmd /c mklink /j "%USERPROFILE%\AppData\Roaming\Wavesfactory" "%~dp0C\Users\(Current User Name)\AppData\Roaming\Wavesfactory"
cmd /c mkdir "%COMMONPROGRAMFILES%\VST3"
cmd /c mklink /j "%COMMONPROGRAMFILES%\VST3\Wavesfactory" "%~dp0C\Program Files (x86)\Common Files\VST3\Wavesfactory"


CD /d "%~dp0"
:: [[[OPTIONAL: IT IS A PLACE FOR ADDITIONAL x86 Windows COMMANDS]]]

:: x86 Windows END
goto OUT

:OUT
PAUSE
EXIT

