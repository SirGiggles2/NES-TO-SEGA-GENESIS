@echo off
setlocal EnableExtensions

for %%I in ("%~dp0..") do set "ROOT=%%~fI"
set "RAW_ROM="
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

set /a VER=1
:ver_loop
if %VER% lss 10 (set "VERPAD=0%VER%") else (set "VERPAD=%VER%")
if exist "%ROOT%\build\zelda_v%VERPAD%.md" (
    set /a VER+=1
    goto ver_loop
)
set "RAW_ROM=%ROOT%\build\zelda_v%VERPAD%_raw.md"
set "OUT_ROM=%ROOT%\build\zelda_v%VERPAD%.md"
set "OUT_LST=%ROOT%\build\zelda_v%VERPAD%.lst"

echo [1/15] Regenerating VDP bank files...
pushd "%ROOT%\src\banks\generated" >nul
"%PYTHON%" "%ROOT%\tools\patch_vdp.py"
if errorlevel 1 (
    popd >nul
    exit /b 1
)
popd >nul

echo [2/15] Cleaning translated syntax...
pushd "%ROOT%\src\banks\generated_vdp" >nul
"%PYTHON%" "%ROOT%\tools\fix_syntax.py"
if errorlevel 1 (
    popd >nul
    exit /b 1
)
popd >nul

echo [3/15] Fixing carry inversions (BCC/BCS after CMP)...
"%PYTHON%" "%ROOT%\tools\fix_carry_inversions.py"
if errorlevel 1 exit /b 1

echo [4/15] Fixing ADC carry (immediate ADDX)...
"%PYTHON%" "%ROOT%\tools\fix_adc_carry.py"
if errorlevel 1 exit /b 1

echo [5/15] Fixing 16-bit ADC carry chains...
"%PYTHON%" "%ROOT%\tools\fix_adc_chain.py"
if errorlevel 1 exit /b 1

echo [6/15] Fixing 16-bit SBC borrow chains...
"%PYTHON%" "%ROOT%\tools\fix_sbc_chain.py"
if errorlevel 1 exit /b 1

echo [7/15] Fixing INC/DEC carry corruption...
"%PYTHON%" "%ROOT%\tools\fix_inc_carry_corruption.py"
if errorlevel 1 exit /b 1

echo [8/15] Fixing BIT instruction translation...
"%PYTHON%" "%ROOT%\tools\fix_bit_instruction.py"
if errorlevel 1 exit /b 1

echo [9/15] PPU buffer safety check...
"%PYTHON%" "%ROOT%\tools\check_ppu_buffer_safety.py" --file "%ROOT%\src\banks\generated_vdp\bank_06_gen68k_vdp.asm"
if errorlevel 1 exit /b 1

echo [10/15] VDP title regression guard...
"%PYTHON%" "%ROOT%\tools\check_vdp_title_regressions.py" --file "%ROOT%\src\bridge\vdp_layer.asm"
if errorlevel 1 exit /b 1

echo [11/15] Frontend palette calibration check...
"%PYTHON%" "%ROOT%\tools\check_frontend_palette_calibration.py" --file "%ROOT%\src\bridge\vdp_layer.asm"
if errorlevel 1 exit /b 1

echo [12/15] Assembling Genesis ROM...
pushd "%ROOT%\src" >nul
"%ROOT%\build\toolchain\vasmm68k_mot.exe" -Fbin -m68000 -maxerrors=5000 -Iincludes -Ibridge -Ibanks\generated_vdp -I..\reference -L "%OUT_LST%" -o "%RAW_ROM%" main.asm
if errorlevel 1 (
    popd >nul
    exit /b 1
)
popd >nul

echo [13/15] Fixing checksum...
"%PYTHON%" "%ROOT%\tools\fix_checksum.py" "%RAW_ROM%" "%OUT_ROM%"
if errorlevel 1 exit /b 1

echo [14/15] Register safety check...
"%PYTHON%" "%ROOT%\tools\check_register_safety.py"
if errorlevel 1 (
    echo WARNING: Register safety check found failures ^^!
    echo The ROM was still built, but review the issues above.
)

echo [15/15] Static score...
"%PYTHON%" "%ROOT%\tools\static_score.py" --lst "%OUT_LST%"

echo.
echo Build complete: %OUT_ROM%
echo Listing: %OUT_LST%
exit /b 0
