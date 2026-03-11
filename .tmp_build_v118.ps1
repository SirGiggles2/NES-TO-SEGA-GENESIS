$root = 'C:\Users\Jake Diggity\Documents\GitHub\NES-TO-SEGA-GENESIS'
$tmpRoot = Join-Path $root '.tmp_v118_override'
$tmp = Join-Path $tmpRoot 'generated_vdp'

if (Test-Path $tmpRoot) {
    Remove-Item $tmpRoot -Recurse -Force
}

New-Item -ItemType Directory -Path $tmp | Out-Null

$src = Join-Path $root 'src\banks\generated_vdp\bank_02_gen68k_vdp.asm'
$dst = Join-Path $tmp 'bank_02_gen68k_vdp.asm'
Copy-Item $src $dst -Force

$text = Get-Content $dst -Raw
$text = $text -replace 'BSR\s+sub_b02_resolve_demo_manual_text_ptr\r?\n\s*MOVE\.B\s+\(A0,D2\.W\),D0', "MOVEA.W D5,A1`r`n`r`n    MOVEA.L A1,A0`r`n    ADDA.L  #`$FF0000,A0`r`n    MOVE.B  (A0,D2.W),D0"
$text = [regex]::Replace(
    $text,
    'sub_b02_resolve_demo_manual_text_ptr:.*?b02_tbl_demo_manual_text_ptrs:.*?DC\.L _off002_9475_1C_triforce\r?\n\r?\n',
    '',
    [System.Text.RegularExpressions.RegexOptions]::Singleline
)
[System.IO.File]::WriteAllText($dst, $text, [System.Text.UTF8Encoding]::new($false))

$asm = Join-Path $root 'build\toolchain\vasmm68k_mot.exe'
$py = 'C:\Program Files\LibreOffice\program\python.exe'
$raw = Join-Path $root 'build\zelda_raw.md'
$out = Join-Path $root 'build\zelda_v118.md'
$lst = Join-Path $root 'build\zelda_v118.lst'

Push-Location (Join-Path $root 'src')
& $asm -Fbin -m68000 -maxerrors=5000 -I$tmp -Iincludes -Ibridge -I'banks\generated_vdp' -I'..\reference' -L $lst -o $raw main.asm
$code = $LASTEXITCODE
Pop-Location

if ($code -ne 0) {
    exit $code
}

& $py (Join-Path $root 'tools\fix_checksum.py') $raw $out
exit $LASTEXITCODE
