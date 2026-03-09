@echo off
setlocal EnableExtensions EnableDelayedExpansion
REM ═══════════════════════════════════════════════════════════
REM build.bat - Assemble the Zelda Genesis port into a ROM
REM All output logged to build_errors.txt
REM ═══════════════════════════════════════════════════════════

set "SCRIPT_DIR=%~dp0"
for %%I in ("%SCRIPT_DIR%..") do set "REPO_ROOT=%%~fI"
set "TOOLCHAIN_DIR=%SCRIPT_DIR%toolchain"
set "LOG_FILE=%SCRIPT_DIR%build_errors.txt"
set "PYTHON="

echo. > "%LOG_FILE%"
echo +---------------------------------------+ >> "%LOG_FILE%"
echo ^|   ZELDA NES-^>GENESIS PORT ASSEMBLER   ^| >> "%LOG_FILE%"
echo +---------------------------------------+ >> "%LOG_FILE%"
echo. >> "%LOG_FILE%"

echo +---------------------------------------+
echo ^|   ZELDA NES-^>GENESIS PORT ASSEMBLER   ^|
echo +---------------------------------------+
echo.

echo Repo root: %REPO_ROOT% >> "%LOG_FILE%"
echo Script dir: %SCRIPT_DIR% >> "%LOG_FILE%"
echo Toolchain: %TOOLCHAIN_DIR% >> "%LOG_FILE%"

REM ── Detect Python launcher ──
if exist "%LOCALAPPDATA%\Python\bin\python.exe" set "PYTHON=%LOCALAPPDATA%\Python\bin\python.exe"
if "%PYTHON%"=="" if exist "%LOCALAPPDATA%\Programs\Python\Python314\python.exe" set "PYTHON=%LOCALAPPDATA%\Programs\Python\Python314\python.exe"
if "%PYTHON%"=="" if exist "%LOCALAPPDATA%\Programs\Python\Python313\python.exe" set "PYTHON=%LOCALAPPDATA%\Programs\Python\Python313\python.exe"
if "%PYTHON%"=="" if exist "%LOCALAPPDATA%\Programs\Python\Python312\python.exe" set "PYTHON=%LOCALAPPDATA%\Programs\Python\Python312\python.exe"
if "%PYTHON%"=="" if exist "C:\Python314\python.exe" set "PYTHON=C:\Python314\python.exe"
if "%PYTHON%"=="" if exist "C:\Python313\python.exe" set "PYTHON=C:\Python313\python.exe"
if "%PYTHON%"=="" if exist "C:\Python312\python.exe" set "PYTHON=C:\Python312\python.exe"
if "%PYTHON%"=="" (
    where py >nul 2>&1
    if !errorlevel! equ 0 set "PYTHON=py -3"
)
if "%PYTHON%"=="" (
    where python >nul 2>&1
    if !errorlevel! equ 0 set "PYTHON=python"
)

if "%PYTHON%"=="" (
    echo ERROR: No Python found >> "%LOG_FILE%"
    echo ERROR: No Python found.
    pause & exit /b 1
)
echo Using Python: %PYTHON% >> "%LOG_FILE%"

if not exist "%TOOLCHAIN_DIR%\vasmm68k_mot.exe" (
    echo ERROR: %TOOLCHAIN_DIR%\vasmm68k_mot.exe not found! >> "%LOG_FILE%"
    echo ERROR: vasmm68k_mot.exe not found!
    pause & exit /b 1
)

if not exist "%REPO_ROOT%\src\main.asm" (
    echo ERROR: src\main.asm not found! >> "%LOG_FILE%"
    echo ERROR: src\main.asm missing.
    pause & exit /b 1
)

