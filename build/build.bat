@echo off
setlocal EnableExtensions

for %%I in ("%~dp0..") do set "ROOT=%%~fI"
set "RAW_ROM=%ROOT%\build\zelda_raw.md"
set "OUT_ROM="
set "OUT_LST="
set "PYTHON="

if exist "%LOCALAPPDATA%\Python\bin\python.exe" set "PYTHON=%LOCALAPPDATA%\Python\bin\python.exe"
if "%PYTHON%"=="" if exist "%LOCALAPPDATA%\Python\pythoncore-3.14-64\python.exe" set "PYTHON=%LOCALAPPDATA%\Python\pythoncore-3.14-64\python.exe"
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


REM --- Find highest zelda_v###.md in build dir and set VER to next available ---
setlocal EnableDelayedExpansion
set "MAXVER=0"
for %%F in ("%ROOT%\build\zelda_v*.md") do (
    set "FN=%%~nxF"
    for /f "tokens=2 delims=_v." %%A in ("!FN!") do (
        set /a CURVER=%%A
        if !CURVER! gtr !MAXVER! set /a MAXVER=!CURVER!
    )
)
set /a VER=MAXVER+1
if !VER! lss 10 (set "VERPAD=0!VER!") else (set "VERPAD=!VER!")
endlocal & set "VER=%VER%" & set "VERPAD=%VERPAD%"
set "OUT_ROM=%ROOT%\build\zelda_v%VERPAD%.md"
set "OUT_LST=%ROOT%\build\zelda_v%VERPAD%.lst"

echo [1/10] Regenerating VDP bank files...
pushd "%ROOT%\src\banks\generated" >nul
"%PYTHON%" "%ROOT%\tools\patch_vdp.py"
if errorlevel 1 (
    popd >nul
    exit /b 1
)
popd >nul

echo [2/10] Cleaning translated syntax...
pushd "%ROOT%\src\banks\generated_vdp" >nul
"%PYTHON%" "%ROOT%\tools\fix_syntax.py"
if errorlevel 1 (
    popd >nul
    exit /b 1
)
popd >nul

echo [3/10] Fixing carry inversions (BCC/BCS after CMP)...
"%PYTHON%" "%ROOT%\tools\fix_carry_inversions.py"
if errorlevel 1 exit /b 1

echo [4/10] Fixing ADC carry (immediate ADDX)...
"%PYTHON%" "%ROOT%\tools\fix_adc_carry.py"
if errorlevel 1 exit /b 1

echo [5/10] Fixing 16-bit ADC carry chains...
"%PYTHON%" "%ROOT%\tools\fix_adc_chain.py"
if errorlevel 1 exit /b 1

echo [6/10] Fixing 16-bit SBC borrow chains...
"%PYTHON%" "%ROOT%\tools\fix_sbc_chain.py"
if errorlevel 1 exit /b 1

echo [7/10] Fixing INC/DEC carry corruption...
"%PYTHON%" "%ROOT%\tools\fix_inc_carry_corruption.py"
if errorlevel 1 exit /b 1

echo [8/10] Fixing BIT instruction translation...
"%PYTHON%" "%ROOT%\tools\fix_bit_instruction.py"
if errorlevel 1 exit /b 1

echo [9/10] Assembling Genesis ROM...
pushd "%ROOT%\src" >nul
"%ROOT%\build\toolchain\vasmm68k_mot.exe" -Fbin -m68000 -maxerrors=5000 -Iincludes -Ibridge -Ibanks\generated_vdp -I..\reference -L "%OUT_LST%" -o "%RAW_ROM%" main.asm
if errorlevel 1 (
    popd >nul
    exit /b 1
)
popd >nul

echo [10/10] Fixing checksum...
"%PYTHON%" "%ROOT%\tools\fix_checksum.py" "%RAW_ROM%" "%OUT_ROM%"
if errorlevel 1 exit /b 1

echo.
echo Build complete: %OUT_ROM%
echo Listing: %OUT_LST%
exit /b 0
