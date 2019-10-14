@echo off

:variables (
rem locations of script files (%~dp0 means same directory as this file)
rem it is recommended that you use absolute paths.
    set psscript=%~dp0\run.ps1
    set cscript=%~dp0\script.cs
)

:main (
rem fetch powershell version, recommend 3 or higher
    call :getPSVer
    if %psver% LEQ 2 (
        echo WARNING: You are running Powershell v2 or lower, please consider updating.
        echo You will be running .NET 2 or lower.
        echo.
    )

rem write powershell script for executing c# files
    echo $code = Get-Content '%cscript%'>%psscript%
    echo Add-Type -TypeDefinition "$code">>%psscript%
    echo.>>%psscript%
    echo $listArgs = New-Object System.Collections.Generic.List[String]>>%psscript%
    for %%A in (%*) do (
        echo $listArgs.Add("%%A"^)>>%psscript%
    )
    echo.>>%psscript%
    echo [Program]::Main($listArgs)>>%psscript%

rem run powershell script
    powershell -noprofile -executionpolicy bypass -file %psscript%

rem remove script after done
    if exist %psscript% (
        del %psscript%
    )
    goto :eof
)

rem fetch powershell version
rem returns %psver%
:getPSVer (
    for /f "delims=" %%I in ('powershell -command (get-host^).version.major') do set psver=%%I
    goto :eof
)
