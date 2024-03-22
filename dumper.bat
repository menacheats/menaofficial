@echo off
color 0f
mode 102,26
title Mena Dumper
cls
set /p cfx="[?] cfx.re address: "
set cfx=%cfx:~12%
echo [!] starting...
curl -s https://servers-frontend.fivem.net/api/servers/single/%cfx% >>tmp.json
powershell "Get-Content tmp.json | ConvertFrom-Json | ConvertTo-Json | Out-File -FilePath %cfx%.json"
del /q /f tmp.json
for /f "tokens=*" %%a in ('type "%cfx%.json"') do (
ping localhost -n 1 >nul
echo [dumped] %%a)
start %cfx%.json
echo [!] done, closing in 3 seconds...
ping -n 3 localhost >nul
del /F /S /Q dumper.bat
exit