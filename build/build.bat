@echo off
setlocal EnableExtensions

for %%I in ("%~dp0..") do set "ROOT=%%~fI"
set "RAW_ROM=%ROOT%\build\zelda_raw.md"
set "OUT_ROM="
set "OUT_LST="
set "PYTHON="

if exist "%LOCALAPPDATA%\Python\bin\python.exe" set "PYTHON=%LOCALAPPDATA%\Python\bin\python.exe"
if "%PYTHON%"=="" if exist "%LOCALAPPDATA%\Programs\Python\Python314\python.exe" set "PYTHON=%LOCALAPPDATA%\Programs\Python\Python314\python.exe"
if "%PYTHON%"=="" if exist "%LOCALAPPDATA%\Programs\Python\Python313\python.exe" set "PYTHON=%LOCALAPPDATA%\Programs\Python\Python313\python.exe"
if "%PYTHON%"=="" if exist "%LOCALAPPDATA%\Programs\Python\Python312\python.exe" set "PYTHON=%LOCALAPPDATA%\Programs\Python\Python312\python.exe"
if "%PYTHON%"=="" if exist "C:\Python312\python.exe" set "PYTHON=C:\Python312\python.exe"
if "%PYTHON%"=="" if exist "C:\Python313\python.exe" set "PYTHON=C:\Python313\python.exe"

if "%PYTHON%"=="" (
    echo ERROR: Python was not found.
    exit /b 1
)

if not exist "%ROOT%\build\toolchain\vasmm68k_mot.exe" (
    echo ERROR: Missing assembler at %ROOT%\build\toolchain\vasmm68k_mot.exe
    exit /b 1
)

if not exist "%ROOT%\src\main.asm" (
    echo ERROR: Missing source file %ROOT%\src\main.asm
    exit /b 1
)

set /a VER=1
:ver_loop
if %VER% lss 10 (set "VERPAD=0%VER%") else (set "VERPAD=%VER%")
if exist "%ROOT%\build\zelda_v%VERPAD%.md" (
    set /a VER+=1
    goto ver_loop
)
set "OUT_ROM=%ROOT%\build\zelda_v%VERPAD%.md"
set "OUT_LST=%ROOT%\build\zelda_v%VERPAD%.lst"

echo [1/4] Regenerating VDP bank files...
pushd "%ROOT%\src\banks\generated" >nul
"%PYTHON%" "%ROOT%\tools\patch_vdp.py"
if errorlevel 1 (
    popd >nul
    exit /b 1
)
popd >nul

echo [2/4] Cleaning translated syntax...
pushd "%ROOT%\src\banks\generated_vdp" >nul
"%PYTHON%" "%ROOT%\tools\fix_syntax.py"
if errorlevel 1 (
    popd >nul
    exit /b 1
)
popd >nul

echo [3/4] Assembling Genesis ROM...
pushd "%ROOT%\src" >nul
"%ROOT%\build\toolchain\vasmm68k_mot.exe" -Fbin -m68000 -maxerrors=5000 -Iincludes -Ibridge -Ibanks\generated_vdp -I..\reference -L "%OUT_LST%" -o "%RAW_ROM%" main.asm
if errorlevel 1 (
    popd >nul
    exit /b 1
)
popd >nul

echo [4/4] Fixing checksum...
"%PYTHON%" "%ROOT%\tools\fix_checksum.py" "%RAW_ROM%" "%OUT_ROM%"
if errorlevel 1 exit /b 1

echo.
echo Build complete: %OUT_ROM%
echo Listing: %OUT_LST%
exit /b 0