echo [1/6] Regenerating VDP-patched bank files...
echo [1/6] Regenerating VDP-patched bank files... >> "%LOG_FILE%"
pushd "%REPO_ROOT%\src\banks\generated"
%PYTHON% "%REPO_ROOT%\tools\patch_vdp.py" >> "%LOG_FILE%" 2>&1
if %errorlevel% neq 0 ( popd & echo patch_vdp.py FAILED >> "%LOG_FILE%" & pause & exit /b 1 )
popd

echo [2/6] Fixing ca65 syntax artifacts...
echo [2/6] Fixing ca65 syntax artifacts... >> "%LOG_FILE%"
pushd "%REPO_ROOT%\src\banks\generated"
%PYTHON% "%REPO_ROOT%\tools\fix_syntax.py" >> "%LOG_FILE%" 2>&1
if %errorlevel% neq 0 ( popd & echo fix_syntax.py FAILED >> "%LOG_FILE%" & pause & exit /b 1 )
popd

echo [3/6] Regenerating RAM map for current bank outputs...
echo [3/6] Regenerating RAM map for current bank outputs... >> "%LOG_FILE%"
pushd "%REPO_ROOT%\src\banks\generated"
%PYTHON% "%REPO_ROOT%\tools\make_ram_map.py" >> "%LOG_FILE%" 2>&1
if %errorlevel% neq 0 ( popd & echo make_ram_map.py FAILED >> "%LOG_FILE%" & pause & exit /b 1 )
copy /Y ram_map.asm "%REPO_ROOT%\src\includes\ram_map.asm" >> "%LOG_FILE%" 2>&1
if %errorlevel% neq 0 ( popd & echo copy ram_map.asm FAILED >> "%LOG_FILE%" & pause & exit /b 1 )
popd

echo [4/6] Assembling with vasm...
echo [4/6] Assembling with vasm... >> "%LOG_FILE%"
"%TOOLCHAIN_DIR%\vasmm68k_mot.exe" -Fbin -m68000 -maxerrors=5000 ^
    -I"%REPO_ROOT%\src\bridge" ^
    -I"%REPO_ROOT%\src\includes" ^
    -I"%REPO_ROOT%\src\banks\generated" ^
    -I"%REPO_ROOT%\reference" ^
    -o "%REPO_ROOT%\artifacts\roms\zelda_raw.md" "%REPO_ROOT%\src\main.asm" >> "%LOG_FILE%" 2>&1

if %errorlevel% neq 0 (
    echo ASSEMBLY FAILED >> "%LOG_FILE%"
    echo ASSEMBLY FAILED - see %LOG_FILE%
    pause & exit /b 1
)

REM ── Auto-detect next version number under artifacts/roms ──
set VER=1
:ver_loop
if %VER% lss 10 (set VERPAD=0%VER%) else (set VERPAD=%VER%)
if exist "%REPO_ROOT%\artifacts\roms\zelda_v%VERPAD%.md" ( set /a VER=%VER%+1 & goto ver_loop )
set "ROMNAME=zelda_v%VERPAD%.md"

echo [5/6] Fixing ROM checksum ^(output: %ROMNAME%^)...
echo [5/6] Fixing ROM checksum (output: %ROMNAME%)... >> "%LOG_FILE%"
%PYTHON% "%REPO_ROOT%\tools\fix_checksum.py" "%REPO_ROOT%\artifacts\roms\zelda_raw.md" "%REPO_ROOT%\artifacts\roms\%ROMNAME%" >> "%LOG_FILE%" 2>&1
if %errorlevel% neq 0 ( copy /Y "%REPO_ROOT%\artifacts\roms\zelda_raw.md" "%REPO_ROOT%\artifacts\roms\%ROMNAME%" >nul )

echo [6/6] Build complete. >> "%LOG_FILE%"
echo BUILD SUCCESS - %ROMNAME% is ready! >> "%LOG_FILE%"
echo.
echo +---------------------------------------+
echo ^|  %ROMNAME% is ready!
echo ^|  Path: artifacts\roms\%ROMNAME%
echo +---------------------------------------+
echo.
pause
endlocal
