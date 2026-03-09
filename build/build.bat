@echo off
REM ═══════════════════════════════════════════════════════════
REM build.bat - Assemble the Zelda Genesis port into a ROM
REM All output logged to build_errors.txt
REM ═══════════════════════════════════════════════════════════

echo. > build_errors.txt
echo +---------------------------------------+ >> build_errors.txt
echo ^|   ZELDA NES-^>GENESIS PORT ASSEMBLER   ^| >> build_errors.txt
echo +---------------------------------------+ >> build_errors.txt
echo. >> build_errors.txt

echo +---------------------------------------+
echo ^|   ZELDA NES-^>GENESIS PORT ASSEMBLER   ^|
echo +---------------------------------------+
echo.

REM ── Detect Python launcher ──
REM Try known real install first, then PATH entries (WindowsApps stubs are unreliable)
set PYTHON=
if exist "%LOCALAPPDATA%\Python\bin\python.exe" set PYTHON=%LOCALAPPDATA%\Python\bin\python.exe
if "%PYTHON%"=="" if exist "%LOCALAPPDATA%\Programs\Python\Python314\python.exe" set PYTHON=%LOCALAPPDATA%\Programs\Python\Python314\python.exe
if "%PYTHON%"=="" if exist "%LOCALAPPDATA%\Programs\Python\Python313\python.exe" set PYTHON=%LOCALAPPDATA%\Programs\Python\Python313\python.exe
if "%PYTHON%"=="" if exist "%LOCALAPPDATA%\Programs\Python\Python312\python.exe" set PYTHON=%LOCALAPPDATA%\Programs\Python\Python312\python.exe
if "%PYTHON%"=="" if exist "C:\Python312\python.exe" set PYTHON=C:\Python312\python.exe
if "%PYTHON%"=="" if exist "C:\Python313\python.exe" set PYTHON=C:\Python313\python.exe
if "%PYTHON%"=="" (
    echo ERROR: No Python found >> build_errors.txt
    echo ERROR: No Python found. Python 3.14 is at %%LOCALAPPDATA%%\Python\bin\python.exe but could not be detected.
    pause & exit /b 1
)
echo Using Python: %PYTHON% >> build_errors.txt

if not exist vasmm68k_mot.exe (
    echo ERROR: vasmm68k_mot.exe not found! >> build_errors.txt
    echo ERROR: vasmm68k_mot.exe not found!
    pause & exit /b 1
)

if not exist ram_map.asm (
    echo ERROR: ram_map.asm not found! >> build_errors.txt
    echo ERROR: ram_map.asm missing - should be included in the project files!
    pause & exit /b 1
)

echo [1/5] Regenerating VDP-patched bank files...
echo [1/5] Regenerating VDP-patched bank files... >> build_errors.txt
"%PYTHON%" patch_vdp.py >> build_errors.txt 2>&1
if %errorlevel% neq 0 ( echo patch_vdp.py FAILED >> build_errors.txt & pause & exit /b 1 )

echo [2/5] Fixing ca65 syntax artifacts...
echo [2/5] Fixing ca65 syntax artifacts... >> build_errors.txt
"%PYTHON%" fix_syntax.py >> build_errors.txt 2>&1
if %errorlevel% neq 0 ( echo fix_syntax.py FAILED >> build_errors.txt & pause & exit /b 1 )

echo [3/5] Assembling with vasm...
echo [3/5] Assembling with vasm... >> build_errors.txt
vasmm68k_mot.exe -Fbin -m68000 -maxerrors=5000 -o zelda_raw.md main.asm >> build_errors.txt 2>&1

if %errorlevel% neq 0 (
    echo ASSEMBLY FAILED >> build_errors.txt
    echo ASSEMBLY FAILED - see build_errors.txt
    pause & exit /b 1
)

REM ── Auto-detect next version number ──
set VER=1
:ver_loop
if %VER% lss 10 (set VERPAD=0%VER%) else (set VERPAD=%VER%)
if exist "zelda_v%VERPAD%.md" ( set /a VER=%VER%+1 & goto ver_loop )
set ROMNAME=zelda_v%VERPAD%.md

echo [4/5] Fixing ROM checksum ^(output: %ROMNAME%^)...
echo [4/5] Fixing ROM checksum (output: %ROMNAME%)... >> build_errors.txt
"%PYTHON%" fix_checksum.py zelda_raw.md %ROMNAME% >> build_errors.txt 2>&1
if %errorlevel% neq 0 ( copy zelda_raw.md %ROMNAME% )

echo BUILD SUCCESS - %ROMNAME% is ready! >> build_errors.txt
echo.
echo +---------------------------------------+
echo ^|  %ROMNAME% is ready!
echo ^|  Drag it onto BlastEm.exe to test.   ^|
echo +---------------------------------------+
echo.
pause
