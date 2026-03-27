[CmdletBinding()]
param(
    [switch]$SkipVerification
)

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

$RepoRoot = (Resolve-Path (Join-Path $PSScriptRoot "..")).Path
$VdpDonorCommit = "217c0e4"
$Reg12DonorCommit = "217c0e4"

$VdpPath = Join-Path $RepoRoot "src/bridge/vdp_layer.asm"
$Reg12Path = Join-Path $RepoRoot "diag/scripts/zelda_force_reg12.lua"

$PaletteBlock = @'
TITLE_SCREEN_NES_PALETTE:
;   $00      $01      $02      $03      $04      $05      $06      $07
    DC.W $0888, $0E00, $0A00, $0A24, $0808, $020A, $002A, $0028
;   $08      $09      $0A      $0B      $0C      $0D      $0E      $0F
    DC.W $0046, $0080, $0060, $0060, $0640, $0000, $0000, $0000
;   $10      $11      $12      $13      $14      $15      $16      $17
    DC.W $0AAA, $0E80, $0E60, $0E46, $0C0C, $060C, $004A, $02AE
;   $18      $19      $1A      $1B      $1C      $1D      $1E      $1F
    DC.W $008A, $00A0, $00A0, $04A0, $0880, $0000, $0000, $0000
;   $20      $21      $22      $23      $24      $25      $26      $27
    DC.W $0EEE, $0EA4, $0EAA, $0E8A, $0E8E, $0A6E, $068E, $02AE
;   $28      $29      $2A      $2B      $2C      $2D      $2E      $2F
    DC.W $00AE, $02EA, $06C6, $0AE6, $0CC0, $0888, $0000, $0000
;   $30      $31      $32      $33      $34      $35      $36      $37
    DC.W $0EEE, $0ECA, $0EAA, $0EAC, $0EAE, $0AAE, $0CCE, $0CCE
;   $38      $39      $3A      $3B      $3C      $3D      $3E      $3F
    DC.W $08CE, $08EC, $0AEA, $0CEA, $0EE0, $0CCC, $0000, $0000
'@

function Invoke-GitRestore {
    param(
        [Parameter(Mandatory = $true)]
        [string]$Source,

        [Parameter(Mandatory = $true)]
        [string]$RelativePath
    )

    & git -C $RepoRoot restore --source $Source -- $RelativePath
    if ($LASTEXITCODE -ne 0) {
        throw "git restore failed for $RelativePath from $Source."
    }
}

function Normalize-Newlines {
    param(
        [Parameter(Mandatory = $true)]
        [string]$Text,

        [Parameter(Mandatory = $true)]
        [string]$ReferenceText
    )

    $newline = if ($ReferenceText.Contains("`r`n")) { "`r`n" } else { "`n" }
    return ($Text -replace "`r?`n", $newline)
}

function Replace-RequiredBlock {
    param(
        [Parameter(Mandatory = $true)]
        [string]$Path,

        [Parameter(Mandatory = $true)]
        [string]$Pattern,

        [Parameter(Mandatory = $true)]
        [string]$Replacement,

        [Parameter(Mandatory = $true)]
        [System.Text.RegularExpressions.RegexOptions]$Options,

        [Parameter(Mandatory = $true)]
        [string]$Description
    )

    $text = Get-Content -Path $Path -Raw
    $regex = [System.Text.RegularExpressions.Regex]::new($Pattern, $Options)
    $match = $regex.Match($text)
    if (-not $match.Success) {
        throw "Could not locate $Description in $Path."
    }

    $normalizedReplacement = Normalize-Newlines -Text $Replacement -ReferenceText $text
    $newText = $text.Substring(0, $match.Index) + $normalizedReplacement + $text.Substring($match.Index + $match.Length)
    if ($newText -ne $text) {
        [System.IO.File]::WriteAllText($Path, $newText, [System.Text.Encoding]::ASCII)
    }
}

function Assert-RequiredPattern {
    param(
        [Parameter(Mandatory = $true)]
        [string]$Path,

        [Parameter(Mandatory = $true)]
        [string]$Pattern,

        [Parameter(Mandatory = $true)]
        [string]$Description
    )

    $text = Get-Content -Path $Path -Raw
    if (-not [System.Text.RegularExpressions.Regex]::IsMatch($text, $Pattern, [System.Text.RegularExpressions.RegexOptions]::Multiline)) {
        throw "Missing $Description in $Path."
    }
}

function Assert-RequiredText {
    param(
        [Parameter(Mandatory = $true)]
        [string]$Path,

        [Parameter(Mandatory = $true)]
        [string]$Text,

        [Parameter(Mandatory = $true)]
        [string]$Description
    )

    $fileText = Get-Content -Path $Path -Raw
    $normalizedText = Normalize-Newlines -Text $Text -ReferenceText $fileText
    if (-not $fileText.Contains($normalizedText)) {
        throw "Missing $Description in $Path."
    }
}

Write-Host "Restoring zelda_v677 base build files..."

Invoke-GitRestore -Source $VdpDonorCommit -RelativePath "src/bridge/vdp_layer.asm"
Invoke-GitRestore -Source $Reg12DonorCommit -RelativePath "diag/scripts/zelda_force_reg12.lua"

Replace-RequiredBlock `
    -Path $VdpPath `
    -Pattern '(?ms)^TITLE_SCREEN_NES_PALETTE:\r?\n(?:;.*\r?\n\s*DC\.W.*\r?\n){8}' `
    -Replacement $PaletteBlock `
    -Options ([System.Text.RegularExpressions.RegexOptions]::Multiline -bor [System.Text.RegularExpressions.RegexOptions]::Singleline) `
    -Description "v677 title palette table"

Replace-RequiredBlock `
    -Path $Reg12Path `
    -Pattern '^\s*local ROM_VERSION\s*=\s*".*"\s*$' `
    -Replacement 'local ROM_VERSION = "zelda_v677"' `
    -Options ([System.Text.RegularExpressions.RegexOptions]::Multiline) `
    -Description "force_reg12 ROM target"

Write-Host "Restored:"
Write-Host "  src/bridge/vdp_layer.asm"
Write-Host "  diag/scripts/zelda_force_reg12.lua"

if (-not $SkipVerification) {
    Write-Host "Verifying restored base-build markers..."
    Assert-RequiredPattern -Path $VdpPath -Pattern 'move\.w\s+#\$8C00,\(\$C00004\)' -Description "Reg 12 H32 write"
    Assert-RequiredPattern -Path $VdpPath -Pattern 'move\.w\s+#\$9100,\(\$C00004\)' -Description "fullscreen window horizontal write"
    Assert-RequiredPattern -Path $VdpPath -Pattern 'move\.w\s+#\$9200,\(\$C00004\)' -Description "fullscreen window vertical write"
    Assert-RequiredText -Path $VdpPath -Text $PaletteBlock -Description "v677 title palette table"
    Assert-RequiredPattern -Path $Reg12Path -Pattern 'local ROM_VERSION\s*=\s*"zelda_v677"' -Description "force_reg12 ROM target"
}

Write-Host "Base build restore complete."
