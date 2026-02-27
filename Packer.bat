@echo off
setlocal

REM === Navn på pack (uden filendelse) ===
set "PACK=ECHO-Raid-Pack"

REM === Destination til BlishHUD markers ===
set "DEST=C:\Users\merik\OneDrive\Dokumenter\Guild Wars 2\addons\blishhud\markers"

REM === Slet gammel zip og taco hvis de findes ===
if exist "%PACK%.zip"  del /q "%PACK%.zip"
if exist "%PACK%.taco" del /q "%PACK%.taco"

REM === Tjek at Data-mappen findes ===
if not exist "Data\" exit /b 1

REM === Lav zip med Windows PowerShell ===
powershell -NoProfile -ExecutionPolicy Bypass ^
  "if (Test-Path '%PACK%.zip') { Remove-Item '%PACK%.zip' -Force };" ^
  "$items = @();" ^
  "if (Test-Path 'Data') { $items += (Resolve-Path 'Data').Path };" ^
  "$items += Get-ChildItem -Filter '*.xml' -File | ForEach-Object { $_.FullName };" ^
  "if ($items.Count -eq 0) { throw 'Ingen Data-mappe eller XML-filer fundet.' }" ^
  "Compress-Archive -Path $items -DestinationPath '%PACK%.zip' -Force"

if errorlevel 1 exit /b 1

REM === Omdøb zip -> taco ===
ren "%PACK%.zip" "%PACK%.taco"

REM === Kopiér til BlishHUD markers (overskriv hvis findes) ===
move /Y "%PACK%.taco" "%DEST%\%PACK%.taco" >nul

endlocal
exit